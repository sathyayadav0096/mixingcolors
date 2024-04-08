import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../linear_grident/linear_grident.dart';
import 'app_bar_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreenMarriage(),
  ));
}

class HomeScreenMarriage extends StatefulWidget {
  const HomeScreenMarriage({Key? key}) : super(key: key);

  @override
  State<HomeScreenMarriage> createState() => _MarriageHomeScreen();
}

class _MarriageHomeScreen extends State<HomeScreenMarriage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _bottomNavigationPages = <Widget>[
    HomeScreenInside(),
    const MatchesScreen(),
    const MailScreen(),
    const ChatScreen(),
    const SearchScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sathya Yadav',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Member Ship',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 15),
            child: InkWell(
              onTap: () {
                navigateToLocalStorage(); // Call function to navigate to local storage
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pic one.jpg'),
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: DrawScreen(),
      ),
      body: Center(child: _bottomNavigationPages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red.shade200,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Matches'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Mails'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreenInside extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade200,
      body: const Center(
          child: Text('Welcome Home Page',
              style: TextStyle(color: Colors.white, fontSize: 40))),
    );
  }
}

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: const Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Matches Screen')])),
    );
  }
}

class MailScreen extends StatelessWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: const Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Mail Screen')])),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Cart Screen')])),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Search Screen',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35))
          ])),
    );
  }
}

Future<void> navigateToLocalStorage() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  // Do whatever navigation logic you need here
  // For example, you can navigate to a new screen showing the local storage directory
  Get.to(LocalStorageScreen(path: appDocPath));
}

class LocalStorageScreen extends StatelessWidget {
  final String path;

  const LocalStorageScreen({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Storage Directory'),
      ),
      body: Center(
        child: Text('Local Storage Path: $path'),
      ),
    );
  }
}
