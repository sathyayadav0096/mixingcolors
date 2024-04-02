import 'package:flutter/material.dart';

class Text10 extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;

  const Text10(this.text, {this.style, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 10,
          color: Color(0XFF5E5A80)// Set the font size to 10
      ).merge(style), // Merge with any additional style provided
      maxLines: maxLines,
    );
  }
}
