class FoodDetailNavigationModel {
  String path;
  bool isNetwork;
  String? name;

  FoodDetailNavigationModel({
    required this.path,
    required this.isNetwork,
    this.name,
  });
}
