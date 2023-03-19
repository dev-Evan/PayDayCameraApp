import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/init_%20app.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/theme.dart';

import 'modules/home/presentation/home.dart';
import 'modules/more/presentation/view/calender.dart';
import 'modules/more/presentation/view/edit_profile.dart';
import 'modules/more/presentation/view/jod_history.dart';
import 'modules/more/presentation/view/more.dart';
import 'modules/more/presentation/view/salary_overview.dart';
import 'modules/more/presentation/view/view_profile.dart';
import 'modules/more/presentation/widget/document_view.dart';

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
      // initialRoute: AppString.moreScreen,
      // getPages: getPage,
      home:  Home(),
    );
  }
}
