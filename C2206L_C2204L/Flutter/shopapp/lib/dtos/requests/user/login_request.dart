
class LoginRequest {
  final String phoneNumber;
  final String password;
  int roleId;

  LoginRequest({
    required this.phoneNumber,
    required this.password,
    int? roleId,
  })  : assert(phoneNumber.length >= 5, 'Phone number must be at least 5 characters'),
        assert(password.isNotEmpty, 'Password cannot be blank'),
        roleId = roleId ?? 1; // Default value for roleId

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber ?? '',
      'password': password ?? '',
      'role_id': roleId ?? 1,
    };
  }

}



