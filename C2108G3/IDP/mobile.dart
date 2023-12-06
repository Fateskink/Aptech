import 'dart:io';

class Mobile {
  String name;
  String? manufacturer;
  int releasedYear;
  double price;
  static Mobile input() {
    print('Enter name: ');
    String _name = stdin.readLineSync() ?? '';
    print('Enter manufacturer: ');
    String _manufacturer = stdin.readLineSync() ?? '';

    print('Enter releasedYear: ');
    int _releasedYear = int.parse(stdin.readLineSync() ?? '2000');

    print('Enter price: ');
    double _price = double.parse(stdin.readLineSync() ?? '0');
    return new Mobile(
        name: _name,
        releasedYear: _releasedYear,
        price: _price,
        manufacturer: _manufacturer);
  }
  Mobile({
    required this.name,
    this.manufacturer,
    required this.releasedYear,
    required this.price
  });
}