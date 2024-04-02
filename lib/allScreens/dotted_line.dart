// import 'package:flutter/material.dart';
// import 'package:dotted_line/dotted_line.dart';
//
// class DottedLineScreen extends StatefulWidget {
//   final bool isSfald;
//
//   const DottedLineScreen({Key? key, this.isSfald = false}) : super(key: key);
//
//   @override
//   State<DottedLineScreen> createState() => _DottedLineScreenState();
// }
//
// class _DottedLineScreenState extends State<DottedLineScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 200,
//                     width: 200,
//                     color: Colors.red,
//                   ),
//                   SizedBox(width: 7),
//                   const DottedLine(
//                     direction: Axis.vertical,
//                     lineLength: 200, // increase dots height
//                     lineThickness: 3,
//                     dashLength: 7, // dots size
//                     dashColor: Colors.red,
//                     dashRadius: 1,
//                   ),
//                   SizedBox(
//                     width: 7,
//                   ),
//                   Container(
//                     height: 200,
//                     width: 100,
//                     color: Colors.blue,
//                   ),
//                   // Add more widgets as needed
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 100,
//                 color: Colors.red,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: const DottedLine(
//                 direction: Axis.horizontal,
//                 lineLength: double.infinity,
//                 lineThickness: 1.0,
//                 dashColor: Colors.black,
//                 // Assuming AppColors is not defined
//                 dashGapLength: 6,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
