import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/app_pages.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  // await GetStorage.init();
  runApp(MixingColors());
}

class MixingColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample Design Yuj App',
      // logWriterCallback: Logger.write,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      // locale: const Locale('en', 'US'),
      // fallbackLocale: TranslationService.fallbackLocale,
      // translations: TranslationService(),
    );
  }
}
