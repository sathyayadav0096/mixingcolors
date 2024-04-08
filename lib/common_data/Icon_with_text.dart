import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final IconData iconData;
  final String text;

  const IconAndText({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}

