import 'package:flutter/material.dart';

class TexWidge extends StatelessWidget {
  const TexWidge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: const Text('Reusable Widget'),
        ),
      ],
    ));
  }
}
