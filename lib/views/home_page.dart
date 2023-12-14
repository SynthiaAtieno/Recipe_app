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
  Future<void> getRecipes() async{
    _recipe = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
    print(_recipe);
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
        child: Column(
          children: const [
            //RecipeCard(title: "title", cookTime: "cookTime", rating: "rating", thumbnailUrl: "https://lh3.googleusercontent.com/ecJftfvxSWg45EZKGT0iMOc5Lc0yYxZiqRnTriRxyn4iIgnX-sARTNUXrTUKSBg4j3JZYLhYLq84ZDXGZXsAQQ=s360")
          ],
        ),
      ),
    );
  }
}
