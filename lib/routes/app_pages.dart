import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/forgot_password.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/received_screen.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/sign_in.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_logs.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leave.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/about_this_app.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/address_details.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/jod_history.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/salary_overview.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/update_document.dart';
import 'package:pay_day_mobile/modules/notification/presentation/view/notifications.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payrun_badge.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payslip.dart';
import 'package:pay_day_mobile/modules/starting/view/onboarding_screen.dart';
import 'package:pay_day_mobile/modules/starting/view/splash_screen.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../modules/home/presentation/home.dart';
import '../modules/more/presentation/view/more.dart';

List<GetPage> getPage = [
  GetPage(
    name: AppString.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
      name: AppString.signInScreen,
      transition: Transition.rightToLeft,
      page: () => const SignInScreen()),
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
    page: () => OnboardingScreen(),
  ),
  GetPage(
    transition: Transition.cupertino,
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
    name: AppString.payslip,
    page: () => PaySlip(),
  ),
  GetPage(
    name: AppString.leave,
    page: () => const Leave(),
  ),
  GetPage(
    name: AppString.leave,
    page: () => const Leave(),
  ),
  GetPage(
    name: AppString.profileView,
    transition: Transition.rightToLeft,
    page: () => ViewProfile(),
  ),
  GetPage(
    name: AppString.updateDocument,
    page: () => const UpdateDocument(),
  ),
  GetPage(
    name: AppString.documentScreen,
    transition: Transition.rightToLeft,
    page: () => DocumentScreen(),
  ),
  GetPage(
    name: AppString.jobHistory,
    transition: Transition.rightToLeft,
    page: () => JodHistory(),
  ),
  GetPage(
    name: AppString.salaryOverView,
    transition: Transition.rightToLeft,
    page: () => SalaryOverView(),
  ),
  GetPage(
    name: AppString.addressDetails,
    transition: Transition.rightToLeft,
    page: () => AddressDetails(),
  ),
  GetPage(
    name: AppString.aboutPage,
    transition: Transition.rightToLeft,
    page: () => const AboutThisApp(),
  ),
  GetPage(
    name: AppString.payrunBage,
    transition: Transition.rightToLeft,
    page: () => PayRunBadge(),
  ),
  GetPage(
    name: AppString.notification_screen,
    transition: Transition.rightToLeft,
    page: () => Notifications(),
  ),
];
