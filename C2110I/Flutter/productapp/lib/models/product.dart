import 'package:productapp/models/my_color.dart';

class Product {
  String name;
  String code;
  double price;
  MyColor color;
  Product({
    required this.code,
    required this.name,
    required this.price,
    required this.color
  });
  @override
  String toString() =>
      'Code: ${this.code}, name: ${this.name}, price: ${this.price}, color: ${this.color}';

}