import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/init_%20app.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/internationalization.dart';
import 'package:pay_day_mobile/utils/theme.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      translations: Internationalization(),
      locale: GetStorage().read("languageCode") != null
          ? Locale(GetStorage().read("languageCode"),
              GetStorage().read("countryCode"))
          : const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}


