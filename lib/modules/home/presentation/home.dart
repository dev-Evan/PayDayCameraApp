import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/more.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../attendance/presentation/view/attendance.dart';
import '../../leave/presentation/view/leave.dart';
import '../../payslip/presentation/view/payslip.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final _screens = <Widget>[
    const Attendance(),
    const Leave(),
    PaySlip(),
     MoreScreen()
  ];
  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  
Future dialog(){
    return customAlertDialog(

    );
}
  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: _icon(icon: Icons.watch_later_outlined),
          activeIcon: _icon(icon: Icons.watch_later),
          label: "text_attendance".tr),
      BottomNavigationBarItem(
          icon: _icon(icon: Icons.calendar_today_outlined),
          activeIcon: _icon(icon: Icons.calendar_today),
          label: "text_leave".tr),
      BottomNavigationBarItem(
          icon: const Icon(Icons.description_outlined),
          activeIcon: const Icon(Icons.description),
          label: "text_payslip".tr),
      BottomNavigationBarItem(
          icon: _icon(icon: Icons.dashboard_customize_outlined),
          activeIcon: _icon(icon: Icons.dashboard),
          label: "text_more".tr),
    ];

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: _screens[currentIndex],
        bottomNavigationBar: Localizations.override(
          context: context,
          child: SizedBox(
            height: AppLayout.getHeight(71),
            child: Wrap(children: [BottomNavigationBar(
              selectedItemColor: AppColor.primaryColor,
              unselectedItemColor: AppColor.hintColor.withOpacity(0.8),
              type: BottomNavigationBarType.fixed,
              selectedFontSize: Dimensions.fontSizeDefault - 1,
              unselectedFontSize: Dimensions.fontSizeDefault - 1,
              showUnselectedLabels: true,
              items: items,
              elevation: 3,
              backgroundColor: AppColor.backgroundColor,
              currentIndex: currentIndex,
              onTap: (index) => onTap(index),
            )]),

          ),
        ),
      ),
    );
  }
}

Widget _icon({required icon}) {
  return Icon(icon);
}
Future<bool> _onWillPop(BuildContext context) async {
  return await exitDialog(
      context: context,
      yesAction: (){
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);}}
  ) ;
}
