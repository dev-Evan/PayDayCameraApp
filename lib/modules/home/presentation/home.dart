import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/more.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
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

  final _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: _icon(icon: Icons.watch_later_outlined),
        activeIcon: _icon(icon: Icons.watch_later),
        label: AppString.text_attendance),
    BottomNavigationBarItem(
        icon: _icon(icon: Icons.calendar_today_outlined),
        activeIcon: _icon(icon: Icons.calendar_today),
        label: AppString.text_leave),
    BottomNavigationBarItem(
        icon: const Icon(Icons.description_outlined),
        activeIcon: const Icon(Icons.description),
        label: AppString.text_payslip),
    BottomNavigationBarItem(
        icon: _icon(icon: Icons.dashboard_customize_outlined),
        activeIcon: _icon(icon: Icons.dashboard),
        label: AppString.text_more),
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
        unselectedItemColor: AppColor.hintColor.withOpacity(0.8),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: Dimensions.fontSizeDefault - 1,
        unselectedFontSize: Dimensions.fontSizeDefault - 1,
        showUnselectedLabels: true,
        items: _items,
        elevation: 6,
        backgroundColor: AppColor.bgColor,
        currentIndex: currentIndex,
        onTap: (index) => onTap(index),
      ),
    );
  }
}

Widget _icon({required icon}) {
  return Icon(icon);
}
