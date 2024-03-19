class RegisterRequest {
  final String phoneNumber;
  final String password;
  final String retypePassword;
  final String dateOfBirth;
  int roleId;

  RegisterRequest({
    required String phoneNumber,
    required String password,
    required String retypePassword,
    required String dateOfBirth,
    int? roleId,
  })  : assert(phoneNumber.length >= 5, 'Phone number must be at least 5 characters'),
        assert(password.isNotEmpty, 'Password cannot be blank'),
        assert(password == retypePassword, 'Passwords do not match'),
        phoneNumber = phoneNumber,
        password = password,
        retypePassword = retypePassword,
        dateOfBirth = dateOfBirth,
        roleId = roleId ?? 1; // Default value for roleId
}
