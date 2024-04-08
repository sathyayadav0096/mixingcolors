import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostAndGet extends StatefulWidget {
  const PostAndGet({super.key});

  @override
  _PostAndGetState createState() => _PostAndGetState();
}

class _PostAndGetState extends State<PostAndGet> {
  final TextEditingController _textEditingController = TextEditingController();
  String _apiResponse = '';

  Future<void> submit(String pincode) async {
    // API Endpoint URL
    String apiUrl = 'https://api.postalpincode.in/pincode/$pincode';

    // Fetching data from the API
    http.Response response = await http.get(
      Uri.parse(apiUrl),
    );
    //
    // // POST Methode
    // http.Response responsePost = await http.post(
    //   Uri.parse(apiUrl),
    //   body: jsonEncode({'input_data': _textEditingController.text}),
    // );
    //
    print(response.body);
    // Check if the API call was successful
    if (response.statusCode < 300) {
      _apiResponse = jsonDecode(response.body)[0]['PostOffice'][0]['Name'];
    } else {
      // If API call fails, update state with error message
      _apiResponse = 'Failed to fetch data from API';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'Enter Data',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                submit(_textEditingController.text);
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20.0),
            Text(
              _apiResponse,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
