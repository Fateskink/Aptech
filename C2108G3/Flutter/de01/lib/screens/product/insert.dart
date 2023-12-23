import 'package:flutter/material.dart';

class InsertProductScreen extends StatefulWidget {
  InsertProductScreen({super.key});
  @override
  State<InsertProductScreen> createState() => _InsertProductScreenState();
}

class _InsertProductScreenState extends State<InsertProductScreen> {
  TextEditingController _codeTextFieldController = TextEditingController();
  TextEditingController _nameTextFieldController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _codeTextFieldController.dispose();
    _nameTextFieldController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Code',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                ),
                controller: _codeTextFieldController
              ),
              TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                  controller: _nameTextFieldController
              ),
              Row(
                children: [
                  Text('Color'),
                  DropdownButton<String>(
                    value: 'Red',
                    items: ['Red', 'Green', 'Blue', 'Yellow']
                        .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    onChanged: (String? selectedItem) {
                      print(selectedItem ?? '');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}