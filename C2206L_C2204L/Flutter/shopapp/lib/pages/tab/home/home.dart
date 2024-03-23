import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    productService = GetIt.instance<ProductService>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites'),
    );
  }
}