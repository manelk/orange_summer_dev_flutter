import 'package:flutter/material.dart';
import 'package:my_app_test/data/recipes_data.dart';
import 'package:my_app_test/presentation/widgets/recipe_widget.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var title = recipesFakeData[0].title;
    // var category = recipesFakeData[0].category;
    // var rating = recipesFakeData[0].rating;

    return Scaffold(
      appBar: AppBar(title: Text("Recipe app demo")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          // we need to call our list
          itemCount: recipesFakeData.length,
          itemBuilder: (BuildContext context, int index) {
            return RecipeWidget(
              title: recipesFakeData[index].title,
              rating: recipesFakeData[index].rating,
              imageUrl: recipesFakeData[index].imageUrl,
              category: recipesFakeData[index].category,
            );
          },
        ),
      ),
    );
  }
}
