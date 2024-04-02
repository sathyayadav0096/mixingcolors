import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodeRunningIosAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isAndroid = GetPlatform.isAndroid;

    return Scaffold(
      appBar: AppBar(
        title: Text('Platform Check'),
      ),
      body: Center(
        child: Text(
          isAndroid ? ' on Android' : 'Not running on Android',
          style: TextStyle(fontSize: 20),

        ),
      ),
    );
  }
}
