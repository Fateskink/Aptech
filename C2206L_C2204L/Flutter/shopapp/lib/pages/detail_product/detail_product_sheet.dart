import 'package:flutter/material.dart';
import 'package:foodapp/dtos/responses/product/product.dart';

class ProductDetailsSheet extends StatefulWidget {
  final Product product;
  final bool isBottomSheetVisible;
  final VoidCallback toggleBottomSheet;
  final VoidCallback decreaseCount;
  final VoidCallback increaseCount;
  final int itemCount;

  ProductDetailsSheet({
    required this.product,
    required this.isBottomSheetVisible,
    required this.toggleBottomSheet,
    required this.decreaseCount,
    required this.increaseCount,
    required this.itemCount,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsSheet> createState() => _ProductDetailsSheetState();
}

class _ProductDetailsSheetState extends State<ProductDetailsSheet> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: widget.isBottomSheetVisible ? MediaQuery.of(context).size.height * 2 / 3 : 0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          // Exit button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: widget.toggleBottomSheet,
              ),
            ],
          ),
          // Product image
          Image.network(widget.product.thumbnail), // Replace with your product image URL
          // Count buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: widget.decreaseCount,
              ),
              Text('${widget.itemCount}'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: widget.increaseCount,
              ),
            ],
          ),
          // Add to Cart button
          ElevatedButton(
            onPressed: () {
              // Add to Cart action
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
