import 'package:flutter/material.dart';

class FloatingAction extends StatefulWidget {
  FloatingAction({super.key});

  @override
  State<FloatingAction> createState() => _FloatingActionState();
}

class _FloatingActionState extends State<FloatingAction> {
  int x = 20;
// check this video  https://www.youtube.com/watch?v=FQhZr0UA6DE&list=PLFyjjoCMAPtzn7tFLRV3eny7G74LnlMRt&index=3+
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(DateTime.now().toString()), //check with this entire screen rebuilding
            Center(
              child: Text(
                x.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          print(x.toString());
          setState(() {});
          //this gives sequence wise increase
          // print(x++); //this increase odd sequence
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
