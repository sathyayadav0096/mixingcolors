// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ApiCall extends StatelessWidget {
//   const ApiCall({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     apiData();
//     return Scaffold(
//       body: Column(
//         children: [Text('data')],
//       ),
//     );
//   }
//
//   Future apiData() async {
//     var response =
//         await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
//     if (response.statusCode == 200) {
//       print(response.body);
//     }
//   }
// }
