import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;

  const CustomButton({
    Key? key,
    this.onTap,
    required this.text,
    this.textColor = Colors.white,//defaut value
    this.backgroundColor = Colors.red,
    this.borderColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25), // Border radius of 25
          border: Border.all(
            width: 1, // Border width of 1
            color: borderColor, // Border color
          ),
        ),
      ),
    );
  }
}
