import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/init_%20app.dart';
import 'package:pay_day_mobile/modules/home/presentation/home.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/edit_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/salary_overview.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/theme.dart';
import 'modules/leave/presentation/view/leave.dart';
import 'modules/more/presentation/view/address_details.dart';
import 'modules/more/presentation/view/jod_history.dart';
import 'modules/more/presentation/widget/add_address.dart';

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
       initialRoute: AppString.home,
       getPages: getPage,
    );
  }
}
