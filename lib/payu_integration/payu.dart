// import 'package:payumoney_sdk/payumoney_sdk.dart';
// import 'dart:convert';
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
//
// class CartScreen extends StatefulWidget {
//   final Product? item;
//
//   const CartScreen({super.key, this.item});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   // Pre-defined data
//   final String phone = '9849953848';
//   final String txnid = DateTime.now().millisecondsSinceEpoch.toString();
//   final String productinfo = 'iPhone';
//   final String firstname = 'AC';
//   final String email = 'ceo@apnachotu.com';
//
//   get sha512 => null;
//
//   String generateHash(String key, String txnid, String amount,
//       String productinfo, String firstname, String email, String salt) {
//     final rawData =
//         '$key|$txnid|$amount|$productinfo|$firstname|$email|||||||||||$salt';
//     final bytes = utf8.encode(rawData);
//     final digest = sha512.convert(bytes);
//     return digest.toString();
//   }
//
//   void initiatePayment(String amount) async {
//     print('Starting the payment process...');
//     EasyLoading.show(status: 'Initiating Payment...');
//
//     final key = 'Wn0jYR';
//     final salt = 'T73QXre5AkYRnB1EgPVukwUCZiffmwjv';
//     final hash =
//     generateHash(key, txnid, amount, productinfo, firstname, email, salt);
//
//     print('Generated hash: $hash');
//     Map body = {
//       'key': key,
//       'txnid': txnid,
//       'amount': amount,
//       'productinfo': productinfo,
//       'firstname': firstname,
//       'email': email,
//       'phone': phone,
//       'hash': hash, //success text
//       'surl': 'https://apiplayground-response.herokuapp.com/',
//       'furl': 'https://apiplayground-response.herokuapp.com/'
//
//     };
//     print('Sending POST request with body: ' + body.toString());
//
//     final response = await http.post(
//       Uri.parse('https://secure.payu.in/_payment'),
//       headers: {
//         'Content-Type': 'application/x-www-form-urlencoded',
//       },
//       body: body,
//     );
//
//     print(
//         'HTTP POST to PayU completed with status code: ${response.statusCode}');
//     print('Response body: ${response.body}');
//
//     EasyLoading.dismiss();
//
//     if (response.statusCode == 302) {
//       final redirectionUrl = response.headers['location'];
//       if (redirectionUrl != null) {
//         print('Received 302 status. Redirecting to: $redirectionUrl');
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => PaymentWebView(initialUrl: redirectionUrl)));
//       } else {
//         showErrorDialog('Redirection URL not found in the response headers.');
//       }
//     } else if (response.statusCode == 200) {
//       //Get.toNamed(Routes.orderSuccess);
//     } else {
//       print('Error encountered. Showing error dialog.');
//       showErrorDialog('Error initiating payment: ${response.body}');
//     }
//   }
//
//   Future<void> pay(String amount) async {
//     final key = 'Wn0jYR';
//     final salt = 'T73QXre5AkYRnB1EgPVukwUCZiffmwjv';
//     final hash =
//     generateHash(key, txnid, amount, productinfo, firstname, email, salt);
//     PaymentParams _paymentParam = PaymentParams(
//       merchantID: '8522235',
//       merchantKey: key,
//       salt: salt,
//       amount: amount,
//       transactionID: DateTime.now().millisecondsSinceEpoch.toString(),
//       firstName: 'AC',
//       email: 'ceo@apnachotu.com',
//       productName: 'IPhone',
//       phone: "9876543210",
//       fURL: "https://www.payumoney.com/mobileapp/payumoney/failure.php",
//       sURL: "https://www.payumoney.com/mobileapp/payumoney/success.php",
//       udf1: "udf1",
//       udf2: "udf2",
//       udf3: "udf3",
//       udf4: "udf4",
//       udf5: "udf5",
//       udf6: "",
//       udf7: "",
//       udf8: "",
//       udf9: "",
//       udf10: "",
//       hash: hash,
//       //Hash is required will initialise with empty string now to set actuall hash later
//       isDebug: false, // true for Test Mode, false for Production
//     );
//
//     try {
//       PayuPaymentResult _paymentResult =
//       await FlutterPayuUnofficial.initiatePayment(
//           paymentParams: _paymentParam, showCompletionScreen: true);
//
//       //Checks for success and prints result
//
//       if (_paymentResult != null) {
//         //_paymentResult.status is String of course. Directly fetched from payU's Payment response. More statuses can be compared manually
//
//         if (_paymentResult.status == PayuPaymentStatus.success) {
//           print("Success: ${_paymentResult.response}");
//         } else if (_paymentResult.status == PayuPaymentStatus.failed) {
//           print("Failed: ${_paymentResult.response}");
//         } else if (_paymentResult.status == PayuPaymentStatus.cancelled) {
//           print("Cancelled by User: ${_paymentResult.response}");
//         } else {
//           print("Response: ${_paymentResult.response}");
//           print("Status: ${_paymentResult.status}");
//         }
//       } else {
//         print("Something's rotten here");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//
//   void showErrorDialog(String errorMessage) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Payment Error'),
//         content: Text(errorMessage),
//         actions: <Widget>[
//           TextButton(
//             child: Text('OK'),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<int> tip = [10, 20, 30, 40];
//   int quantity = 1;
//   int deliveryTip = 0;
//   void increaseQuantity() {
//     setState(() {
//       widget.item?.quantity++;
//     });
//   }
//
//   void decreaseQuantity() {
//     setState(() {
//       if (widget.item!.quantity > 1) {
//         widget.item?.quantity--;
//       }
//     });
//   }
//
//   double calculateTotalPrice() {
//     double totalPrice = 0;
//     totalPrice += (widget.item!.price * widget.item!.quantity);
//     return totalPrice;
//   }
//
//   double calculateGST() {
//     double totalPrice = calculateTotalPrice();
//     return totalPrice * 0.18; // Assuming GST is 18%
//   }
//   addToTip(int amount){
//     deliveryTip = amount;
//     setState(() {
//
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8, right: 8, bottom: 80),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListTile(
//                   minLeadingWidth: 0,
//                   minVerticalPadding: 0,
//                   horizontalTitleGap: -12,
//                   contentPadding: EdgeInsets.all(0),
//                   leading: IconButton(
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       size: 25,
//                       color: Colors.black,
//                     ),
//                     onPressed: () {
//                       Get.back();
//                     },
//                   ),
//                   title: Text(
//                     'Checkout'
//                   ),
//                   subtitle: Text('1 item, Total: ₹ ${widget.item?.price}'),
//                 ),
//                 Container(
//                   height: 60,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [Color(0XFFFA6423), Color(0xFF9A2D08)],
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.brightness_1_outlined,
//                               size: 14,
//                               color: Colors.white,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               'Palamuru Grill | ',
//                               style: TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                             Text(
//                               'Delivery in: 33 mins',
//                               style:
//                               TextStyle(fontSize: 11, color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8, top: 5),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.brightness_1_outlined,
//                               size: 14,
//                               color: Colors.white,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               'Office | Q2, 6th Floor, Cyber Tower, Hitech City',
//                               style: TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Container(
//                             height: 48,
//                             width: 48,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image:
//                                   AssetImage('assets/images/biryani_3.png'),
//                                   fit: BoxFit.fill),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Column(
//                           children: [
//                             Text(
//                               '${widget.item?.title}',
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.deepOrange),
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.currency_rupee,
//                                   size: 14,
//                                 ),
//                                 Text(
//                                   '${widget.item?.price}',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(width: 70),
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       height: 40,
//                       width: 120,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(15),
//                           ),
//                           border: Border.all(color: Colors.deepOrange),
//                           color: Color(0xFFFFDFC6)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.remove),
//                             onPressed: () {
//                               decreaseQuantity();
//                             },
//                           ),
//                           Text('${widget.item?.quantity}'),
//                           IconButton(
//                             icon: Icon(Icons.add),
//                             onPressed: () {
//                               increaseQuantity();
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 5),
//                 Container(
//                   height: 43,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Color(0xFFF3F3F3)),
//                   child: Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(Icons.control_point),
//                       ),
//                       Text(
//                         'Add more items',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 12),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Container(
//                   height: 95,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Color(0xFFF3F3F3),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 4,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SizedBox(
//                                     height: 25,
//                                     child: Image.asset(
//                                       'assets/images/coupon.png',
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         'Coupon Corner',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Column(
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Save 100 more on this order',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 12,
//                                                 color: Colors.deepOrange),
//                                           ),
//                                           Text(
//                                             'Code: JUSTFORYOU',
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 'Apply',
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.deepOrange),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Center(
//                           child: Text(
//                             'View All Coupons',
//                             style: TextStyle(
//                                 fontSize: 11, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 12),
//                 Text(
//                   'Detailed Bill',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                 ),
//                 SizedBox(height: 7),
//                 Text(
//                   'Chicken Jumbo Pack Biryani (2)',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                       color: Colors.deepOrange),
//                 ),
//                 SizedBox(height: 15),
//                 Row(
//                   children: [
//                     Text('Item Total'),
//                     SizedBox(width: 210),
//                     Icon(Icons.currency_rupee, size: 15),
//                     Text('${calculateTotalPrice().toStringAsFixed(2)}')
//                   ],
//                 ),
//                 SizedBox(height: 7),
//                 Row(
//                   children: [
//                     Text('Delivery Partner Fee'),
//                     SizedBox(width: 184),
//                     Icon(Icons.currency_rupee, size: 15),
//                     Text('51.00')
//                   ],
//                 ),
//                 SizedBox(height: 7),
//                 deliveryTip > 0 ? Row(
//                   children: [
//                     Text('Delivery Tip'),
//                     SizedBox(width: 238),
//                     Icon(Icons.currency_rupee, size: 15),
//                     Text('$deliveryTip')
//                   ],
//                 ): Container(),
//                 SizedBox(height: 7),
//                 Row(
//                   children: [
//                     Text('Taxes'),
//                     SizedBox(width: 265),
//                     Icon(Icons.currency_rupee, size: 15),
//                     Text('${calculateGST().toStringAsFixed(2)}')
//                   ],
//                 ),
//                 SizedBox(height: 7),
//                 Divider(thickness: 2),
//                 SizedBox(height: 5),
//                 Row(
//                   children: [
//                     Text(
//                       'Paid Via Credit Card',
//                       style:
//                       TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(width: 188),
//                     Icon(
//                       Icons.currency_rupee,
//                       size: 15,
//                     ),
//                     Text(
//                       '${(calculateTotalPrice() + calculateGST() + deliveryTip).toStringAsFixed(2)}',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Divider(thickness: 2),
//                 SizedBox(height: 7),
//                 Container(
//                   height: 121,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFF3F3F3),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             height: 20,
//                             width: 20,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage('assets/images/tip.png'),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             'Tip your delivery partner',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Text(
//                           'It means a lot that you are kind. Your delivery partner will receive your entire gratuity.'),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           for (int a = 0; a < tip.length; a++)
//                             SizedBox(
//                               width: 70,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   addToTip(tip[a]);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   foregroundColor: Colors.deepOrange,
//                                   backgroundColor: Colors.white,
//                                   // Change this color as needed
//                                   elevation: 0,
//                                   // You can adjust the elevation as needed
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                         8.0), // You can adjust the border radius as needed
//                                   ),
//                                 ),
//                                 child: Container(
//                                   height: 43,
//                                   //width: ,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.currency_rupee,
//                                         // color: Colors.deepOrange,
//                                         size: 17,
//                                       ),
//                                       Text(
//                                         '${tip[a]}',
//                                         style: TextStyle(
//                                           color: Colors.deepOrange,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           SizedBox(
//                             width: 70,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // Add your button click logic here
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.deepOrange,
//                                 backgroundColor: Colors.white,
//                                 // Change this color as needed
//                                 elevation: 0,
//                                 // You can adjust the elevation as needed
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(
//                                       8.0), // You can adjust the border radius as needed
//                                 ),
//                               ),
//                               child: Container(
//                                 height: 43,
//                                 width: 60,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       '+',
//                                       style: TextStyle(
//                                         color: Colors.deepOrange,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 24,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 5),
//                 Container(
//                   height: 91,
//                   color: Color(0xFFF3F3F3),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.cancel_outlined),
//                       SizedBox(width: 2),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Cancellation Policy',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 7),
//                           Column(
//                             children: [
//                               Text(
//                                   '100% cancellation fee will be applicable if you\ndecide to cancel the order anytime after order\nplacement. Avoid cancellation as it leads to food \nwastage'),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomSheet: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Container(
//           height: 40,
//           //width: 167,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(Icons.currency_rupee),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${(calculateTotalPrice() + calculateGST() + deliveryTip).toStringAsFixed(2)}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           'View Detailed Bill',
//                           style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.deepOrange,
//                               fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 40,
//                 width: 167,
//                 child: TextButton(
//                   onPressed: () {
//                     // modile SDK
//                     // pay('${(calculateTotalPrice() + calculateGST()).toStringAsFixed(2)}');
//
//                     // web check out
//                     initiatePayment('${(calculateTotalPrice() + calculateGST()).toStringAsFixed(2)}');
//                   },
//                   name: '',
//                   child: Text(
//                     'Proceed to Pay',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
