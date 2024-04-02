//
// Future getManagedEvents() async {
//   String token = userModel.token;
//
//   final headers = {
//     'Cookie': 'AuthToken=$token;',
//   };
//
//   try {
//     response = await Api().get('/auth/event/event/search/getManagedEvents',
//         options: Options(headers: headers));
//     if (response?.statusCode == 200) {
//       completer.complete(response?.data);
//     }
//   } catch (e) {
//     completer.complete(response?.data);
//     // Handle the error as needed
//   }
//   return completer.future;
// }