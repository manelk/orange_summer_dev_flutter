import 'package:flutter/material.dart';
import 'package:my_app_test/data/recipes_data.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var title = recipesFakeData[0].title;
    // var category = recipesFakeData[0].category;
    // var rating = recipesFakeData[0].rating;

    return Scaffold(
      appBar: AppBar(title: Text("Recipe app demo")),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        // we need to call our list
        itemCount: recipesFakeData.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Text("Title: ${recipesFakeData[index].title}"),
              Text("Category: ${recipesFakeData[index].category}"),
              Text("Rating:  ${recipesFakeData[index].rating}"),
              Image.network("${recipesFakeData[index].imageUrl}"),
            ],
          );
        },
      ),
    );
  }
}
