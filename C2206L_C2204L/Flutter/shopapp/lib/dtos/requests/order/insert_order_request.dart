import 'package:foodapp/dtos/requests/cart_item/cart_item_request.dart';

class InsertOrderRequest {
  final int userId;
  final String fullname;
  final String phoneNumber;
  final String status;
  final String address;
  final double totalMoney;
  final String paymentMethod;
  final String couponCode;
  final List<CartItemRequest> cartItems;

  InsertOrderRequest({
    required this.userId,
    required this.fullname,
    required this.phoneNumber,
    required this.status,
    required this.address,
    required this.totalMoney,
    required this.paymentMethod,
    required this.couponCode,
    required this.cartItems,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId.toString(),
      'fullname': fullname,
      'phone_number': phoneNumber,
      'status': status,
      'address': address,
      'total_money': totalMoney.toString(),
      'payment_method': paymentMethod,
      'coupon_code': couponCode,
      'cart_items': cartItems.map((item) => item.toJson()).toList(),
    };
  }
}
