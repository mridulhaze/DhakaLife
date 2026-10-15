class DhakaRadioStation {
  final String id;
  final String nameBn;
  final String nameEn;
  final String tagline;
  final String frequency;
  final String streamUrl;
  final int primaryColorValue;
  final String category;

  const DhakaRadioStation({
    required this.id,
    required this.nameBn,
    required this.nameEn,
    required this.tagline,
    required this.frequency,
    required this.streamUrl,
    this.primaryColorValue = 0xFF1E88E5,
    this.category = 'বিনোদন ও গান',
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'nameBn': nameBn,
    'nameEn': nameEn,
    'tagline': tagline,
    'frequency': frequency,
    'streamUrl': streamUrl,
    'primaryColorValue': primaryColorValue,
    'category': category,
  };

  factory DhakaRadioStation.fromJson(Map<String, dynamic> json) => DhakaRadioStation(
    id: json['id'] as String? ?? '',
    nameBn: json['nameBn'] as String? ?? '',
    nameEn: json['nameEn'] as String? ?? '',
    tagline: json['tagline'] as String? ?? '',
    frequency: json['frequency'] as String? ?? '',
    streamUrl: json['streamUrl'] as String? ?? '',
    primaryColorValue: json['primaryColorValue'] as int? ?? 0xFF1E88E5,
    category: json['category'] as String? ?? 'বিনোদন ও গান',
  );

  static const List<DhakaRadioStation> defaultStations = [
    DhakaRadioStation(
      id: 'betar_bangla',
      nameBn: 'বেতার বাংলা',
      nameEn: 'Betar Bangla',
      tagline: 'আন্তর্জাতিক বাংলা সংবাদ ও সঙ্গীত',
      frequency: 'লাইভ ৮২২',
      streamUrl: 'https://radio.canstream.co.uk:8022/live.mp3',
      primaryColorValue: 0xFF2E7D32,
      category: 'সংবাদ ও সঙ্গীত',
    ),
    DhakaRadioStation(
      id: 'jago_fm',
      nameBn: 'জাগো এফএম',
      nameEn: 'Jago FM 94.4',
      tagline: 'তরুণদের প্রিয় বাংলা মিউজিক ও আরজে শো',
      frequency: '৯৪.৪ FM',
      streamUrl: 'http://139.59.86.99:12496/stream',
      primaryColorValue: 0xFFE65100,
      category: 'বিনোদন ও আরজে শো',
    ),
    DhakaRadioStation(
      id: 'radio_goongoon',
      nameBn: 'রেডিও গুনগুন',
      nameEn: 'Radio GoonGoon',
      tagline: 'চিরসবুজ আধুনিক ও ফোক বাংলা গান',
      frequency: 'অনলাইন লাইভ',
      streamUrl: 'https://audio.streamcast.xyz/listen/radiogoongoon/radio.mp3',
      primaryColorValue: 0xFF00897B,
      category: 'বাংলা আধুনিক গান',
    ),
    DhakaRadioStation(
      id: 'mellow_bangla',
      nameBn: 'মেলো বাংলা রেডিও',
      nameEn: 'Mellow Bangla',
      tagline: 'মন জুড়ানো মেলোডি ও ক্লাসিক্যাল বাংলা সুর',
      frequency: 'অনলাইন লাইভ',
      streamUrl: 'https://radio.mellowbangla.com/stream',
      primaryColorValue: 0xFF6A1B9A,
      category: 'মেলোডি ও ক্লাসিক্যাল',
    ),
    DhakaRadioStation(
      id: 'peoples_radio',
      nameBn: 'পিপলস রেডিও',
      nameEn: 'Peoples Radio 91.6',
      tagline: 'ঢাকার মানুষের সুর ও দৈনন্দিন কথা',
      frequency: '৯১.৬ FM',
      streamUrl: 'https://s3.myradiostream.com:14498/listen.mp3',
      primaryColorValue: 0xFF1565C0,
      category: 'জনপ্রিয় ঢাকা এফএম',
    ),
    DhakaRadioStation(
      id: 'health_radio',
      nameBn: 'স্বাস্থ্য বার্তা রেডিও',
      nameEn: 'Universal Health Radio',
      tagline: 'দৈনন্দিন সুস্থতা, চিকিৎসা ও স্বাস্থ্য টিপস',
      frequency: 'স্বাস্থ্য লাইভ',
      streamUrl: 'https://radio.universalhealthradio.org/uhr-bn.mp3',
      primaryColorValue: 0xFFC2185B,
      category: 'স্বাস্থ্য ও তথ্য',
    ),
  ];
}
