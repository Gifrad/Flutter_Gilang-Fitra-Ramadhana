class FoodModel {
  int id;
  String name;

  FoodModel({
    required this.id,
    required this.name,
  });
}

class FoodWithImage extends FoodModel {
  String imageUrl;
  FoodWithImage({
    required super.id,
    required super.name,
    required this.imageUrl,
  });
}
