
import 'package:foodapp/models/category.dart';
import 'package:foodapp/models/comment.dart';
import 'package:foodapp/models/product_image.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String thumbnail;
  final String description;
  final Category category;
  final List<ProductImage> productImages;
  final List<Comment> comments;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.thumbnail,
    required this.description,
    required this.category,
    required this.productImages,
    required this.comments,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      thumbnail: json['thumbnail'],
      description: json['description'],
      category: Category.fromJson(json['category']),
      productImages: (json['productImages'] as List<dynamic>)
          .map((e) => ProductImage.fromJson(e))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e))
          .toList(),
    );
  }
}