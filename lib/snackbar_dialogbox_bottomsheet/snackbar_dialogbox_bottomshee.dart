import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SnackBottomDialogBox extends StatefulWidget {
  const SnackBottomDialogBox({super.key});

  @override
  State<SnackBottomDialogBox> createState() => _SnackBottomDialogBoxState();
}

class _SnackBottomDialogBoxState extends State<SnackBottomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar'),
      ),
      body: Column(
        children: [
          TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: () {
                Get.showSnackbar(const GetSnackBar(
                  backgroundColor: Colors.blue,
                  duration: Duration(seconds: 1),
                  title: 'Please Wait',
                  message: 'it takes some times please wait for some time',
                ));
              },
              child: const Text('Get Snack')),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30),
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Get.defaultDialog(
                      cancel: const Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                      textCancel: 'Cancel',
                      onCancel: () {
                        Get.back();
                      },
                      textConfirm: 'Ok',
                      onConfirm: () {
                        Get.back();
                      },
                      title: 'Are Sure!',
                      middleText: 'Please Select Stay or Exit');
                },
                child: const Text('Dialog Box')),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: Get.height * 0.2,
                    width: double.infinity,
                    child: const Text(
                        'Hello guys this is not correct way to use this course'),
                  ),
                  shape: RoundedRectangleBorder(
                      //this line helps to remove the bottomsheet radious
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.white,
                );
              },
              child: const Text(
                'Bottom Sheet',
                style: TextStyle(color: Colors.black),
              )),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.cancel)),
          ElevatedButton(
              onPressed: () {
                Get.to(const ThemeTesting());
              },
              child: const Text('Change Theme'))
        ],
      ),
    );
  }
}

class ThemeTesting extends StatefulWidget {
  const ThemeTesting({super.key});

  @override
  State<ThemeTesting> createState() => _ThemeTestingState();
}

class _ThemeTestingState extends State<ThemeTesting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Center(child: Text('Theme')),
              ElevatedButton(
                  onPressed: () {
                    Get.updateLocale(const Locale('te-IN'));
                  },
                  child: const Text('Language')),
            ],
          ),
        ),
      ),
    );
  }
}
