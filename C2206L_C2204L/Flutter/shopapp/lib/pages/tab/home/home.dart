import 'package:flutter/material.dart';
import 'package:foodapp/dtos/requests/category/get_category_request.dart';
import 'package:foodapp/dtos/responses/api_response.dart';
import 'package:foodapp/models/category.dart';
import 'package:foodapp/services/category_service.dart';
import 'package:foodapp/services/product_service.dart';
import 'package:foodapp/utils/app_colors.dart';
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
  int page = 0;
  int limit = 20;
  Category? selectedCategory;

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
                  FutureBuilder<ApiResponse>(
                    future: categoryService.getCategories(
                        GetCategoryRequest(page: page, limit: limit)
                    ), // Assuming getCategories() returns a Future<List<Category>>
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Show loading indicator while fetching data
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        ApiResponse apiResponse = snapshot.data! as ApiResponse;
                        final categories = apiResponse.data;
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCategory = null; // Set selectedCategory to null when "All" is tapped
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: selectedCategory == null ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text('All'),
                              ),
                            ),
                            SizedBox(width: 8), // Adjust the spacing as needed
                            ...categories.map((category) {
                              final isSelected = selectedCategory?.id == category.id;
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: isSelected ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(category.name),
                                ),
                              );
                            }).toList(),
                          ],
                        )
                        ;
                      }
                    },
                  ),
                ],
              )

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