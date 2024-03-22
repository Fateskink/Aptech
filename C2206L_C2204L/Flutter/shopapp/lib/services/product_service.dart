import 'package:foodapp/dtos/requests/product/get_product_request.dart';
import 'package:foodapp/dtos/requests/user/login_request.dart';
import 'package:foodapp/dtos/requests/user/register_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/dtos/responses/product/product_list_response.dart';
import 'package:foodapp/services/api_constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ProductService {
  Future<ProductListResponse> getProducts(GetProductRequest request) async {
    final String apiUrl = '${APIConstants.baseUrl}/products';
    final Map<String, dynamic> requestData = request.toJson();

    final Uri uri = Uri.parse(apiUrl).replace(
      queryParameters: {
        'page': requestData['page'].toString(),
        'limit': requestData['limit'].toString(),
        'keyword': requestData['keyword'].toString(),
        'category_id': requestData['categoryId'].toString(),
      },
    );

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      // Parse the response JSON
      final ProductListResponse responseData =
      ProductListResponse.fromJson(convert.jsonDecode(response.body));
      return responseData; // Contains token
    } else {
      String errorMessage =
      convert.utf8.decode(convert.jsonDecode(response.body)['message'].codeUnits);
      throw Exception(errorMessage);
    }
  }
  Future<ApiResponse> getProductById(int id) async {
    final String apiUrl = '${APIConstants.baseUrl}/products/$id';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // Parse the response JSON
      final ApiResponse responseData =
      ApiResponse.fromJson(convert.jsonDecode(response.body));
      return responseData; // Contains token
    } else {
      String errorMessage =
      convert.utf8.decode(convert.jsonDecode(response.body)['message'].codeUnits);
      throw Exception(errorMessage);
    }
  }
}
