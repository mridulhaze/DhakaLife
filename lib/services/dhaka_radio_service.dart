import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:audio_session/audio_session.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_radio_station.dart';

class DhakaRadioService extends GetxService {
  static DhakaRadioService get to => Get.find<DhakaRadioService>();

  late final AudioPlayer _player;

  final RxList<DhakaRadioStation> stations = <DhakaRadioStation>[].obs;
  final Rx<DhakaRadioStation?> currentStation = Rx<DhakaRadioStation?>(null);
  final RxBool isPlaying = false.obs;
  final RxBool isBuffering = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxDouble volume = 1.0.obs;

  final RxSet<String> favoriteIds = <String>{}.obs;
  final RxList<String> recentStationIds = <String>[].obs;
  final RxMap<String, Map<String, dynamic>> diagnosticResults =
      <String, Map<String, dynamic>>{}.obs;

  StreamSubscription? _playerStateSubscription;
  StreamSubscription? _playbackEventSubscription;
  StreamSubscription? _interruptionSubscription;
  StreamSubscription? _noisySubscription;

  AudioPlayer get player => _player;

  static const String _prefKeyFavorites = 'dhaka_radio_favorites_v1';
  static const String _prefKeyRecents = 'dhaka_radio_recents_v1';
  static const String _prefKeyDiagnostics = 'dhaka_radio_diagnostics_v1';

  @override
  void onInit() {
    super.onInit();
    _initPlayer();
    _initAudioSession();
    _loadPreferences();
    loadStations();
  }

