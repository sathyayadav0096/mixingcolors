import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../common_data/linear_background.dart';
import '../common_data/rounded_button.dart';
import '../config/app_pages.dart';
import 'helper_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
 // final AuthController authController = Get.find();

  bool signup = false;
  List<String> countryCodes = ['+1', '+44', '+91', '+86'];
  String selectedCountryCode = '+91';
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String decodedOTP = "";
  bool isLoading = false; // Added for loader control

  Future fetchUserData() async {
    setState(() {
      //optional to show
      isLoading = true; // Show loader when API call starts
    });

    print("Fetching user data...");

    try {
      // optional
      final response = await http.post(
        //
        Uri.parse(
            '${Helpers.baseUrl}${signup ? Helpers.signup : Helpers.login}'),
        body: {
          "mobile": phoneNumberController.text,
          "email": emailController.text
          // "mobile": "9666033750",
          // "emain": "sathyayadav27@gmail.com"
        },
      );

      if (response.statusCode == 200) {
        print("API response received with status code 200");

        Map<String, dynamic> responseData = json.decode(response.body);
        if (signup == false) {
          String otp = responseData['otp'];
          decodedOTP = decodeBase64OTP(otp);
        }
        String msg = responseData['message'];

        setState(() {
          if(signup == false)
            decodedOTP = decodeBase64OTP(Routes.OTP);
          isLoading = false;
        });
        if (signup) {
          Get.defaultDialog(
            confirmTextColor: Colors.white,
            title: msg,
            middleText: '',
            onConfirm: () {
              Get.back();
            },
          );
        } else {
          Get.toNamed(Routes.OTP,
              arguments: '${phoneNumberController.text}');
        }

        print("Decoded OTP: $decodedOTP");
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
        setState(() {
          isLoading = false; // Hide loader if API call fails
        });

        Get.defaultDialog(
          confirmTextColor: Colors.white,
          title: 'Error',
          middleText: '',
          onConfirm: () {
            Get.back();
          },
        );

        throw Exception('Failed to load data');
      }
    } catch (e) {
      // optional
      setState(() {
        isLoading = false;
      });
      print("An error occurred: $e");
      Get.defaultDialog(
        confirmTextColor: Colors.white,
        title: 'Big Error',
        middleText: '',
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  String decodeBase64OTP(String base64OTP) {
    List<int> decodedBytes = base64.decode(base64OTP);
    print("Decoding base64 OTP: $base64OTP");
    return utf8.decode(decodedBytes);
  }

  @override
  Widget build(BuildContext context) {
    return LinearBackground(
      child: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apna Chotu Customer Login',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Text(
                  'Login access is available to customer who have registered.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 70),
                Center(
                    child: SizedBox(
                        height: 265,
                        width: 265,
                        child: Image.asset('assets/image.png'))),
                const SizedBox(height: 35),
                Text(
                  'Enter registered mobile number',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButton<String>(
                        value: selectedCountryCode,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCountryCode = newValue!;
                          });
                        },
                        items: countryCodes.map((code) {
                          return DropdownMenuItem<String>(
                            value: code,
                            child: Text(code),
                          );
                        }).toList(),
                        underline: Container(
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: 'Enter your phone number',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (signup) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Email ID',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Email address',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: isLoading ? 32 : 16),
                isLoading
                    ? const Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        )))
                    : RoundedButton(
                  onPressed: () {
                    if (phoneNumberController.text.trim().isNotEmpty &&
                        phoneNumberController.text.trim().length == 10) {
                      fetchUserData();
                      // authController.callAPI(
                      //     phone: phoneNumberController.text,
                      //     email: emailController.text);
                    } else {
                      Get.defaultDialog(
                          confirmTextColor: Colors.white,
                          // modify error msg
                          title: 'Please enter valid mobile number',
                          middleText: '',
                          onConfirm: () {
                            Get.back();
                          });
                    }
                  },
                  name: signup ? 'Register' : 'Login via OTP',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      signup
                          ? 'Already have an account? '
                          : 'Not have an account? ',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          signup = !signup;
                        });
                      },
                      child: Text(
                        signup ? 'Login' : 'Create Now',
                        style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // _registrationCubit.close();
    super.dispose();
  }
}


