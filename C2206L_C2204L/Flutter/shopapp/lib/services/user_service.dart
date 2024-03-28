import 'package:foodapp/dtos/requests/user/login_request.dart';
import 'package:foodapp/dtos/requests/user/register_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/dtos/responses/user/user_response.dart';
import 'package:foodapp/models/http_method.dart';
import 'package:foodapp/services/api_constants.dart';
import 'package:foodapp/services/base_service.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class UserService extends BaseService {
  Future<ApiResponse> login(LoginRequest loginRequest) async {
    final String apiUrl = '${APIConstants.baseUrl}/users/login';
    final response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.POST,
      requestData: loginRequest.toJson(),
    );
    return response;
  }

  Future<ApiResponse> register(RegisterRequest registerRequest) async {
    final String apiUrl = '${APIConstants.baseUrl}/users/register';
    final response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.POST,
      requestData: registerRequest.toJson(),
    );
    return response;
  }
  Future<UserResponse> getUserDetails(String jwtToken) async {
    final String apiUrl = '${APIConstants.baseUrl}/users/details';
    final ApiResponse response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.POST,
      token: jwtToken,
    );
    return UserResponse.fromJson(response.data);
  }
}
