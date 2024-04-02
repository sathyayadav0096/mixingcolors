// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:untitled/api_Tuesday/api_model.dart';
// import 'package:http/http.dart' as http;
//
// import '../common_data/re_button.dart';
// import 'api_model.dart';
//
// class ApiCls extends StatefulWidget {
//   const ApiCls({super.key});
//
//   @override
//   State<ApiCls> createState() => _ApiClsState();
// }
//
// class _ApiClsState extends State<ApiCls> {
//   List<DummyApiModel> _listName = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           'Get Api Call'
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: FutureBuilder(
//           future: getDetailsFromApi(),
//           builder: (contex, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: _listName.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 240,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 const Text(
//                                   'Id Number: ',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16),
//                                 ),
//                                 Text(
//                                   '${_listName[index].id}',
//                                   style: const TextStyle(
//                                       color: Colors.yellow,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20),
//                                 ),
//                               ],
//                             ),
//                             Text(
//                               '${_listName[index].title}',
//                               maxLines: 1,
//                               style: const TextStyle(
//                                   color: Colors.white, fontSize: 16),
//                             ),
//                             Text(
//                               '${_listName[index].body}',
//                               maxLines: 2,
//                               style: const TextStyle(
//                                   color: Colors.white, fontSize: 16),
//                             ),
//                             Text('${_listName[index].userId}'),
//                             Text('${_listName[index].title}'),
//                             const ReButton(
//                               text: 'Close',
//                               textColor: Colors.white,
//                               backgroundColor: Colors.red,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.blue,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Future<List<DummyApiModel>> getDetailsFromApi() async {
//     String token = DummyApiModel.token;  // userModel is model name create model and replace here
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//       headers: headers;
//       var data = jsonDecode(response.body.toString());
//       if (response.statusCode == 200) {
//         for (Map<String, dynamic> index in data) {
//           _listName.add(DummyApiModel.fromJson(index));
//         }
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//     print('Loading..');
//     return [];
//   }
// }
