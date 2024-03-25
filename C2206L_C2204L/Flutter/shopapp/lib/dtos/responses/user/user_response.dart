import 'package:foodapp/extensions/custon_string.dart';

class UserResponse {
  final int? id;
  final String? fullName;
  final String phoneNumber;
  final String? address;
  final bool isActive;
  final DateTime? dateOfBirth;
  final int? facebookAccountId;
  final int? googleAccountId;
  final String? role; // Assuming role is a String. Adjust based on actual type.

  UserResponse({
    this.id,
    this.fullName,
    required this.phoneNumber,
    this.address,
    required this.isActive,
    this.dateOfBirth,
    this.facebookAccountId,
    this.googleAccountId,
    this.role,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] as int?,
      fullName: json['fullname'] as String?,
      phoneNumber: json['phone_number'] as String,
      address: (json['address'] as String?)?.toUtf8() ?? '',
      isActive: json['is_active'] as bool,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth']),
      facebookAccountId: json['facebook_account_id'] as int?,
      googleAccountId: json['google_account_id'] as int?,
      role: json['role'], // This depends on how role is represented in your JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullName,
      'phone_number': phoneNumber,
      'address': address,
      'is_active': isActive,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'facebook_account_id': facebookAccountId,
      'google_account_id': googleAccountId,
      'role': role,
    };
  }
}

