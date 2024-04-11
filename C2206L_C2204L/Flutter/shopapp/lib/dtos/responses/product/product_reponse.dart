import 'package:foodapp/models/comment.dart';
import 'package:foodapp/models/product_image.dart';
import 'package:foodapp/extensions/custon_string.dart';
import 'package:foodapp/services/api_constants.dart';
import 'package:foodapp/utils/utility.dart';

class ProductResponse  {
  late int id;
  late String name;
  late double price;
  late String thumbnail;
  late String description;
  late int totalPages; // This field is not present in the provided Java class

  List<ProductImage> productImages = [];
  List<Comment> comments = [];
  late int categoryId;

  ProductResponse({
    required this.id,
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.description,
    required this.totalPages,
    required this.productImages,
    required this.comments,
    required this.categoryId,
  });
  static ProductResponse get empty => ProductResponse(
    id: 0,
    name: '',
    price: 0.0,
    thumbnail: '',
    description: '',
    totalPages: 0,
    productImages: [],
    comments: [],
    categoryId: 0,
  );
  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> productImagesJson = json['product_images'];
    List<ProductImage> productImages = productImagesJson.map(
            (imageJson) => ProductImage.fromJson(imageJson)).toList();
    List<Comment> comments = (json['comments'] as List<dynamic>? ?? []).map(
            (commentJson) => Comment.fromJson(commentJson as Map<String, dynamic>)
    ).toList();

    return ProductResponse(
      id: json['id'] ?? 0,
      name: (json['name'] as String?)?.toUtf8() ?? '',
      price: json['price'] != null ? json['price'].toDouble() : 0.0,
      thumbnail: Utility.getImageUrl(json['thumbnail'] ?? ''),
      description: (json['description'] as String?)?.toUtf8() ?? '',
      totalPages: json['totalPages'] ?? 0,
      productImages: productImages ?? [],
      comments: comments ?? [],
      categoryId: json['category_id'] ?? 0,
    );
  }
}