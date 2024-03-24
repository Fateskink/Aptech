import 'package:flutter/material.dart';
import 'package:foodapp/services/category_service.dart';
import 'package:foodapp/services/product_service.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert' as convert;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ProductService productService;
  late CategoryService categoryService;

  @override
  void initState() {
    super.initState();
    productService = GetIt.instance<ProductService>();
    categoryService = GetIt.instance<CategoryService>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Handle search button tap
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  // Replace the following buttons with your category buttons
                  ElevatedButton(
                    onPressed: () {
                      // Handle button tap
                    },
                    child: Text('Category 1'),
                  ),
                  SizedBox(width: 8), // Adjust the spacing as needed
                  ElevatedButton(
                    onPressed: () {
                      // Handle button tap
                    },
                    child: Text('Category 2'),
                  ),
                ],
              ),
            ],
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.15, // Adjust the top position
            child: ListView.builder(
              itemCount: 10, // Replace with the actual number of products
              itemBuilder: (context, index) {
                // Replace the following placeholder widgets with your product items
                return ListTile(
                  leading: Icon(Icons.image), // Replace with product thumbnail
                  title: Text('Product $index'),
                  subtitle: Text('Description'), // Replace with product description
                  trailing: Text('\$20.00'), // Replace with product price
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}