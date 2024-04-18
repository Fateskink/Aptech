import 'package:flutter/material.dart';
import 'package:foodapp/dtos/responses/order/order.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order> fakeOrders = [
    Order(
      id: 1,
      userId: 1,
      fullName: 'Nguyễn Văn A',
      phoneNumber: '0123456789',
      email: 'nguyenvana@email.com',
      address: '123 Đường ABC, Quận XYZ, TP.HCM',
      note: 'Giao hàng vào buổi sáng',
      orderDate: DateTime(2023, 12, 15, 10, 30, 0),  // Ngày, tháng, năm, giờ, phút, giây
      status: 'delivered',
      totalMoney: 100.0,
      shippingMethod: 'Giao hàng tiết kiệm',
      shippingAddress: '123 Đường ABC, Quận XYZ, TP.HCM',
      shippingDate: DateTime(2023, 12, 17),
      paymentMethod: 'COD',
    ),
    Order(
      id: 2,
      userId: 1,
      fullName: 'Trần Văn B',
      phoneNumber: '0987654321',
      email: 'tranvanb@email.com',
      address: '456 Đường XYZ, Quận ABC, TP.HCM',
      note: 'Giao hàng vào buổi chiều',
      orderDate: DateTime(2023, 11, 20, 15, 45, 0),
      status: 'processing',
      totalMoney: 50.0,
      shippingMethod: 'Giao hàng nhanh',
      shippingAddress: '456 Đường XYZ, Quận ABC, TP.HCM',
      shippingDate: DateTime(2023, 11, 22),
      paymentMethod: 'Credit Card',
    ),
    Order(
      id: 3,
      userId: 2,
      fullName: 'Lê Thị C',
      phoneNumber: '0123999888',
      email: 'lethic@email.com',
      address: '789 Đường DEF, Quận GHI, TP.HCM',
      note: 'Giao hàng vào buổi sáng',
      orderDate: DateTime(2024, 1, 5, 9, 0, 0),
      status: 'cancelled',
      totalMoney: 200.0,
      shippingMethod: 'Giao hàng tiết kiệm',
      shippingAddress: '789 Đường DEF, Quận GHI, TP.HCM',
      shippingDate: DateTime(2024, 1, 7),
      paymentMethod: 'Paypal',
    ),
    Order(
      id: 4,
      userId: 2,
      fullName: 'Phạm Văn D',
      phoneNumber: '0123888777',
      email: 'phamvand@email.com',
      address: '101 Đường HIJ, Quận KLM, TP.HCM',
      note: 'Giao hàng vào buổi chiều',
      orderDate: DateTime(2024, 2, 10, 16, 0, 0),
      status: 'delivered',
      totalMoney: 150.0,
      shippingMethod: 'Giao hàng nhanh',
      shippingAddress: '101 Đường HIJ, Quận KLM, TP.HCM',
      shippingDate: DateTime(2024, 2, 12),
      paymentMethod: 'COD',
    ),
    Order(
      id: 5,
      userId: 3,
      fullName: 'Hoàng Văn E',
      phoneNumber: '0123777666',
      email: 'hoangvane@email.com',
      address: '202 Đường NOP, Quận QRS, TP.HCM',
      note: 'Giao hàng vào buổi sáng',
      orderDate: DateTime(2024, 3, 1, 11, 30, 0),
      status: 'processing',
      totalMoney: 70.0,
      shippingMethod: 'Giao hàng tiết kiệm',
      shippingAddress: '202 Đường NOP, Quận QRS, TP.HCM',
      shippingDate: DateTime(2024, 3, 3),
      paymentMethod: 'Credit Card',
    ),
    Order(
      id: 6,
      userId: 3,
      fullName: 'Ngô Thị F',
      phoneNumber: '0123666555',
      email: 'ngothif@email.com',
      address: '303 Đường TUV, Quận WXY, TP.HCM',
      note: 'Giao hàng vào buổi chiều',
      orderDate: DateTime(2024, 3, 20, 17, 30, 0),
      status: 'cancelled',
      totalMoney: 90.0,
      shippingMethod: 'Giao hàng nhanh',
      shippingAddress: '303 Đường TUV, Quận WXY, TP.HCM',
      shippingDate: DateTime(2024, 3, 22),
      paymentMethod: 'Paypal',
    ),
    Order(
      id: 7,
      userId: 4,
      fullName: 'Đặng Văn G',
      phoneNumber: '0123555444',
      email: 'dangvang@email.com',
      address: '404 Đường ABC, Quận DEF, TP.HCM',
      note: 'Giao hàng vào buổi sáng',
      orderDate: DateTime(2024, 4, 5, 10, 0, 0),
      status: 'delivered',
      totalMoney: 120.0,
      shippingMethod: 'Giao hàng tiết kiệm',
      shippingAddress: '404 Đường ABC, Quận DEF, TP.HCM',
      shippingDate: DateTime(2024, 4, 7),
      paymentMethod: 'COD',
    ),
    Order(
      id: 8,
      userId: 4,
      fullName: 'Bùi Thị H',
      phoneNumber: '0123444333',
      email: 'buithih@email.com',
      address: '505 Đường XYZ, Quận GHI, TP.HCM',
      note: 'Giao hàng vào buổi chiều',
      orderDate: DateTime(2024, 5, 10, 14, 0, 0),
      status: 'processing',
      totalMoney: 180.0,
      shippingMethod: 'Giao hàng nhanh',
      shippingAddress: '505 Đường XYZ, Quận GHI, TP.HCM',
      shippingDate: DateTime(2024, 5, 12),
      paymentMethod: 'Credit Card',
    ),
    Order(
      id: 9,
      userId: 5,
      fullName: 'Vũ Văn I',
      phoneNumber: '0123333222',
      email: 'vuvani@email.com',
      address: '606 Đường DEF, Quận JKL, TP.HCM',
      note: 'Giao hàng vào buổi sáng',
      orderDate: DateTime(2024, 6, 1, 9, 30, 0),
      status: 'cancelled',
      totalMoney: 60.0,
      shippingMethod: 'Giao hàng tiết kiệm',
      shippingAddress: '606 Đường DEF, Quận JKL, TP.HCM',
      shippingDate: DateTime(2024, 6, 3),
      paymentMethod: 'Paypal',
    ),
    Order(
      id: 10,
      userId: 5,
      fullName: 'Trịnh Thị K',
      phoneNumber: '0123222111',
      email: 'trinhthik@email.com',
      address: '707 Đường MNO, Quận PQR, TP.HCM',
      note: 'Giao hàng vào buổi chiều',
      orderDate: DateTime(2024, 7, 15, 15, 30, 0),
      status: 'delivered',
      totalMoney: 250.0,
      shippingMethod: 'Giao hàng nhanh',
      shippingAddress: '707 Đường MNO, Quận PQR, TP.HCM',
      shippingDate: DateTime(2024, 7, 17),
      paymentMethod: 'COD',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: fakeOrders.length,
        itemBuilder: (context, index) {
          Order order = fakeOrders[index];
          Color statusColor = _getStatusColor(order.status);
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Đơn hàng #${order.id.toString()}', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Ngày đặt: ${order.orderDate.toString()}'),
                SizedBox(height: 8),
                Text('Tổng tiền: \$${order.totalMoney.toStringAsFixed(2)}'),
                SizedBox(height: 8),
                Text('Trạng thái: ${order.status}', style: TextStyle(color: statusColor)),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'delivered':
        return Colors.green;
      case 'processing':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}

