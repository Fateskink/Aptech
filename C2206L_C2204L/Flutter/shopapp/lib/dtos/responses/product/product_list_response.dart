import 'package:foodapp/dtos/responses/product/product.dart';

class ProductListResponse {
  List<Product> products;
  int totalPages;

  ProductListResponse({
    required this.products,
    required this.totalPages,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> productsJson = json['products'];
    List<Product> products = productsJson.map(
            (productJson) => Product.fromJson(productJson)).toList();
    return ProductListResponse(
      products: products,
      totalPages: json['totalPages'] as int ,
    );
  }
}