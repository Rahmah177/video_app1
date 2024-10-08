class Video {
  final int id;
  final String videoUrl;
  final String previewUrl;

  Video({required this.id, required this.videoUrl, required this.previewUrl});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      videoUrl: json['video'],
      previewUrl: json['preview'],
    );
  }
}
