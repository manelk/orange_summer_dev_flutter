import 'package:flutter/material.dart';
import 'package:my_app_test/data/recipes_data.dart';
import 'package:my_app_test/models/recipe_model.dart';
import 'package:my_app_test/presentation/widgets/recipe_widget.dart';
import 'package:my_app_test/services/fetch_recipe_service.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    // var title = recipesFakeData[0].title;
    // var category = recipesFakeData[0].category;
    // var rating = recipesFakeData[0].rating;
    final service = FetchRecipeService();
    return Scaffold(
      appBar: AppBar(title: Text("Recipe app demo")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<RecipeModel>>(
          future: service.fetchRecipes(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                // we need to call our list
                itemCount: asyncSnapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  print(
                    "asyncSnapshot.data![index].imageUrl: ${asyncSnapshot.data![index].imageUrl}",
                  );
                  return RecipeWidget(
                    title: asyncSnapshot.data![index].title,
                    rating: asyncSnapshot.data![index].rating,
                    imageUrl: asyncSnapshot.data![index].imageUrl,
                    category: asyncSnapshot.data![index].category,
                  );
                },
              );
            } else if (asyncSnapshot.hasError) {
              return Column(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  Padding(
                    padding: const .only(top: 16),
                    child: Text('Error: ${asyncSnapshot.error}'),
                  ),
                ],
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
