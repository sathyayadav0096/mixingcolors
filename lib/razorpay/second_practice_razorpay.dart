// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class RazorPayPractice extends StatefulWidget {
//   const RazorPayPractice({super.key});
//
//   @override
//   State<RazorPayPractice> createState() => _RazorPayPracticeState();
// }
//
// class _RazorPayPracticeState extends State<RazorPayPractice> {
//   void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
//     print(response.data.toString()); // Todo Replace it
//     showAlertDialog(
//         context, "Payment Successful", "Payment ID: ${response.paymentId}");
//   }
//
//   void handlePaymentErrorResponse(PaymentFailureResponse response) {
//     print(response.message); // Todo Replace it
//
//     showAlertDialog(context, "Payment Failed",
//         "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
//   }
//
//   void handleExternalWalletSelected(ExternalWalletResponse response) {
//     print(response.walletName); // Todo Replace it
//     showAlertDialog(
//         context, "External Wallet Selected", "${response.walletName}");
//   }
//
//   void showAlertDialog(BuildContext context, String title, String message) {
//     // set up the buttons
//     Widget continueButton = ElevatedButton(
//       child: const Text("Continue"),
//       onPressed: () {},
//     );
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text(title),
//       content: Text(message),
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'This is Payment Way',
//               style: TextStyle(
//                   fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 100),
//             Container(
//               height: 40,
//               width: 140,
//               decoration: BoxDecoration(
//                   color: Colors.yellow,
//                   borderRadius: BorderRadius.circular(12)),
//               child: TextButton(
//                   onPressed: () {
//                     Razorpay razorpay = Razorpay();
//                     var options = {
//                       'key': 'rzp_test_6CHvaup1NIo2t2', // Todo Replace it
//                       'amount': 100 * 100, // Todo Replace it
//                       'name': 'Sathya.', // Todo Replace it
//                       'description': 'Testing', // Todo Replace it
//                       'retry': {'enabled': true, 'max_count': 1},
//                       'send_sms_hash': true,
//                       'prefill': {
//                         'contact': '9666033750', // Todo Replace it
//                         'email': 'sathyayadav27@gmail.com' // Todo Replace it
//                       },
//                       'external': {
//                         'wallets': ['paytm']
//                       }
//                     };
//
//                     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
//                         handlePaymentSuccessResponse);
//                     print('Success Payment to Sathya Account'); // Todo Replace it
//                     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
//                         handlePaymentErrorResponse);
//                     print('Error Payment'); // Todo Replace it
//                     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
//                         handleExternalWalletSelected);
//                     print('External Wallet'); // Todo Replace it
//                     razorpay.open(options);
//                   },
//                   child: const Text(
//                     'Payment',  // Todo Replace it
//                     style: TextStyle(
//                         color: Colors.green,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
