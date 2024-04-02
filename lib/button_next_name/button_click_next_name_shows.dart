import 'package:flutter/material.dart';

class FirstSecondName extends StatefulWidget {
  const FirstSecondName({super.key});

  @override
  State<FirstSecondName> createState() => _FirstSecondNameState();
}

class _FirstSecondNameState extends State<FirstSecondName> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(click ? 'Geetha' : 'Ravindra'),
            TextButton(
                onPressed: () {
                  setState(() {
                    click = !click;
                  });
                },
                child: Text('Ok'))
          ],
        ),
      ),
    );
  }
}
