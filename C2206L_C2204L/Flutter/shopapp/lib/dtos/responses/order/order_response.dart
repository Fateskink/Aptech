import 'package:foodapp/extensions/custon_string.dart';
import 'package:foodapp/models/order_detail.dart';

class OrderResponse {
  final int id;
  final int userId;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String address;
  final String note;
  final String orderDate; // Use String for date representation
  final String status;
  final double totalMoney;
  final String shippingMethod;
  final String shippingAddress;
  final String shippingDate; // Use String for date representation
  final String paymentMethod;
  final List<OrderDetail> orderDetails;

  OrderResponse({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.note,
    required this.orderDate,
    required this.status,
    required this.totalMoney,
    required this.shippingMethod,
    required this.shippingAddress,
    required this.shippingDate,
    required this.paymentMethod,
    required this.orderDetails,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      fullName: (json['fullName'] as String?)?.toUtf8() ?? '',
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      address: (json['address'] as String?)?.toUtf8() ?? '',
      note: (json['note'] as String?)?.toUtf8() ?? '',
      orderDate: json['order_date'] as String,
      status: json['status'] as String,
      totalMoney: (json['total_money'] as num).toDouble(),
      shippingMethod: (json['shipping_method'] as String?)?.toUtf8() ?? '',
      shippingAddress: (json['shipping_address'] as String?)?.toUtf8() ?? '',
      shippingDate: json['shipping_date'] as String,
      paymentMethod: (json['payment_method'] as String?)?.toUtf8() ?? '',
      orderDetails: (json['order_details'] as List<dynamic>)
          .map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
