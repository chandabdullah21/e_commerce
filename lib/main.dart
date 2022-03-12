import 'dart:ui';

import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/i18n/translation.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translations,
      locale: const Locale('en', "US"),
      fallbackLocale: const Locale('ur', "PK"),
      title: appName,
      initialRoute: Routes.initial,
      getPages: Routes.routes,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
