import 'package:get/get_navigation/src/routes/get_route.dart';

import '../api_calls/api_call_read_more_less/api_three.dart';
import '../linear_grident/linear_grident.dart';
import '../reverse/reverse_string.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.third;
  static final routes = [
    GetPage(
      name: Routes.Line,
      page: () => LinearGrd(),
      // binding: MainBinding(),
    ),
    GetPage(
      name: Routes.third,
      page: () => ThirdApiCls(),
      // binding: MainBinding(),
    ),
    GetPage(
      name: Routes.reverse,
      page: () => ReverseString(),
      // binding: MainBinding(),
    ),
  ];
}