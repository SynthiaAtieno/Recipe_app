import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:simple_recipe/models/recipe_api.dart';
import 'package:simple_recipe/views/widgets/reciep_card.dart';

import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipe = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    var response = await RecipeApi.getRecipe();
    List<dynamic> list = response['feed'];
    var list2 = list.where((element) => element['content'] != null && element['content']['details'] != null).toList();
    _recipe = list2.map((e)=>Recipe.fromJson(e['content']['details'])).toList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu_outlined),
            SizedBox(width: 10,),
            Text("Food Recipe")
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading ? const CircularProgressIndicator() : ListView.builder(
            itemCount: _recipe.length,
            itemBuilder: (context, index) {
              return RecipeCard(
                  title: _recipe[index].name ?? "No data",
                  cookTime: _recipe[index].totalTime ?? "No data",
                  rating: _recipe[index].rating ?? 0,
                  thumbnailUrl: _recipe[index].images != null ? _recipe[index].images![0]['hostedLargeUrl'] : null);
            }),
      ),
    );
  }
}
