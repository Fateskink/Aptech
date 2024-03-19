import 'package:foodapp/dtos/requests/login_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/services/api_constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UserService {
  Future<ApiResponse> login(
    LoginRequest request
  ) async {
    final String apiUrl = '${APIConstants.baseUrl}/users/login'; // Endpoint for login API
    final Map<String, dynamic> data = {
      'phone_number': request.phoneNumber,
      'password': request.password,
      "role_id": request.roleId!
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Parse the response JSON
      final ApiResponse responseData = ApiResponse.fromJson(convert.jsonDecode(response.body));
      return responseData;//contains token
    } else {
      throw Exception('Failed to login');
    }
  }
}