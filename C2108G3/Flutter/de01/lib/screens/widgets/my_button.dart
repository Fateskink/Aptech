
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final GestureTapCallback onPress;
  final String title;
  const MyButton({
    super.key,
    required this.onPress,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width:250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.deepPurple
        ),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 20,
          ),
        ),
      ),
    );
  }
}
