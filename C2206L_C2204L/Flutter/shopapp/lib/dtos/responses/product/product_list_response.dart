import 'package:foodapp/dtos/responses/product/product_reponse.dart';

class ProductListResponse {
  List<ProductResponse> products;
  int totalPages;

  ProductListResponse({
    required this.products,
    required this.totalPages,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> productsJson = json['products'];
    List<ProductResponse> products = productsJson.map(
            (productJson) => ProductResponse.fromJson(productJson)).toList();
    return ProductListResponse(
      products: products,
      totalPages: json['totalPages'],
    );
  }
}