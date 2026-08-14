class Movie {
  final String title;
  final String bgImage;
  final String? icon;
  final String genre;
  final num? download;
  final num? reviews;
  final String? description;
  final String? videoUrl;
  final List<String>? images;

  Movie({
    required this.title,
    required this.bgImage,
    this.icon,
    required this.genre,
    this.download,
    this.reviews,
    this.description,
    this.videoUrl,
    this.images,
  });
}
