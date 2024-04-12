import 'package:foodapp/dtos/responses/user/user_response.dart';
import 'package:foodapp/models/user.dart';

class Comment {
  final int id;
  final int productId; // Corresponds to the product_id field in the Java class
  //final int userId; // Corresponds to the user_id field in the Java class
  final UserResponse user;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.productId,
    required this.user,
    required this.content,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    UserResponse userResponse = UserResponse.fromJson(json['user']);
    return Comment(
      id: json['id'] as int,
      productId: json['product_id'] ?? 0, // Map to the product_id field in Java
      //userId: json['user_id'] ?? 0, // Map to the user_id field in Java
      user: userResponse,
      content: json['content'] ?? '',
      createdAt: DateTime.parse(json['created_at']) ?? DateTime.now()
    );
  }
}

