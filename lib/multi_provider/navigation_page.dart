import 'package:flutter/material.dart';

class ExtraClass extends StatefulWidget {
  const ExtraClass({super.key});

  @override
  State<ExtraClass> createState() => _ExtraClassState();
}

class _ExtraClassState extends State<ExtraClass> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              'Testing Provider',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
