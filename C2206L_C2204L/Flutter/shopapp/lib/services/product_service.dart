import 'package:foodapp/dtos/requests/product/get_product_request.dart';
import 'package:foodapp/dtos/requests/user/login_request.dart';
import 'package:foodapp/dtos/requests/user/register_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/dtos/responses/product/product_list.dart';
import 'package:foodapp/dtos/responses/product/product.dart';
import 'package:foodapp/enums/http_method.dart';
import 'package:foodapp/dtos/responses/product/product.dart';
import 'package:foodapp/services/api_constants.dart';
import 'package:foodapp/repositories/cart_repository.dart';
import 'package:foodapp/services/base_service.dart';
import 'package:flutter/foundation.dart';

class ProductService extends BaseService {
  final CartRepository cartRepository = CartRepository();

  Future<ProductList> getProducts(GetProductRequest getProductRequest) async {
    final String apiUrl = '${APIConstants.baseUrl}/products';
    final ApiResponse response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.GET,
      requestData: getProductRequest.toJson(),
    );
    return ProductList.fromJson(response.data);
  }

  Future<Product> getProductById(int id) async {
    final String apiUrl = '${APIConstants.baseUrl}/products/$id';
    final ApiResponse response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.GET,
    );
    return Product.fromJson(response.data);
  }

  Future<List<Product>> getProductByIds(List<int> ids) async {
    // Chuyển đổi List<int> ids sang chuỗi và nối chúng bằng dấu ','
    String idsString = ids.join(',');
    final String apiUrl = '${APIConstants
        .baseUrl}/products/by-ids?ids=$idsString';

    final ApiResponse response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.GET,
    );
    List<Product> products = (response.data as List)
        .map<Product>((productJson) => Product.fromJson(productJson))
        .toList();
    return products;
  }

  Future<List<Product>> findFavoriteProductsByUserId() async {
    final String apiUrl = '${APIConstants.baseUrl}/products/favorite-products';
    Map<String, String> tokens = await tokenRepository.getTokens();
    String jwtToken = tokens['token'] ?? '';
    final ApiResponse response = await request(
        apiUrl: apiUrl,
        method: HttpMethod.POST,
        token: jwtToken
    );
    List<Product> productResponses = (response.data as List)
        .map<Product>((productJson) => Product.fromJson(productJson))
        .toList();
    return productResponses;
  }

  Future<void> addToCart(
      {required int productId, required int itemCount}) async {
    if (productId > 0 && itemCount > 0) {
      await cartRepository.saveCart(productId, itemCount);
    } else if (itemCount == 0) {
      await cartRepository.removeCartWithProduct(productId);
    }
  }

  Future<int?> getItemCountFromCart(int productId) async {
    return await cartRepository.getProductCountById(productId);
  }

  Future<Map<int, int>> getCart() async {
    return await cartRepository.getCart();
  }

  Future<bool> get isCartEmpty async {
    Map<int, int> cartItems = await cartRepository.getCart();
    return cartItems.isEmpty;
  }
}
