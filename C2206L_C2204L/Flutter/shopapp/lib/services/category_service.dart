import 'package:foodapp/dtos/requests/category/get_category_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/models/http_method.dart';
import 'package:foodapp/services/api_constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'base_service.dart';

class CategoryService extends BaseService {
  Future<ApiResponse> getCategories(GetCategoryRequest getCategoryRequest) async {
    final String apiUrl = '${APIConstants.baseUrl}/categories';
    final Map<String, String> requestData = getCategoryRequest.toJson();

    final Uri uri = Uri.parse(apiUrl).replace(
      queryParameters: requestData,
    );

    final response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.GET,
    );
    return response;
  }
}

