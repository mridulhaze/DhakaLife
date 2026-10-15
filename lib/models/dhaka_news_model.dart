class DhakaNewsHeadline {
  final String title;
  final String url;
  final String source;
  final String? pubDate;

  DhakaNewsHeadline({
    required this.title,
    required this.url,
    required this.source,
    this.pubDate,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'source': source,
        'pubDate': pubDate,
      };

  factory DhakaNewsHeadline.fromJson(Map<String, dynamic> json) =>
      DhakaNewsHeadline(
        title: json['title'] ?? '',
        url: json['url'] ?? '',
        source: json['source'] ?? '',
        pubDate: json['pubDate'],
      );
}
