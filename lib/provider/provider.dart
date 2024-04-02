import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderClass extends StatefulWidget {
  const ProviderClass({super.key});

  @override
  State<ProviderClass> createState() => _ProviderClassState();
}

class _ProviderClassState extends State<ProviderClass> {
  @override
  void initState() {
    var timerProvider = Provider.of<TimerProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      timerProvider.updateTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<TimerProvider>(builder: (context, data, child) {
                return Text(
                  "${data.countDown}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerProvider extends ChangeNotifier {
  int countDown = 999;

  updateTime() {
    countDown--;
    notifyListeners();
  }
}
