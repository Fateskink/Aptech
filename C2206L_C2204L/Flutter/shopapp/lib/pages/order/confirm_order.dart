import 'package:flutter/material.dart';
import 'package:foodapp/dtos/requests/coupon/coupon_request.dart';
import 'package:foodapp/dtos/responses/product/product.dart';
import 'package:foodapp/enums/popup_type.dart';
import 'package:foodapp/services/coupon_service.dart';
import 'package:foodapp/services/product_service.dart';
import 'package:foodapp/utils/app_colors.dart';
import 'package:foodapp/utils/utility.dart';
import 'package:foodapp/widgets/info_popup.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  late CouponService couponService;
  late ProductService productService;

  final TextEditingController _couponController = TextEditingController();

  String shippingMethod = 'Express';
  String paymentMethod = 'COD';
  String address = '';
  List<Product> products = [];
  Map<int, int> cartMap = {};
  @override
  void initState() {
    super.initState();
    couponService = GetIt.instance<CouponService>();
    productService = GetIt.instance<ProductService>();
    initData();
  }

  void initData() async {
    cartMap = await productService.getCart();
    List<int> productIds = cartMap.keys.toList();
    List<Product> products = await productService.getProductByIds(productIds);

    setState(() {
      this.products = products;
    });
  }
  double get totalPrice {
    return products.fold(0.0, (sum, product) {
      int numberOfProducts = cartMap[product.id] ?? 1;
      return sum + (product.price * numberOfProducts);
    });
  }
  double totalPriceWithCoupon = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Order'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.of(context).pop();
            context.go('detail_product');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '123 Đường ABC, Quận XYZ, TP. HCM',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                shrinkWrap: true, // Important to set this to true
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        // Product Image
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product.thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16), // Spacer

                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8), // Spacer
                              Text('Price: \$${product.price.toStringAsFixed(2)}'),
                              Text('Ordered quantity: ${cartMap[product.id] ?? 0}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(height: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total amount:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${totalPrice} USD',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _couponController,
                      decoration: InputDecoration(
                        hintText: 'Nhập mã coupon',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          totalPriceWithCoupon = await couponService.calculateCoupon(CouponRequest(
                              couponCode: _couponController.text,
                              totalAmount: totalPrice)
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping method',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Radio(
                        value: 'Express',
                        groupValue: shippingMethod,
                        onChanged: (value) {
                          setState(() {
                            shippingMethod = value.toString();
                          });
                        },
                      ),
                      Text('Express'),
                      SizedBox(width: 16),
                      Radio(
                        value: 'Normal',
                        groupValue: shippingMethod,
                        onChanged: (value) {
                          setState(() {
                            shippingMethod = value.toString();
                          });
                        },
                      ),
                      Text('Normal'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment method',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Radio(
                        value: 'COD',
                        groupValue: paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value.toString();
                          });
                        },
                      ),
                      Text('COD'),
                      SizedBox(width: 16),
                      Radio(
                        value: 'Others',
                        groupValue: paymentMethod,
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value.toString();
                          });
                        },
                      ),
                      Text('Others'),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Utility.alert(
                context: context,
                message: 'Order successfully',
                popupType: PopupType.success,
                onOkPressed: () {
                  context.go('/apptab');
                });
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return InfoPopup(
                  popupType: PopupType.success,
                  message: 'Order successfully',
                  onOkPressed: () {
                    // Xử lý khi bấm nút OK
                    print('Đã bấm nút OK');
                  },
                );
              },
            );

          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Payment',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),),
    );
  }
}
