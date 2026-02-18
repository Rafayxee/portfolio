class Project {
  final String title;
  final String category;
  final String description;
  final String imageUrl;
  final List<String> screenshots;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;

  Project({
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    this.screenshots = const [],
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.playStoreUrl,
    this.appStoreUrl,
  });
}
