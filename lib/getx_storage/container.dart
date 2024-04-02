import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class DataStorageGtx extends StatelessWidget {
  final _storage = GetStorage(); // Create an instance of GetStorage

  DataStorageGtx() {
    _initStorage(); // Initialize GetStorage
  }

  void _initStorage() async {
    await GetStorage.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetStorage Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetStorage Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _storage.write('key', 'Hello, GetStorage!'); // Write to storage
                },
                child: Text('Write to Storage'),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     String value = _storage.read('key'); // Read from storage
              //     print(value);
              //   },
              //   child: Text('Read from Storage'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     _storage.remove('key'); // Remove from storage
              //   },
              //   child: Text('Remove from Storage'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
