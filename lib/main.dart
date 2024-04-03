import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
