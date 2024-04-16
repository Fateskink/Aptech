import 'package:foodapp/dtos/requests/cart_item/cart_item_request.dart';

class InsertOrderRequest {
  final String fullname;
  final String email;
  final String phoneNumber;
  final String address;
  final String note;
  final double totalMoney;
  final String shippingMethod;
  final String paymentMethod;
  final String couponCode;
  final List<CartItemRequest> cartItems;

  InsertOrderRequest({
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.note,
    required this.totalMoney,
    required this.shippingMethod,
    required this.paymentMethod,
    required this.couponCode,
    required this.cartItems,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'phone_number': phoneNumber,
      'address': address,
      'note': note,
      'total_money': totalMoney.toStringAsFixed(2),
      'shipping_method': shippingMethod,
      'payment_method': paymentMethod,
      'coupon_code': couponCode,
      'cart_items': cartItems.map((item) => item.toJson()).toList(),
    };
  }
}

