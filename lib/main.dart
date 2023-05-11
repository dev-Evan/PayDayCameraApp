import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/init_%20app.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/theme.dart';

import 'modules/payslip/presentation/view/pdf_test.dart';


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
      //initialRoute: AppString.splashScreen,
       //getPages: getPage,
      home: PdfDownloader(url: "https://payday.php8.gainhq.com/api/payroll/payslip/pdf/1"),

    );
  }
}





