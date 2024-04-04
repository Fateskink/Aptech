import 'package:foodapp/models/product_image.dart';
import 'package:foodapp/extensions/custon_string.dart';
import 'package:foodapp/services/api_constants.dart';

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

    String? thumbnailUrl = json['thumbnail'] as String?;
    if (thumbnailUrl != null && !thumbnailUrl.contains('http')) {
      thumbnailUrl = '${APIConstants.baseUrl}/products/images/$thumbnailUrl';
    }
    if(thumbnailUrl == null || thumbnailUrl.isEmpty) {
      thumbnailUrl = '${APIConstants.baseUrl}/products/images/notfound.jpeg';
    }

    return ProductResponse(
      id: json['id'] ?? 0,
      name: (json['name'] as String?)?.toUtf8() ?? '',
      price: json['price'] != null ? json['price'].toDouble() : 0.0,
      thumbnail: thumbnailUrl ?? '',
      description: (json['description'] as String?)?.toUtf8() ?? '',
      totalPages: json['totalPages'] ?? 0,
      productImages: productImages ?? [],
      categoryId: json['category_id'] ?? 0,
    );
  }
}