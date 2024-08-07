class ProductModel {
  final String title;
  final String description;
  final String thumbnail;
  final List<dynamic> images;
  final String price;
  final String rating;
  final String returnPolicy;
  final String warrantyInformation;
  final String stock;
  final String brand;
  ProductModel({
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.images,
    required this.price,
    required this.rating,
    required this.returnPolicy,
    required this.warrantyInformation,
    required this.stock,
    required this.brand,
  });

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      images: json["images"] ?? [],
      price: json["price"].toString(),
      rating: json["rating"].toString(),
      returnPolicy: json["returnPolicy"] ?? "",
      warrantyInformation: json["warrantyInformation"] ?? "",
      stock: json["stock"].toString(),
      brand: json["brand"] ?? "",
    );
  }
}
