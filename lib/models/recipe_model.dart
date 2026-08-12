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

  // transform data from json into our dart data
  RecipeModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      category = json['category'],
      rating = json['rating'],
      imageUrl = json['image_url'];
}
