import 'package:flutter/material.dart';
import 'package:foodapp/dtos/responses/product/product_list_response.dart';
import 'package:foodapp/dtos/responses/product/product_reponse.dart';
import 'package:foodapp/services/product_service.dart';
import 'package:get_it/get_it.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late ProductService productService;


  @override
  void initState() {
    super.initState();
    productService = GetIt.instance<ProductService>();

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductListResponse>(
      future: productService.findProductsByUserId(), // Call the productService to fetch data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show a loading indicator while data is being fetched
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); // Show an error message if fetching data fails
        } else {
          List<ProductResponse> productResponses = snapshot.data!.products; // Extract products from the response
          if (productResponses != null && productResponses.isNotEmpty) {
            // If products exist, return a ListView to display them
            return ListView.builder(
              itemCount: productResponses.length,
              itemBuilder: (context, index) {
                ProductResponse product = productResponses[index];
                // Return a ListTile for each product
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  // Add more details or customize the ListTile as needed
                );
              },
            );
          } else {
            // If no products are returned, display a message indicating so
            return Center(child: Text('No products found.'));
          }
        }
      },
    );
  }
}
