import 'dart:convert';

class Helpers {
  static const String baseUrl = "https://openteqdev.com/Apnachotu_dev/api/user";
  static const String login = "/login";
  static const String signup = "/register";
  static const String verifyOtp = "/verify_otp";

  String convertToBase64(String credentials) {
    final Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(credentials);
  }

  String base64ToString(String credentials) {
    final Codec<String, String> base64ToString = utf8.fuse(base64);
    return base64ToString.decode(credentials);
  }
}
