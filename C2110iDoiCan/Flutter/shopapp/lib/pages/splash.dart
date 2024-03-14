import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Splash({super.key});
  final List<Map<String, String?>> functionalities = [
    {
      'title': 'Quản lý Hàng Tồn Kho',
      'image': 'inventory.png',
      'description': 'Ghi chú về số lượng hàng tồn kho, tổng giá trị và xuất nhập hàng.',
    },
    {
      'title': 'Quản lý Đặt Hàng và Giao Hàng',
      'image': 'order.png',
      'description': 'Hỗ trợ đặt hàng trực tuyến và theo dõi tình trạng đơn đặt hàng.',
    },
    {
      'title': 'Chương Trình Khuyến Mãi và Giảm Giá',
      'image': 'promotion.png',
      'description': 'Tạo chương trình khuyến mãi, giảm giá hoặc quà tặng đặc biệt.',
    },
    {
      'title': 'Tích Hợp Hệ Thống Đánh Giá và Phản Hồi',
      'image': 'feedback.png',
      'description': 'Cho phép khách hàng đánh giá sản phẩm và dịch vụ.',
    },
    {
      'title': 'Tích Hợp Chức Năng Quảng Cáo và Marketing',
      'image': 'marketing.png',
      'description': 'Hiển thị quảng cáo sản phẩm nổi bật và tích hợp tính năng chia sẻ sản phẩm và ưu đãi trên các nền tảng xã hội.',
    },
  ];
  @override
  //like render() in React Class Component
  Widget build(BuildContext context) {
    final String title = functionalities[0]['title'] as String ?? '';
    final String description = functionalities[0]['description'] as String ?? '';
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //justity content in react
          crossAxisAlignment: CrossAxisAlignment.center,//align-items in react
          children: [
            Image(image: AssetImage('assets/inventory.png')),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(description,
                  style: TextStyle(
                  fontSize: 15,
              )),
            ),
          ],
        ),
      )
    );
  }
}
