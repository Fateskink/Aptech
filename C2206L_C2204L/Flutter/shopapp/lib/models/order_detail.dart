
class OrderDetail {
  final int id;
  final int quantity;
  final double price;
  final String productName;

  OrderDetail({
    required this.id,
    required this.quantity,
    required this.price,
    required this.productName,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      price: json['price'] as double,
      productName: json['product_name'] as String,
    );
  }
}
