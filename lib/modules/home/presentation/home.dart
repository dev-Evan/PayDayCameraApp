import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import '../../attendance/presentation/view/attendance.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: _icon(icon: Icons.watch_later_outlined),
          activeIcon: _icon(icon: Icons.watch_later),
          label: "text_attendance".tr),
      BottomNavigationBarItem(
          icon: _icon(icon: Icons.dashboard_customize_outlined),
          activeIcon: _icon(icon: Icons.dashboard),
          label: "text_more".tr),
    ];

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          scrolledUnderElevation: .5,
          leadingWidth: 130,
          toolbarHeight: 46,
          backgroundColor: AppColor.cardColor,
          leading: Padding(
            padding: leadingEdgeInsets,
            child: svgIcon(height: 20, width: 20),
          ),
          actions: [
            IconButton(onPressed: (){
              scaffoldKey.currentState?.openEndDrawer();
            }, icon: const Icon(Icons.menu))
          ],
          elevation: .5,
        ),
        endDrawer: Drawer(
          backgroundColor: AppColor.primaryBlue,
        ),
        body: Attendance(),
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
      yesAction: () {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
      });
}