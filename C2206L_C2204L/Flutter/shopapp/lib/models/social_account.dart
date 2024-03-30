import 'package:foodapp/extensions/custon_string.dart';

class SocialAccount {
  final int id;
  final String provider;
  final String providerId;
  final String? name;
  final String? email;

  SocialAccount({
    required this.id,
    required this.provider,
    required this.providerId,
    this.name,
    this.email,
  });

  factory SocialAccount.fromJson(Map<String, dynamic> json) {
    return SocialAccount(
      id: json['id'],
      provider: json['provider'],
      providerId: json['providerId'],
      name: (json['name'] as String?)?.toUtf8() ?? '',
      email: json['email'],
    );
  }
}