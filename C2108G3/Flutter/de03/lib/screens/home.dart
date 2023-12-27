import 'package:de03/models/product.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        child: FutureBuilder<List<Product>>(
          future: getProducts(),
          builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for the data
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Show an error message if there was an error fetching the data
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              // Use the data to build the ListView
              List<Product> products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  Product product = products[index];
                  // Build your list item widget using the product data
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.description),
                  );
                },
              );
            }
          },
        ),
      )
      )
    ));
  }
}
