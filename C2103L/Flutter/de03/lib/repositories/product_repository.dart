import 'package:de03/models/product.dart';
import 'package:flutter/material.dart';

class ProductRepository {
  List<Product> products = <Product>[
    Product(
      name: 'iPhone 14',
      url: 'https://cdn.hoanghamobile.com/i/preview/Uploads/2023/09/13/iphone-15-black-pure-back-iphone-15-black-pure-front-2up-screen-usen.png',
      price: 134.5,
      color: Colors.white,
    ),
    Product(
      name: 'Samsung Galaxy S22',
      url: 'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2022/02/09/image-removebg-preview-11.png',
      price: 999.99,
      color: Colors.white,
    ),
    Product(
      name: 'Sony Playstation 5',
      url: 'https://thegioigames.vn/wp-content/uploads/2022/08/sony-playstation-5-console-b-4.jpg',
      price: 499.99,
      color: Colors.white,
    ),
    Product(
      name: 'MacBook Pro',
      url: 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp-spacegray-select-202206?wid=1280&hei=1190&fmt=jpeg&qlt=90&.v=1664497359481',
      price: 1999.99,
      color: Colors.white,
    ),
    Product(
      name: 'Nike Air Max',
      url: 'https://product.hstatic.net/1000007560/product/giay_golf_nam_air_max_90_g_dx5999-162_nike__1__97825319ea414de7a9d463e150f453b5_1024x1024.jpg',
      price: 129.99,
      color: Colors.white,
    ),
    Product(
      name: 'Canon EOS R5',
      url: 'https://cdn.vjshop.vn/may-anh/mirrorless/canon/canon-eos-r5/canon-eos-r5-1-500x500.jpg',
      price: 2999.99,
      color: Colors.white,
    ),
    Product(
      name: 'Bose QuietComfort Earbuds',
      url: 'https://bizweb.dktcdn.net/thumb/large/100/451/485/products/sony-wf-1000xm5-jpeg.jpg?v=1686888478397',
      price: 279.99,
      color: Colors.white,
    ),
    Product(
      name: 'Nintendo Switch Lite',
      url: 'https://34gameshop.vn/wp-content/uploads/2023/03/03-1.png',
      price: 199.99,
      color: Colors.white,
    ),
    Product(
      name: 'Amazon Echo Dot (3rd Gen)',
      url: 'https://cdn-amz.woka.io/images/I/6182S7MYC2L._SR476,476_.jpg',
      price: 49.99,
      color: Colors.white,
    ),
    Product(
      name: 'GoPro HERO9 Black',
      url: 'https://cdn.vjshop.vn/camera-hanh-dong/gopro/gopro-11/anh-san-pham/gopro-hero-11-1-500x500.jpg',
      price: 349.99,
      color: Colors.white,
    ),
    Product(
      name: 'Adidas Ultraboost',
      url: 'https://cdn.runningshoesguru.com/wp-content/uploads/2023/03/Adidas-Ultraboost-Light-2-1.jpeg',
      price: 179.99,
      color: Colors.white,
    ),
  ];
  Future<List<Product>> fetchProducts() async {
    // Simulate fetching products from an external source (e.g., API, database)
    await Future.delayed(const Duration(milliseconds: 200));
    return products;
  }
}