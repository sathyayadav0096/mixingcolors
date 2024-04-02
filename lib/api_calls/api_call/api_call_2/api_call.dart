import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_model.dart';

class SecondCall extends StatefulWidget {
  const SecondCall({super.key});

  @override
  State<SecondCall> createState() => _SecondCallState();
}

class _SecondCallState extends State<SecondCall> {
  List<SecondModel> listTwo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiCallSecond(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: listTwo.length,
                  itemBuilder: (context, index) {
                   return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            child: Text('title: ${listTwo[index].body}'),
                            color: Colors.red,
                          ),
                        )
                      ],
                    );
                  });
            }
            return Center(child: Text('Loading...'));
          }),
    );
  }

  Future<List<SecondModel>> ApiCallSecond() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('working');
        print(data());
        for (int a = 0; a < data.length; a++) {
          listTwo.add(SecondModel.fromJson(data[a]));
        }
      }
      return listTwo;
    } catch (l) {
      print('Error: $l');
      return [];
    }
  }
}


