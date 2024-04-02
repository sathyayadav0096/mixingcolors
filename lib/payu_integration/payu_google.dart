// import 'package:flutter/material.dart';
//
// import 'package:payumoney_sdk/payumoney_sdk.dart';
//
// class PayuPayment extends StatefulWidget {
//   @override
//   _PayuPaymentState createState() => _PayuPaymentState();
// }
//
// class _PayuPaymentState extends State<PayuPayment> {
//   final payu = PayumoneySdk();
//
//   @override
//   void initState() {
//     super.initState();
//     startPayment();
//   }
//
//   void startPayment() async {
//     final data = await payu.buildPaymentParams(
//         amount: "400.0",
//         transactionId: "C2161646224785587",
//         phone: "7899395319",
//         productInfo: "Nike shoes",
//         firstName: "Badal Sharma",
//         email: "badal@gmail.com",
//         hash:
//             "2973e780893f5b3ff593cf92891a3763f20a9fb55c84c734d4e317727b75ccbae45d9f0da97e28c4521c03c144335c082c8b6045a296dccb24d1f5bc5063afd9",
//         isProduction: false,
//         userCredentials: "7899395319",
//         merchantKey: "mWI8Vl",
//         salt: "cMDID7EG",
//         merchantName: "Siply Services Pvt Ltd.");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Payumoney SDK'),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 100,
//               ),
//               TextButton(
//                   onPressed: () {
//                     startPayment();
//                   },
//                   child: Text("Tap me"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
