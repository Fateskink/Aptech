import 'package:foodapp/dtos/requests/user/login_request.dart';
import 'package:foodapp/dtos/requests/user/register_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/dtos/responses/user/user.dart';
import 'package:foodapp/models/http_method.dart';
import 'package:foodapp/repositories/token_repository.dart';
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
    Map<String, dynamic> data = response.data;
    String token = data['token'];
    String refreshToken = data['refresh_token'];
    //save to local
    await tokenRepository.saveTokens(token: token, refreshToken: refreshToken);
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
  Future<User> getUserDetails() async {
    final String apiUrl = '${APIConstants.baseUrl}/users/details';
    Map<String, String> tokens  = await tokenRepository.getTokens();
    String jwtToken = tokens['token'] ?? '';
    final ApiResponse response = await request(
      apiUrl: apiUrl,
      method: HttpMethod.POST,
      token: jwtToken,
    );
    return User.fromJson(response.data);
  }
  Future<void> saveCredentials({required String phoneNumber, required String password}) async {
    authRepository.saveCredentials(phoneNumber: phoneNumber, password: password);
  }

  // Retrieve credentials from local storage
  Future<Map<String, String>> getCredentials() async {
    return authRepository.getCredentials();
  }
}
