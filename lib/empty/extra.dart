import 'package:flutter/material.dart';

import '../PERSONL_APP/app_bar_screen.dart';

class checktest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main Title',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Subtitle',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: Drawer(child: DrawScreen()),
    );
  }
}
