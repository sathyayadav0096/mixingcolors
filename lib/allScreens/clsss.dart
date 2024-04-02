import 'package:flutter/material.dart';

import 'floatingactionbutton.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FloatingAction(),
    );
  }
}
