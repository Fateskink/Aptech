class RegisterRequest {
  final String phoneNumber;
  final String password;
  final String retypePassword;
  final String fullName;
  final DateTime dateOfBirth;
  int? roleId;

  RegisterRequest({
    required this.phoneNumber,
    required this.password,
    required this.retypePassword,
    required this.fullName,
    required this.dateOfBirth,
    int? roleId,
  })  : assert(phoneNumber.length >= 5, 'Phone number must be at least 5 characters'),
        assert(password.isNotEmpty, 'Password cannot be blank'),
        assert(password == retypePassword, 'Passwords do not match'),
        assert(_calculateAge(dateOfBirth) >= 18, 'Age must be 18 or above')
        {
    // TODO: implement RegisterRequest
    throw UnimplementedError();
  } // Default value for roleId

  // Helper method to calculate age
  static int _calculateAge(DateTime dob) {
    final now = DateTime.now();
    final age = now.year - dob.year;
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
      return age - 1;
    }
    return age;
  }
}

