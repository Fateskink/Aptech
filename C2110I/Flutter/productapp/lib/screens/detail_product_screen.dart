import 'package:flutter/material.dart';
import 'package:productapp/models/my_color.dart';
import 'package:productapp/models/product.dart';
class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  late TextEditingController _textEditingCodeController;
  late TextEditingController _textEditingNameController;
  late TextEditingController _textEditingPriceController;

  MyColor selectedColor = MyColor.getColors().first;
  Product? selectedProduct;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingCodeController = TextEditingController();
    _textEditingNameController = TextEditingController();
    _textEditingPriceController = TextEditingController();
  }
  @override
  void dispose() {
    _textEditingCodeController.dispose();
    _textEditingNameController.dispose();
    _textEditingPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXAM'),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _textEditingCodeController,
                decoration: InputDecoration(
                  hintText: 'Code',
                ),
              ),
              TextField(
                controller: _textEditingNameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text('Color: ', style: TextStyle(fontSize: 17),),
                    DropdownMenu<MyColor>(
                      initialSelection: MyColor.getColors().first,
                      onSelected: (MyColor? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          selectedColor = value!;
                        });
                      },
                      dropdownMenuEntries: MyColor.getColors().map<DropdownMenuEntry<MyColor>>((MyColor value) {
                        return DropdownMenuEntry<MyColor>(value: value, label: value.name);
                      }).toList(),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              TextField(
                controller: _textEditingPriceController,
                decoration: InputDecoration(
                  hintText: 'price',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    this.selectedProduct = Product(
                        code: _textEditingCodeController.text,
                        name: _textEditingCodeController.text,
                        price: double.parse(_textEditingPriceController.text ?? '0'),
                        color: this.selectedColor
                    );
                  },
                      child: Text('Save', style: TextStyle(fontSize: 18),)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
