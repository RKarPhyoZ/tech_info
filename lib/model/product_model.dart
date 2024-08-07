class ProductModel {
  final String title;
  final String description;
  final String thumbnail;
  final List<dynamic> images;
  final double price;
  final double rating;
  final String returnPolicy;
  final String warrantyInformation;
  final int stock;
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
      price: json["price"] ?? 0.0,
      rating: json["rating"] ?? 0.0,
      returnPolicy: json["returnPolicy"] ?? "",
      warrantyInformation: json["warrantyInformation"] ?? "",
      stock: json["stock"] ?? 0,
      brand: json["brand"] ?? "",
    );
  }
}
