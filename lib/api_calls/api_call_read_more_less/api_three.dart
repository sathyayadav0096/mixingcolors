import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class ThirdApiCls extends StatefulWidget {
  const ThirdApiCls({super.key});

  @override
  State<ThirdApiCls> createState() => _ThirdApiClsState();
}

class _ThirdApiClsState extends State<ThirdApiCls> {
  List<ModelData> modelData = [];
  bool showAllLines = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: functionData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: modelData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('User Id: ${modelData[index].userId}',
                                  style: const TextStyle(color: Colors.white)),
                              Text('Title:,${modelData[index].title}',
                                  style: const TextStyle(color: Colors.white)),

                              Text(
                                'Body: ${modelData[index].body}',
                                maxLines: showAllLines ? null : 2, // Show all lines if showAllLines is true
                                style: const TextStyle(color: Colors.white),
                              ),
                              if (!showAllLines) // Show "Read More" button only if not showing all lines
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showAllLines = true; // Toggle to show all lines
                                    });
                                  },
                                  child: const Text(
                                    'Read More',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              if (showAllLines) // Show "Read Less" button only if showing all lines
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showAllLines = false; // Toggle to show limited lines
                                    });
                                  },
                                  child: const Text(
                                    'Read Less',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<List<ModelData>> functionData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          modelData.add(ModelData.fromJson(index));
        }
      }
    } catch (e) {
      print('Error Data: $e');
      return modelData;
    }
    return modelData;
  }
}
