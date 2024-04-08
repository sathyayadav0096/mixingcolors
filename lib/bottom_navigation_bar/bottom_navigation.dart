import 'package:flutter/material.dart';

import 'calls_page.dart';
import 'camera_page.dart';
import 'chats_page.dart';
import 'home_page.dart';

class BottomItemsNavigation extends StatefulWidget {
  const BottomItemsNavigation({Key? key}) : super(key: key);

  @override
  State<BottomItemsNavigation> createState() => _BottomItemsNavigationState();
}

class _BottomItemsNavigationState extends State<BottomItemsNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _bottomNavigationPages = <Widget>[
    CallsPage(),
    CameraPage(),
    ChatsPage(),
    HomePage(),
    AppPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _bottomNavigationPages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade300,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_check),
            label: 'Safety',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          'Hello',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
