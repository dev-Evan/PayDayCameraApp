import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/forgot_password.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/received_screen.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/sign_in.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_logs.dart';
import 'package:pay_day_mobile/modules/starting/view/onboarding_screen.dart';
import 'package:pay_day_mobile/modules/starting/view/splash_screen.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../modules/home/presentation/home.dart';
import '../modules/more/presentation/view/more.dart';

// const String splash = AppString.splashScreen;
// const String signIn = AppString.signInScreen;
// const String forgot = AppString.forgotScreen;
// const String receive = AppString.receiveScreen;
// const String onboard = AppString.onboardScreen;
// const String attendLog = AppString.attendLogScreen;
// const String more = AppString.moreScreen;

List<GetPage> getPage = [
  GetPage(
    name: AppString.splashScreen,
    page: () => splashScreen(),
  ),
  GetPage(name: AppString.signInScreen, page: () => signInScreen()),
  GetPage(
    name: AppString.forgotScreen,
    page: () => forgotScreen(),
  ),
  GetPage(
    name: AppString.receiveScreen,
    page: () => receiveScreen(),
  ),
  GetPage(
    name: AppString.onboardScreen,
    page: () => onboardingScreen(),
  ),
  GetPage(
    name: AppString.attendLogScreen,
    page: () => attendanceLogsScreen(),
  ),
  GetPage(
    name: AppString.moreScreen,
    page: () => MoreScreen(),
  ),
  GetPage(
    name: AppString.HOME,
    page: () => const Home(),
  ),
];
