import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'common_icons_text.dart';

class DrawScreen extends StatelessWidget {
  const DrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Add action for the circle avatar
            },
            child: Container(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pic one.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconText(
              iconData: Icons.person,
              text: 'Name',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Edit Profile',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Age',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Proper',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Height',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Color',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Sub Case',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Profession',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Salary',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Height',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Properties',
            ),
            IconText(
              iconData: Icons.person,
              text: 'Location',
            ),
            Container(
              height: 35,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Center(
                    child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
