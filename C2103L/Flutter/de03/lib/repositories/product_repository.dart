import 'package:de03/models/product.dart';

class ProductRepository {
  List<Product> products = <Product>[
    Product(
      name: 'iPhone 14',
      url: 'https://cdn.hoanghamobile.com/i/preview/Uploads/2023/09/13/iphone-15-black-pure-back-iphone-15-black-pure-front-2up-screen-usen.png',
      price: 134.5,
      hexColor: '#FF0000',
    ),
    Product(
      name: 'Samsung Galaxy S22',
      url: 'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2022/02/09/image-removebg-preview-11.png',
      price: 999.99,
      hexColor: '#00FF00',
    ),
    Product(
      name: 'Sony Playstation 5',
      url: 'https://thegioigames.vn/wp-content/uploads/2022/08/sony-playstation-5-console-b-4.jpg',
      price: 499.99,
      hexColor: '#0000FF',
    ),
    Product(
      name: 'MacBook Pro',
      url: 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-spacegray-select-202206?wid=1280&hei=1190&fmt=jpeg&qlt=90&.v=1664497359481',
      price: 1999.99,
      hexColor: '#FF00FF',
    ),
    Product(
      name: 'Nike Air Max',
      url: 'https://product.hstatic.net/1000007560/product/giay_golf_nam_air_max_90_g_dx5999-162_nike__1__97825319ea414de7a9d463e150f453b5_1024x1024.jpg',
      price: 129.99,
      hexColor: '#FFFF00',
    ),
  ];
  Future<List<Product>> fetchProducts() async {
    // Simulate fetching products from an external source (e.g., API, database)
    await Future.delayed(const Duration(milliseconds: 200));
    return products;
  }
}