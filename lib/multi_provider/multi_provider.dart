import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'navigation_page.dart';

class PrCla extends StatefulWidget {
  const PrCla({super.key});

  @override
  State<PrCla> createState() => _PrClaState();
}

class _PrClaState extends State<PrCla> {
  final String name = 'sathya';
  final String age = 'sathya';
  final String adobge = 'sathya';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Center(
                child: Text(
              'Multi',
              style: TextStyle(fontSize: 80, color: Colors.red),
            )),
            TextButton(
                onPressed: () {
                 //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ExtraClass()));
               Get.to(ExtraClass());
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green
                    )),
                child: Text('Next')),

          ],
        ),
      ),
    );
  }
}
