import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_app_test/models/recipe_model.dart';

class FetchRecipeService {
  Future<List<RecipeModel>> fetchRecipes() async {
    // URL will be used or API link is => https://demo-api-xta9.onrender.com/v1/recipes?page=5&&limit=1

    var url = Uri.parse(
      "https://demo-api-xta9.onrender.com/v1/recipes?page=1&&limit=5",
    );

    var response = await http.get(url);

    // print({response.body});
    // print({response.statusCode});

    if (response.statusCode == HttpStatus.ok) {
      // response.body = JSON
      // from json to dart then from dart to RecipeModel
      final List<dynamic> data = jsonDecode(response.body)["data"];

      final mappedData = data.map((e) => RecipeModel.fromJson(e)).toList();

      return mappedData;
    } else {
      print("There is an error check api, code is not 200");
      throw Exception();
    }
  }
}
