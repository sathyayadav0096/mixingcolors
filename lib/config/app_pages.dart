import 'package:get/get.dart';

import '../stack/stack.dart';
import '../welcome_intro_screens/auth_screen.dart';
import '../welcome_intro_screens/intro_screen.dart';
import '../welcome_intro_screens/otp_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.OTP;

  static final routes = [
    GetPage(
      name: _Paths.Intro,
      page: () => IntroductionScreen(
          // navChild: true,
          ),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.Stc,
      page: () => StacClass(
          // navChild: true,
          ),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OTPScreen(
          // navChild: true,
          ),
      // binding: HomeBinding(),
    ),GetPage(
      name: _Paths.Auth,
      page: () => AuthScreen(
          // navChild: true,
          ),
      // binding: HomeBinding(),
    ),

  ];
}
