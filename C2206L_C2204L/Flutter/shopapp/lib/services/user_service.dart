import 'package:foodapp/dtos/requests/user/login_request.dart';
import 'package:foodapp/dtos/requests/user/register_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/services/api_constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
  Future<ApiResponse> register(RegisterRequest request) async {
    final String apiUrl = '${APIConstants.baseUrl}/users/register'; // Endpoint for register API

    // Prepare request data
    final Map<String, dynamic> data = {
      'fullname': request.fullName,
      'address': request.address ?? '',
      'phone_number': request.phoneNumber,
      'password': request.password,
      'retype_password': request.retypePassword,
      'date_of_birth': DateFormat('yyyy-MM-dd').format(request.dateOfBirth), // Convert date to 'yyyy-MM-dd' format
      'role_id': request.roleId ?? 1,
    };


    // Send POST request to register API
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
      return responseData; // Contains token
    } else {
      String errorMessage = convert.utf8.decode(convert.jsonDecode(response.body)['message'].codeUnits);
      throw Exception(errorMessage);
    }
  }
}