import 'dart:convert';
class LoginRequest {
  final String phoneNumber;
  final String password;
  int roleId;

  LoginRequest({
    required String phoneNumber,
    required String password,
    int? roleId,
  })  : assert(phoneNumber.length >= 5, 'Phone number must be at least 5 characters'),
        assert(password.isNotEmpty, 'Password cannot be blank'),
        phoneNumber = phoneNumber,
        password = password,
        roleId = roleId ?? 1; // Default value for roleId
}



