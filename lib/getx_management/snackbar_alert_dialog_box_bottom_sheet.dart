import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxClass1 extends StatefulWidget {
  const GetxClass1({super.key});

  @override
  State<GetxClass1> createState() => _GetxClass1State();
}

class _GetxClass1State extends State<GetxClass1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Getx _ Class',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.showSnackbar(
                  const GetSnackBar(
                    message: 'Hello This USA',
                    title: "Getx",
                    // show snack bar message is mandatory
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Click to Snack Bar'),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      radius: 200,
                      title: 'Logout',
                      content: Text('Do You Want To Logout'),
                      cancel: Text('Cancell'),
                      onCancel: () {
                        Get.back();
                      },
                      //onWillPop: ()async {return true;},
                      confirm: Text('Confirm'));
                },
                child: Text('dialog box')),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(

                      Container(
                          // height: MediaQuery.of(context).size.height * 6,
                          // width: MediaQuery.of(context).size.height * 10,
                        height: Get.height * 0.1,
                          child: Center(
                              child: Text(
                            'Bottomsheet',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                      backgroundColor: Colors.blue);
                },
                child: Text('Bottom sheet'))
          ],
        ),
      ),
    );
  }
}
