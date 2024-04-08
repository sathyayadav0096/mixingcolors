import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData iconData;
  final String text;

  const IconText({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(iconData,size: 18,),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.blue,fontSize: 12
        ),
      ),
    );
  }
}

