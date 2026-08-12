class RecipeModel {
  final String title;
  final String category;
  final String rating;
  final String? imageUrl;

  RecipeModel({
    required this.title,
    required this.category,
    required this.rating,
    this.imageUrl,
  });
}
