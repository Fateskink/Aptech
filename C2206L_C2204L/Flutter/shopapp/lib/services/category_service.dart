import 'package:foodapp/dtos/requests/category/get_category_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/services/api_constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CategoryService {
  Future<ApiResponse> getProducts(GetCategoryRequest request) async {
    final String apiUrl = '${APIConstants.baseUrl}/categories';
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
