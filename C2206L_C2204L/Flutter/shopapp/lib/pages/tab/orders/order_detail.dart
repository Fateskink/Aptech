import 'package:flutter/material.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/dtos/responses/order/order.dart';
import 'package:foodapp/enums/popup_type.dart';
import 'package:foodapp/pages/app_routes.dart';
import 'package:foodapp/services/order_service.dart';
import 'package:foodapp/utils/utility.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'order_utils.dart'; // Để format ngày tháng

class OrderDetail extends StatelessWidget {
  final Order order;
  OrderDetail({
    super.key,
    required this.order
  });
  final OrderService orderService = GetIt.instance<OrderService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/${AppRoutes.appTab}');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${order.id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Order Date: ${DateFormat('dd/MM/yyyy HH:mm').format(order.orderDate)}'),
            SizedBox(height: 8),
            Text('Status: ${order.status}',
                style: TextStyle(
                    color: getStatusColor(order.status), // Màu trạng thái
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Shipping Address: ${order.shippingAddress}'),
            SizedBox(height: 16),
            Text('Total Money: \$${order.totalMoney.toStringAsFixed(2)}'),
            SizedBox(height: 16),
            Text('Payment Method: ${order.paymentMethod}'),
            SizedBox(height: 16),
            Text('Phone Number: ${order.phoneNumber}'),
            SizedBox(height: 16),
            Text('Email: ${order.email}'),
            SizedBox(height: 16),
            Text('Note: ${order.note}'),
            SizedBox(height: 24),
            Text(
              'Order Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: order.orderDetails.length,
                itemBuilder: (context, index) {
                  final orderDetail = order.orderDetails[index];
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(orderDetail.productName),
                        Text('Quantity: ${orderDetail.numberOfProducts}, Price: \$${orderDetail.price.toStringAsFixed(2)}'),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                onTap: () {
                  // Xử lý hủy đơn hàng
                  _cancelOrder(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      'Cancel Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  void _cancelOrder(BuildContext context) async {
    // Xử lý hủy đơn hàng ở đây
    Utility.confirm(
      context: context,
      title: 'Confirm',
      message: 'Are you sure you want to cancel this order?',
      confirmActionText: 'Yes',
      cancelActionText: 'No',
      onConfirm: () {
        orderService.cancelOrder(order.id).then((response) {
          if (response.status.toLowerCase() == 'ok') {
            Utility.alert(
              context: context,
              message: 'Order successfully cancelled',
              popupType: PopupType.success,
              onOkPressed: () {
                context.go('/${AppRoutes.appTab}');
              },
            );
          } else {
            Utility.alert(
              context: context,
              message: response.message,
              popupType: PopupType.failure,
              onOkPressed: () {},
            );
          }
        }).catchError((error) {
          Utility.alert(
            context: context,
            message: error.toString(),
            popupType: PopupType.failure,
            onOkPressed: () {},
          );
        });
      },
    );
  }
}