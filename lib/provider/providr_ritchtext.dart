import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Prd extends StatefulWidget {
  const Prd({Key? key}) : super(key: key);

  @override
  State<Prd> createState() => _PrdState();
}

class _PrdState extends State<Prd> {
  @override
  void initState() {
    super.initState();

    var varName = Provider.of<ClassPrd>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      varName.functionCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ClassPrd>(builder: (context, data, child) {
              // Convert the values to a string
              String valuesString = data.values.toString();

              return RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: valuesString.substring(0, 1),
                      style: TextStyle(color: Colors.green,fontSize: 120),
                    ),
                    TextSpan(
                      text: valuesString.substring(1, 2),
                      style: TextStyle(color: Colors.red,fontSize: 40),
                    ),
                    TextSpan(
                      text: valuesString.substring(2, 3),
                      style: TextStyle(color: Colors.blue, fontSize: 80),
                    ),
                    TextSpan(
                      text: valuesString.substring(3),
                      style: TextStyle(fontSize: 150, color: Colors.black),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class ClassPrd extends ChangeNotifier {
  int values = 9999;

  void functionCount() {
    values--;
    notifyListeners();
  }
}
