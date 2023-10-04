import 'package:productapp/models/my_color.dart';

class Product {
  int? id;
  String name;
  String code;
  double price;
  MyColor color;
  Product({
    this.id,
    required this.code,
    required this.name,
    required this.price,
    required this.color
  });
  Map<String, dynamic> toMap() {
    //Map = json = Dictionary
    var map = <String, dynamic>{
      'name': name,
      'code': code,
      'price': price,
      'color': <String, dynamic> {
        'name': color.name,
        'hexValue': color.color.value
      },
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
  Product.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        code = map['code'],
        price = map['price'],
        color = MyColor.fromMap(map['color']);

  @override
  String toString() =>
      'Code: ${this.code}, name: ${this.name}, price: ${this.price}, color: ${this.color}';

}