import 'package:foodapp/models/role.dart';

import 'comment.dart';
import 'package:foodapp/extensions/custon_string.dart';

class User {
  final int id;
  final String fullName;
  final String phoneNumber;
  final String? address;
  final String password;
  final bool active;
  final String? dateOfBirth;
  final int facebookAccountId;
  final int googleAccountId;
  final Role role;
  final List<Comment> comments;

  User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    this.address,
    required this.password,
    required this.active,
    this.dateOfBirth,
    required this.facebookAccountId,
    required this.googleAccountId,
    required this.role,
    required this.comments,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: (json['fullName'] as String?)?.toUtf8() ?? '',
      phoneNumber: json['phoneNumber'],
      address: (json['address'] as String?)?.toUtf8() ?? '',
      password: json['password'],
      active: json['active'],
      dateOfBirth: json['dateOfBirth'],
      facebookAccountId: json['facebookAccountId'],
      googleAccountId: json['googleAccountId'],
      role: Role.fromJson(json['role']),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e))
          .toList(),
    );
  }
}