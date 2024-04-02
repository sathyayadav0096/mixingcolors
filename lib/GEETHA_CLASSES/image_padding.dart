import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PadImg extends StatelessWidget {
  const PadImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 650,
                child: Image.asset(
                  'assets/img.jpg',
                  fit: BoxFit
                      .cover, // Specify the fit property inside the Image.asset widget
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 460),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150),
                          bottomRight: Radius.circular(250))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
