import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_recipe/models/recipe.dart';

class RecipeApi{

  static Future<Map<String, dynamic>> getRecipe() async{
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list');
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '74d8874198msh211246385474078p14348fjsn097110f3f554',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    return jsonDecode(response.body);
}
}