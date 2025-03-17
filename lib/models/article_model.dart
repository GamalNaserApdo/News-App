class ArticleModel {
  final String? image; // Image URL (nullable)
  final String title; // Article title (required)
  final String? subtitle; // Article subtitle (nullable)

  // Constructor
  ArticleModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
