import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/forgot_password.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/received_screen.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/sign_in.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_logs.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leave.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/calender.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payslip.dart';
import 'package:pay_day_mobile/modules/starting/view/onboarding_screen.dart';
import 'package:pay_day_mobile/modules/starting/view/splash_screen.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../modules/home/presentation/home.dart';
import '../modules/more/presentation/view/more.dart';

List<GetPage> getPage = [
  GetPage(
    name: AppString.splashScreen,
    page: () => const splashScreen(),
  ),
  GetPage(name: AppString.signInScreen, page: () => const signInScreen()),
  GetPage(
    name: AppString.forgotScreen,
    page: () => const forgotScreen(),
  ),
  GetPage(
    name: AppString.receiveScreen,
    page: () => const receiveScreen(),
  ),
  GetPage(
    transition: Transition.cupertino,
    name: AppString.onboardScreen,
    page: () => onboardingScreen(),
  ),
  GetPage(
    name: AppString.attendLogScreen,
    page: () => const AttendanceLogsScreen(),
  ),
  GetPage(
    transition: Transition.cupertino,
    name: AppString.moreScreen,
    page: () => MoreScreen(),
  ),
  GetPage(
    transition: Transition.cupertino,
    name: AppString.home,
    page: () => const Home(),
  ),
  GetPage(
    name: AppString.calender,
    page: () => const CalendarScreen(),
  ),
  GetPage(
    name: AppString.payslip,
    page: () => const PaySlip(),
  ),
  GetPage(
    name: AppString.leave,
    page: () => const Leave(),
  ),
];
