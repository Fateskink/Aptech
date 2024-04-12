import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foodapp/dtos/responses/product/product_reponse.dart';
import 'package:foodapp/models/comment.dart';
import 'package:foodapp/models/product_image.dart';
import 'package:foodapp/services/product_service.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/widgets/loading.dart';
import 'package:foodapp/widgets/transparent_appbar.dart';
import 'package:get_it/get_it.dart'; // Import the carousel_slider package
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DetailProduct extends StatefulWidget {
  final int productId;
  DetailProduct({required this.productId});
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  late ProductService productService;
  @override
  void initState() {
    super.initState();
    productService = GetIt.instance<ProductService>();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: 'Detail product',
        onBack: () {
          context.go('/apptab');
        },
      ),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: productService.getProductById(widget?.productId ?? 0), // Call your API here
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Loading(); // Show loading indicator while waiting for data
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}')); // Show error message if there's an error`
            } else {
              // Data fetched successfully, display ListView
              ProductResponse productResponse = snapshot.data!; // Extract products from the response
              List<ProductImage> productImages = productResponse.productImages;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CarouselSlider(
                      items: productImages.map((productImage) {
                        return Image.network(
                          productImage.imageUrl,
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productResponse.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Price: \$'+'${productResponse.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            productResponse.description,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star_half, color: Colors.amber),
                              Icon(Icons.star_border, color: Colors.amber),
                              SizedBox(width: 8),
                              Text(
                                '4.5 (1234 reviews)',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'User Comments:',
                            style: Theme.of(context).textTheme?.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 8),
                          ...productResponse.comments.map((comment) => Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${comment.user.fullName}',
                                      style: Theme.of(context).textTheme?.bodySmall?.copyWith(
                                          fontWeight: FontWeight.bold
                                      )),
                                  Text('${comment.content}',
                                      style: Theme.of(context).textTheme?.bodySmall),
                                  Text(DateFormat('dd-MM-yyyy HH:mm:ss').format(comment.createdAt)),
                                ]
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              // Action for Buy Now button
            },
            label: Text('Buy Now', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white, // Set text color to white
            ),),
            heroTag: 'buy',
            icon: Icon(Icons.shopping_cart),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white, // Text and icon color
          ),
          SizedBox(width: 8),
          FloatingActionButton.extended(
            onPressed: () {
              // Action for Cart button
            },
            label: Text('Cart', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white, // Set text color to white
            )),
            heroTag: 'btnCart',
            icon: Icon(Icons.add_shopping_cart),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white, // Text and icon color
          ),
        ],
      )
      ,
    );
  }
}
