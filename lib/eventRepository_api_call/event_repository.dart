// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// import '../../modules/sign_in/controllers/sign_in_controller.dart';
// import '../../networking/api.dart';
//
// class EventRepository {
//   Response? response;
//   Completer completer = Completer();
//
// // Get Api Calls
//
//   Future getManagedEvents() async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().get('/auth/event/event/search/getManagedEvents',
//           options: Options(headers: headers));
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   Future getEventDetails({required String uid}) async {
//     try {
//       response = await Api().get('/event/$uid');
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future mapData({required String uid}) async {
//     try {
//       response =
//       await Api().get('/auth/event/eventManagement/view/dailyViews/$uid');
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future<void> scheduleCall() async {
//     String token =
//         userModel.token; // Assuming userModel is defined and accessible
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().get(
//         "/event",
//         options: Options(headers: headers),
//       );
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//   }
//
//   Future myTicket() async {
//     String token = userModel.token;
//     // event details evet id
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().get("/auth/event/event/search/my-tickets",
//           options: Options(headers: headers));
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   // Post Api Calls
//
//   Future getAllEvents(Map data) async {
//     try {
//       response = await Api().post('/event/search', data: data);
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future generateDescription({required String description}) async {
//     String token = userModel.token;
//
//     try {
//       response = await Api().post(
//         '/auth/event/event/create/description?AuthToken=$token',
//         data: {'prompt': '$description'},
//       );
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future getCategories() async {
//     try {
//       response = await Api().post('/getAutoCompleteOptions',
//           data: {"product": "event", "type": "category", "value": ""});
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future getCities() async {
//     try {
//       response = await Api().post('/getAutoCompleteOptions',
//           data: {"product": "event", "type": "cityMetro", "value": ""});
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future createAnEvent({required Map data}) async {
//     String token = userModel.token;
//
//     log(data.toString());
//
//     // final headers = {
//     //   'Cookie': 'AuthToken=$token;',
//     // };
//
//     try {
//       response = await Api().post(
//           '/auth/event/event/create/addEvent?AuthToken=$token',
//           data: data);
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future afterEventCreationCallThisAPI({required Map data}) async {
//     String token = userModel.token;
//
//     try {
//       response = await Api().post(
//           'https://funzippy.com/auth/event/event/create/addEventManagement?AuthToken=$token',
//           data: data);
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future uploadImage(File file) async {
//     try {
//       String fileName = file.path.split('/').last;
//       FormData formData = FormData.fromMap({
//         "file": await MultipartFile.fromFile(file.path, filename: fileName),
//       });
//
//       response = await Api().post(
//           '/user/user/create/uploadPicture/${userModel.sId}',
//           data: formData);
//
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//
//     return completer.future;
//   }
//
//   Future getProfile() async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post("/auth/user/user/search/loginUser",
//           options: Options(headers: headers));
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   Future ticketDetails(String uid) async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post("/event/payment/getSaleTransaction/$uid",
//           options: Options(headers: headers));
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   Future buyTickets(data) async {
//     String token = userModel.token;
//     var body = json.encode(data);
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post("/event/buyTickets",
//           options: Options(headers: headers), data: body);
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//     }
//     return completer.future;
//   }
//
//   Future postComments({required Map data}) async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post("/auth/event/post/create/create",
//           options: Options(headers: headers), data: data);
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   Future signUpItem({required Map data, required String eventUID}) async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post("/event/timeslot/claim/$eventUID",
//           options: Options(headers: headers), data: data);
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   Future getComments({required Map data}) async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post("/event/post/view/search",
//           options: Options(headers: headers), data: data);
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   Future rsvpCall({required Map data}) async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post(
//           "/event/eventUser/update/rsvp/${data['eventId']}",
//           options: Options(headers: headers),
//           data: data);
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   Future editEvent({required Map data}) async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post("/event/eventUser/update/rsvp",
//           options: Options(headers: headers), data: data);
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
//
//   Future potluckItems({required Map data, required String eventUID}) async {
//     String token = userModel.token;
//
//     final headers = {
//       'Cookie': 'AuthToken=$token;',
//     };
//
//     try {
//       response = await Api().post("/event/potluck/claim/$eventUID",
//           options: Options(headers: headers), data: data);
//       if (response?.statusCode == 200) {
//         completer.complete(response?.data);
//       }
//     } catch (e) {
//       completer.complete(response?.data);
//       // Handle the error as needed
//     }
//     return completer.future;
//   }
// }
