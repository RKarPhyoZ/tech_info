class CategoryModel {
  final String name;
  final String url;
  CategoryModel({required this.name, required this.url});

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      name: json["name"] ?? "",
      url: json["url"] ?? "",
    );
  }
}
