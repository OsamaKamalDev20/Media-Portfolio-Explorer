enum MediaType { image, video }

class MediaItem {
  final String id;
  final String title;
  final String url;
  final MediaType type;
  final double aspectRatio; // For varied grid items

  const MediaItem({
    required this.id,
    required this.title,
    required this.url,
    required this.type,
    required this.aspectRatio,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      id: json['id'].toString(),
      title: json['title'] ?? 'Untitled',
      url: json['url'] ?? '',
      type: json['type'] == 'video' ? MediaType.video : MediaType.image,
      aspectRatio: (json['aspectRatio'] ?? 1.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'url': url,
    'type': type == MediaType.image ? 'image' : 'video',
    'aspectRatio': aspectRatio,
  };
}
