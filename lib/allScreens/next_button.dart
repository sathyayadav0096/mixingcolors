import 'package:flutter/material.dart';

class NextButtonScreen extends StatefulWidget {
  const NextButtonScreen({super.key});

  @override
  State<NextButtonScreen> createState() => _NextButtonScreenState();
}

class _NextButtonScreenState extends State<NextButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome',
            style: TextStyle(color: Colors.red, fontSize: 40),
          )
        ],
      ),
    );
  }
}