  void _initPlayer() {
    _player = AudioPlayer();

    _playerStateSubscription = _player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
      isBuffering.value = state.processingState == ProcessingState.buffering ||
          state.processingState == ProcessingState.loading;
      if (state.processingState == ProcessingState.completed) {
        isPlaying.value = false;
      }
    }, onError: (Object e, StackTrace st) {
      debugPrint('Radio player state error: $e');
      hasError.value = true;
      errorMessage.value = 'রেডিও স্ট্রিমে সমস্যা দেখা দিয়েছে।';
      isBuffering.value = false;
      isPlaying.value = false;
    });

    _playbackEventSubscription = _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace st) {
      debugPrint('Radio playback event error: $e');
      hasError.value = true;
      errorMessage.value = 'নেটওয়ার্ক সংযোগ বিঘ্নিত হয়েছে। পুনরায় চেষ্টা করুন।';
      isBuffering.value = false;
    });
  }

  Future<void> _initAudioSession() async {
    try {
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.music());

      _interruptionSubscription = session.interruptionEventStream.listen((event) {
        if (event.begin) {
          switch (event.type) {
            case AudioInterruptionType.duck:
              _player.setVolume(0.3);
              break;
            case AudioInterruptionType.pause:
            case AudioInterruptionType.unknown:
              if (_player.playing) {
                _player.pause();
              }
              break;
          }
        } else {
          switch (event.type) {
            case AudioInterruptionType.duck:
              _player.setVolume(volume.value);
              break;
            case AudioInterruptionType.pause:
              _player.play();
              break;
            case AudioInterruptionType.unknown:
              break;
          }
        }
      });

      _noisySubscription = session.becomingNoisyEventStream.listen((_) {
        // Earphones unplugged -> pause to prevent blasting speakers
        if (_player.playing) {
          _player.pause();
        }
      });
    } catch (e) {
      debugPrint('Error configuring AudioSession: $e');
    }
  }

  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favList = prefs.getStringList(_prefKeyFavorites) ?? [];
      favoriteIds.assignAll(favList);

      final recList = prefs.getStringList(_prefKeyRecents) ?? [];
      recentStationIds.assignAll(recList);

      final diagJson = prefs.getString(_prefKeyDiagnostics);
      if (diagJson != null) {
        final decoded = jsonDecode(diagJson) as Map<String, dynamic>;
        diagnosticResults.assignAll(
          decoded.map((k, v) => MapEntry(k, Map<String, dynamic>.from(v as Map))),
        );
      }
    } catch (e) {
      debugPrint('Error loading radio preferences: $e');
    }
  }

  Future<void> _savePreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_prefKeyFavorites, favoriteIds.toList());
      await prefs.setStringList(_prefKeyRecents, recentStationIds.toList());
      await prefs.setString(_prefKeyDiagnostics, jsonEncode(diagnosticResults));
    } catch (e) {
      debugPrint('Error saving radio preferences: $e');
    }
  }

  Future<void> loadStations() async {
    try {
      final jsonStr = await rootBundle.loadString('assets/data/bangla_radio.json');
      final List<dynamic> list = jsonDecode(jsonStr);
      final loaded = list
          .map((item) => DhakaRadioStation.fromJson(item as Map<String, dynamic>))
          .where((s) => s.enabled)
          .toList();

      if (loaded.isNotEmpty) {
        stations.assignAll(loaded);
        return;
      }
    } catch (e) {
      debugPrint('Could not load assets/data/bangla_radio.json: $e');
    }

    // Fallback to embedded default stations
    stations.assignAll(DhakaRadioStation.defaultStations);
  }

  bool isFavorite(String stationId) => favoriteIds.contains(stationId);

  Future<void> toggleFavorite(String stationId) async {
    if (favoriteIds.contains(stationId)) {
      favoriteIds.remove(stationId);
    } else {
      favoriteIds.add(stationId);
    }
    await _savePreferences();
  }

  void _recordRecent(String stationId) {
    recentStationIds.remove(stationId);
    recentStationIds.insert(0, stationId);
    if (recentStationIds.length > 8) {
      recentStationIds.removeLast();
    }
    _savePreferences();
  }

  Future<void> playStation(DhakaRadioStation station) async {
    if (station.isWebOnly || !station.hasDirectStream) {
      // Direct stream not available -> fallback to official website/player
      await openStationWebsite(station);
      return;
    }

    try {
      hasError.value = false;
      errorMessage.value = '';
      currentStation.value = station;
      isBuffering.value = true;

      _recordRecent(station.id);

      final mediaItem = MediaItem(
        id: station.id,
        album: 'ঢাকা লাইফ রেডিও',
        title: station.nameBn,
        artist: station.tagline,
        artUri: Uri.parse(
          'https://raw.githubusercontent.com/mridulhaze/DhakaLife/main/assets/images/dhakalife_logo.png',
        ),
        displayTitle: station.nameBn,
        displaySubtitle: '${station.frequency} • ${station.category}',
      );

      final audioSource = AudioSource.uri(
        Uri.parse(station.streamUrl),
        tag: mediaItem,
      );

      await _player.stop();
      await _player.setAudioSource(audioSource).timeout(
        const Duration(seconds: 12),
        onTimeout: () {
          throw TimeoutException('রেডিও স্ট্রিমটি সাড়া দিচ্ছে না (Timeout)।');
        },
      );

      await _player.play();
      isPlaying.value = true;
      isBuffering.value = false;
    } catch (e) {
      debugPrint('Error playing station ${station.nameBn}: $e');
      hasError.value = true;
      errorMessage.value =
          'স্টেশন সংযোগ পাওয়া যায়নি। অন্য স্টেশন নির্বাচন করুন অথবা অফিসিয়াল ওয়েবসাইটে শুনুন।';
      isBuffering.value = false;
      isPlaying.value = false;
    }
  }

  Future<void> togglePlayPause() async {
    if (currentStation.value == null) {
      final firstPlayable = stations.firstWhereOrNull((s) => s.hasDirectStream);
      if (firstPlayable != null) {
        await playStation(firstPlayable);
      }
      return;
    }

    try {
      if (_player.playing) {
        await _player.pause();
      } else {
        await _player.play();
      }
    } catch (e) {
      debugPrint('Toggle error: $e');
    }
  }

  Future<void> stop() async {
    try {
      await _player.stop();
      currentStation.value = null;
      isPlaying.value = false;
      isBuffering.value = false;
      hasError.value = false;
    } catch (e) {
      debugPrint('Stop error: $e');
    }
  }

  Future<void> setVolume(double val) async {
    volume.value = val.clamp(0.0, 1.0);
    await _player.setVolume(volume.value);
  }

  Future<bool> openStationWebsite(DhakaRadioStation station) async {
    if (station.websiteUrl.isEmpty) return false;
    try {
      final uri = Uri.parse(station.websiteUrl);
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Failed to open station website: $e');
      return false;
    }
  }

  // Diagnostic stream testing
  Future<Map<String, dynamic>> testStream(DhakaRadioStation station) async {
    if (!station.hasDirectStream) {
      final res = {
        'status': 'fallback_web',
        'isLive': false,
        'message': 'অফিসিয়াল ওয়েব প্লেয়ার (নো ডিরেক্ট স্ট্রিম)',
        'timestamp': DateTime.now().toIso8601String(),
        'latencyMs': 0,
      };
      diagnosticResults[station.id] = res;
      _savePreferences();
      return res;
    }

    final stopwatch = Stopwatch()..start();
    try {
      final response = await http.get(
        Uri.parse(station.streamUrl),
        headers: {
          'Range': 'bytes=0-1024',
          'User-Agent':
              'Mozilla/5.0 (Linux; Android 15; Mobile) DhakaLifeRadio/1.3.1',
        },
      ).timeout(const Duration(seconds: 5));

      stopwatch.stop();
      final isOk = response.statusCode == 200 ||
          response.statusCode == 206 ||
          response.statusCode == 302;

      final res = {
        'status': isOk ? 'verified_live' : 'failed',
        'isLive': isOk,
        'httpCode': response.statusCode,
        'contentType': response.headers['content-type'] ?? 'unknown',
        'message': isOk
            ? 'লাইভ স্ট্রিম সক্রিয় (${response.statusCode})'
            : 'ত্রুটি: HTTP ${response.statusCode}',
        'timestamp': DateTime.now().toIso8601String(),
        'latencyMs': stopwatch.elapsedMilliseconds,
      };

      diagnosticResults[station.id] = res;
      _savePreferences();
      return res;
    } catch (e) {
      stopwatch.stop();
      final res = {
        'status': 'error',
        'isLive': false,
        'message': 'সংযোগ ব্যর্থ: $e',
        'timestamp': DateTime.now().toIso8601String(),
        'latencyMs': stopwatch.elapsedMilliseconds,
      };
      diagnosticResults[station.id] = res;
      _savePreferences();
      return res;
    }
  }

  Future<void> testAllStations() async {
    for (final st in stations) {
      await testStream(st);
    }
  }

  @override
  void onClose() {
    _playerStateSubscription?.cancel();
    _playbackEventSubscription?.cancel();
    _interruptionSubscription?.cancel();
    _noisySubscription?.cancel();
    _player.dispose();
    super.onClose();
  }
}
