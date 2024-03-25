import 'package:foodapp/dtos/requests/category/get_category_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/services/api_constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CategoryService {
  Future<ApiResponse> getCategories(GetCategoryRequest request) async {
    final String apiUrl = '${APIConstants.baseUrl}/categories';
    final Map<String, String> requestData = request.toJson();

    final Uri uri = Uri.parse(apiUrl).replace(
      queryParameters: requestData,
    );

    final response = await http.get(
      uri,
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
      throw Exception(convert.jsonDecode(response.body)['message']?.toUtf8() ?? '');
    }
  }
}
