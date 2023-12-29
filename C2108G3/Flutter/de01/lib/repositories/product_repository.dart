import 'package:de01/models/product.dart';

class ProductRepository {
  List<Product> products = <Product>[
    //create fake products here
    Product(
      code: '001',
      name: 'Product 1',
      hexValue: 0xFF0000,
      price: 9.99,
    ),
    Product(
      code: '002',
      name: 'Product 2',
      hexValue: 0x00FF00,
      price: 19.99,
    ),
    Product(
      code: '003',
      name: 'Product 3',
      hexValue: 0x0000FF,
      price: 14.99,
    ),
  ];

  Future<List<Product>> fetchProducts() async {
    // Simulate fetching products from an external source (e.g., API, database)
    await Future.delayed(const Duration(milliseconds: 2000));
    return products;
  }

  Future<void> addProduct(Product product) async {
    if(products.where((element) =>
        element.name == product.name || element.code == product.code
    ).isNotEmpty) {
      print('Cannot insert because name|code is duplicated');
      return;
    }
    print('Adding product: $product');
    products.add(product);
    await Future.delayed(const Duration(milliseconds: 2000));
  }
}