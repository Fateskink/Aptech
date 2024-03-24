import 'package:foodapp/models/order_detail.dart';
import 'package:foodapp/models/user.dart';

import 'coupon.dart';

class Order {
  final int id;
  final User user;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String note;
  final String orderDate;
  final String status;
  final double totalMoney;
  final String shippingMethod;
  final String shippingAddress;
  final String shippingDate;
  final String trackingNumber;
  final String paymentMethod;
  final bool active;
  final List<OrderDetail> orderDetails;
  final Coupon? coupon;

  Order({
    required this.id,
    required this.user,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.note,
    required this.orderDate,
    required this.status,
    required this.totalMoney,
    required this.shippingMethod,
    required this.shippingAddress,
    required this.shippingDate,
    required this.trackingNumber,
    required this.paymentMethod,
    required this.active,
    required this.orderDetails,
    this.coupon,
  });
}