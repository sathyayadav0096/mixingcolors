import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../extra.dart';
import 'get_model.dart';

class GetApiCall extends StatefulWidget {
  const GetApiCall({Key? key}) : super(key: key);

  @override
  State<GetApiCall> createState() => _GetApiCallState();
}

class _GetApiCallState extends State<GetApiCall> {
  List<ApiModelGet> getMethod = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getApi(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: getMethod.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${getMethod[index].id}'),
                              Text(
                                '${getMethod[index].userId}',
                              ),
                              Text('${getMethod[index].title}'),
                              Text(
                                '${getMethod[index].body}',
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }));
  }

  Future<List<ApiModelGet>> getApi() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      print('Api Is Calling Sathya');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          getMethod.add(ApiModelGet.fromJson(index));
        }
      }
    } catch (e) {
      print('Error: $e');
    }
    return getMethod;
  }
}
