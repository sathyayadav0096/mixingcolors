import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Linear Gradient Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange,Colors.blue],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topCenter
                  ),
                ),
              ),
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.green,Colors.yellow],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter
                  ),
                ),
              ),
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.pink,Colors.white],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter
                  ),
                ),
              ),
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.yellowAccent,Colors.black],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter
                  ),
                ),
              ),
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.brown,Colors.red],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter
                  ),
                ),
              ),
              // Container(
              //   height: 120,
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //         colors: [Colors.deepOrange,Colors.blue],
              //         begin: Alignment.bottomLeft,
              //         end: Alignment.topCenter
              //     ),
              //   ),
              // ),
              Container(height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red,Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft
                )
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
