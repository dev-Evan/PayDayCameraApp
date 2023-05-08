import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/more.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

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
    const PaySlip(),
    MoreScreen()
  ];

  final _items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(Icons.watch_later_outlined), label: "Attendance"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today_outlined), label: "Leave"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sticky_note_2_outlined), label: "Payslip"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_customize_outlined), label: "More"),
  ];

  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.disableColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: _items,
        elevation: 4,
        backgroundColor: AppColor.bgColor,
        currentIndex: currentIndex,
        onTap: (index) => onTap(index),
      ),
    );
  }
}
