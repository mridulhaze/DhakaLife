import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:flutter_project_nutcm_1/models/dhaka_radio_station.dart';

class DhakaRadioService extends GetxService {
  static DhakaRadioService get to => Get.find<DhakaRadioService>();

  late final AudioPlayer _player;

  final Rx<DhakaRadioStation?> currentStation = Rx<DhakaRadioStation?>(null);
  final RxBool isPlaying = false.obs;
  final RxBool isBuffering = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;
  final RxDouble volume = 1.0.obs;

  StreamSubscription? _playerStateSubscription;
  StreamSubscription? _playbackEventSubscription;

  AudioPlayer get player => _player;

  @override
  void onInit() {
    super.onInit();
    _initPlayer();
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
      errorMessage.value = 'নেটওয়ার্ক সংযোগ বিঘ্নিত হয়েছে।';
      isBuffering.value = false;
    });
  }

  Future<void> playStation(DhakaRadioStation station) async {
    try {
      hasError.value = false;
      errorMessage.value = '';
      currentStation.value = station;
      isBuffering.value = true;

      final mediaItem = MediaItem(
        id: station.id,
        album: 'ঢাকা লাইফ রেডিও',
        title: station.nameBn,
        artist: station.tagline,
        artUri: Uri.parse('https://raw.githubusercontent.com/mridulhaze/DhakaLife/main/assets/images/dhakalife_logo.png'),
        displayTitle: station.nameBn,
        displaySubtitle: station.frequency,
      );

      final audioSource = AudioSource.uri(
        Uri.parse(station.streamUrl),
        tag: mediaItem,
      );

      await _player.stop();
      await _player.setAudioSource(audioSource);
      await _player.play();
      isPlaying.value = true;
      isBuffering.value = false;
    } catch (e) {
      debugPrint('Error playing station ${station.nameBn}: $e');
      hasError.value = true;
      errorMessage.value = 'স্টেশন সংযোগ পাওয়া যায়নি। অন্য স্টেশন বাছাই করুন।';
      isBuffering.value = false;
      isPlaying.value = false;
    }
  }

  Future<void> togglePlayPause() async {
    if (currentStation.value == null) {
      if (DhakaRadioStation.defaultStations.isNotEmpty) {
        await playStation(DhakaRadioStation.defaultStations.first);
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

  @override
  void onClose() {
    _playerStateSubscription?.cancel();
    _playbackEventSubscription?.cancel();
    _player.dispose();
    super.onClose();
  }
}
