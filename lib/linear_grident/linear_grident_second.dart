import 'package:flutter/material.dart';

class MyCls extends StatefulWidget {
  const MyCls({Key? key}) : super(key: key);

  @override
  State<MyCls> createState() => _MyClsState();
}

class _MyClsState extends State<MyCls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: <Color>[
                        Color(0xFFDC143C),
                        Color(0xFFFFCD49),
                      ],
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
