import 'package:flutter/material.dart';

class ReverseString extends StatelessWidget {
  const ReverseString({super.key});

  @override 
  Widget build(BuildContext context) {
    String originalString = "Sathya Yadav";

    List<String> characters = originalString.split('');

    String reversedString = characters.reversed.join();

    return Scaffold(
      body: Center(
        child: Text(
          'Reversed String: $reversedString',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
