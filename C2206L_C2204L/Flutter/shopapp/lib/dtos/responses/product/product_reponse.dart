import 'package:foodapp/models/product_image.dart';

class ProductResponse  {
  late int id;
  late String name;
  late double price;
  late String thumbnail;
  late String description;
  late int totalPages; // This field is not present in the provided Java class

  List<ProductImage> productImages = [];
  late int categoryId;

  ProductResponse({
    required this.id,
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.description,
    required this.totalPages,
    required this.productImages,
    required this.categoryId,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> productImagesJson = json['product_images'];
    List<ProductImage> productImages = productImagesJson.map(
            (imageJson) => ProductImage.fromJson(imageJson)).toList();
    return ProductResponse(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      thumbnail: json['thumbnail'],
      description: json['description'],
      totalPages: json['totalPages'],
      productImages: productImages,
      categoryId: json['category_id'],
    );
  }
}