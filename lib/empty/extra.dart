import 'package:flutter/material.dart';

class TetingCicdClass extends StatefulWidget {
  const TetingCicdClass({super.key});

  @override
  State<TetingCicdClass> createState() => _TetingCicdClassState();
}

class _TetingCicdClassState extends State<TetingCicdClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children: [Text('Hello')],
    ),);
  }
}
