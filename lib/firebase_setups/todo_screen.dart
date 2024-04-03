import 'package:flutter/material.dart';

class ToDoScrn extends StatefulWidget {
  const ToDoScrn({super.key});

  @override
  State<ToDoScrn> createState() => _ToDoScrnState();
}

class _ToDoScrnState extends State<ToDoScrn> {
  int _count = 1;

  void _increaseCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade500,
          title: const Text('Flutter Demo Home Page'),
          titleTextStyle: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              Text(
                '${_count}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blueGrey.shade500),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey.shade500,
          onPressed: () {
            _increaseCount();
          },
          tooltip: 'Increase',
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
