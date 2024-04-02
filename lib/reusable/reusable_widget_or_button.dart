import 'package:flutter/material.dart';

class ImButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reusable Widget Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              // Using the ReusableWidget
              child: ReusableWidget(
                text: 'Press',
              ),
            ),
            SizedBox(height: 10),

            ReusableWidget(text: 'Secos'),
            SizedBox(height: 10),
            ReusableWidget(text: 'Third')
          ],
        ),
      ),
    );
  }
}

// ReusableWidget definition
class ReusableWidget extends StatelessWidget {
  final String text;

  ReusableWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18.0, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

