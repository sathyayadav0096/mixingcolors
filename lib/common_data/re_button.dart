import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;

  const ReButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: TextButton(
        onPressed: () {
          Get.back();
        },
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
