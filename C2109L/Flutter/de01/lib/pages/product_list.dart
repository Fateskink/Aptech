import 'package:de01/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});
  List<Product> products = [
    Product(title: 'Mouse', description: 'P001', price: 100, color: 0xFF000000),
    Product(title: 'Keyboard', description: 'P002', price: 200, color: 0xFF00FF00),
    Product(title: 'Monitor', description: 'P003', price: 500, color: 0xFF0000FF),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              Product selectedProduct = products[index];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text(selectedProduct.title),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectedProduct.title),
                        Text('${selectedProduct.price}'),
                        Container(
                          width: 40,
                          height: 40,
                          color: Color(selectedProduct.color),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      color: Colors.black26,
                      height: 1,
                      width: double.infinity,
                    )
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
