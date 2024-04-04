import 'package:foodapp/dtos/requests/product/get_product_request.dart';
import 'package:foodapp/dtos/requests/user/login_request.dart';
import 'package:foodapp/dtos/requests/user/register_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/dtos/responses/product/product_list_response.dart';
import 'package:foodapp/dtos/responses/product/product_reponse.dart';
import 'package:foodapp/models/http_method.dart';
import 'package:foodapp/models/product.dart';
import 'package:foodapp/services/api_constants.dart';
import 'package:foodapp/services/base_service.dart';
import 'package:flutter/foundation.dart';

class ProductService extends BaseService {
  Future<ProductListResponse> getProducts(GetProductRequest getProductRequest) async {
    final String apiUrl = '${APIConstants.baseUrl}/products';
    final ApiResponse response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.GET,
      requestData: getProductRequest.toJson(),
    );
    return ProductListResponse.fromJson(response.data);
  }

  Future<ApiResponse> getProductById(int id) async {
    final String apiUrl = '${APIConstants.baseUrl}/products/$id';
    return request(
      apiUrl: apiUrl,
      method: HttpMethod.GET,
    );
  }
  Future<List<ProductResponse>> findFavoriteProductsByUserId() async {
    final String apiUrl = '${APIConstants.baseUrl}/products/favorite-products';
    Map<String, String> tokens  = await tokenRepository.getTokens();
    String jwtToken = tokens['token'] ?? '';
    final ApiResponse response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.POST,
      token: jwtToken
    );
    List<ProductResponse> productResponses = (response.data as List)
        .map<ProductResponse>((productJson) => ProductResponse.fromJson(productJson))
        .toList();
    return productResponses;
  }
}
