
class Recipe {
  final String? name;
  final List<dynamic>? images;
  final double? rating;
  final String? totalTime;

  Recipe({
     this.name,
     this.images,
     this.rating,
     this.totalTime
  });

  factory Recipe.fromJson(dynamic json){
    return Recipe(
        name: json["name"],
        images: json["images"],
        rating: json["rating"],
        totalTime: json["totalTime"]);
  }

  static List<Recipe> recipeFromSnapshot(List snapshot){
    return snapshot.map((data){
      return Recipe.fromJson(data);
    }).toList();
  }
  @override
  String toString(){
    return 'Recipe {name: $name, images: $images, rating: $rating, totalTime: $totalTime}';
  }
}