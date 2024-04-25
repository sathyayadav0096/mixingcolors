import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../common_data/linear_background.dart';
import '../common_data/rounded_button.dart';
import '../config/app_pages.dart';
import 'helper_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpOne = TextEditingController();
  final TextEditingController otpTwo = TextEditingController();
  final TextEditingController otpThree = TextEditingController();
  final TextEditingController otpFour = TextEditingController();
  final LocalDb = GetStorage();
  int _remainingTime = 30;
  bool _isTimerActive = false;
  bool isLoading = false;
  String phone = '1234567890';

  @override
  void initState() {
    super.initState();
    phone = Get.arguments ?? phone;
  }

  void _startTimer() {
    if (!_isTimerActive) {
      setState(() {
        _isTimerActive = true;
        _remainingTime = 30;
      });
      _startCountdown();
    }
  }

  void _startCountdown() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_remainingTime < 1) {
          _isTimerActive = false;
          timer.cancel();
        } else {
          _remainingTime--;
        }
      });
    });
  }

  Future<void> sendingOtp() async {
    if (otpOne.text.isEmpty &&
        otpTwo.text.isEmpty &&
        otpThree.text.isEmpty &&
        otpFour.text.isEmpty) {
      Get.defaultDialog(
        confirmTextColor: Colors.white,
        title: '',
        middleText: 'Please Enter Valid OTP',
        onConfirm: () {
          Get.back();
        },
      );
    } else {
      setState(() {
        isLoading = true; // Show loader when API call starts
      });

      print("Fetching user data...");

      try {
        final response = await http.post(
          Uri.parse('${Helpers.baseUrl}${Helpers.verifyOtp}'),
          body: {
            "mobile": "$phone",
            "otp": "${otpOne.text}${otpTwo.text}${otpThree.text}${otpFour.text}"
          },
        );

        if (response.statusCode == 200) {
          print("API response received with status code 200");

          Map<String, dynamic> responseData = json.decode(response.body);
          String msg = responseData['message'];

          setState(() {
            isLoading = false;
          });
          if (responseData['status'].toString() == '1') {
            LocalDb.write('userid', '${responseData['user_data']['id']}');
            Get.toNamed(Routes.Stc);
          } else {
            Get.defaultDialog(
              confirmTextColor: Colors.white,
              title: msg,
              middleText: '',
              onConfirm: () {
                Get.back();
              },
            );
          }
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
  }

  @override
  Widget build(BuildContext context) {
    return LinearBackground(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OTP Verification',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'We will send you a one-time password on this Mobile Number',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '+91-$phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 44),
                    Center(
                      child: SizedBox(
                        height: 320,
                        width: 320,
                        child: Image.asset('assets/images/otp.png'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final controller in [
                          otpOne,
                          otpTwo,
                          otpThree,
                          otpFour
                        ])
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: SizedBox(
                              height: 50,
                              width: 30,
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                controller: controller,
                                decoration: InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 40),
                    _isTimerActive
                        ? Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Resend OTP in $_remainingTime seconds',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Didn\’t Receive? ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _startTimer();
                          },
                          child: const Text(
                            'Resend OTP',
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      onPressed: () {
                        sendingOtp();
                      },
                      name: 'Submit',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
