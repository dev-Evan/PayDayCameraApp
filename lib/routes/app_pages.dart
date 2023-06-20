import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/announce.dart';
import 'package:pay_day_mobile/modules/starting/view/splash_screen.dart';

import '../modules/attendance/presentation/view/attendance_logs.dart';
import '../modules/auth/presentation/view/forgot_password.dart';
import '../modules/auth/presentation/view/sign_in.dart';
import '../modules/home/presentation/home.dart';
import '../modules/leave/domain/leave_allowance.dart';
import '../modules/leave/presentation/view/leave.dart';
import '../modules/more/presentation/view/about_this_app.dart';
import '../modules/more/presentation/view/address_details.dart';
import '../modules/more/presentation/view/bank_details.dart';
import '../modules/more/presentation/view/documents.dart';
import '../modules/more/presentation/view/jod_history.dart';
import '../modules/more/presentation/view/leave_allowance.dart';
import '../modules/more/presentation/view/more.dart';
import '../modules/more/presentation/view/salary_overview.dart';
import '../modules/more/presentation/widget/update_document.dart';
import '../modules/notification/presentation/view/notifications.dart';
import '../modules/payslip/presentation/view/payrun_badge.dart';
import '../modules/payslip/presentation/view/payslip.dart';
import '../modules/starting/view/onboarding_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: _Paths.SIGN_IN,
        transition: Transition.rightToLeft,
        page: () => const SignInScreen()),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const forgotScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      name: _Paths.ONBOARD_SCREEN,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      name: _Paths.ATTENDANCE_LOG,
      page: () => const AttendanceLogsScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      name: _Paths.MORE_SCREEN,
      page: () => MoreScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      name: _Paths.HOME,
      page: () => const Home(),
    ),
    GetPage(
      name: _Paths.PAYSLIP,
      page: () => PaySlip(),
    ),
    GetPage(
      name: _Paths.LEAVE,
      page: () => const Leave(),
    ),
    GetPage(
      name: _Paths.LEAVE,
      page: () => const Leave(),
    ),
    GetPage(
      name: _Paths.PROFILE_VIEW,
      transition: Transition.rightToLeft,

      page: () => const SignInScreen()),
    GetPage(
      name: _Paths.UPDATE_DOCUMENT,
      page: () =>  UpdateDocument(),
    ),
    GetPage(
      name: _Paths.DOCUMENT_SCREEN,
      transition: Transition.rightToLeft,
      page: () => DocumentScreen(),
    ),
    GetPage(
      name: _Paths.JOB_HISTORY,
      transition: Transition.rightToLeft,
      page: () => JodHistory(),
    ),
    GetPage(
      name: _Paths.SALARY_OVERVIEW,
      transition: Transition.rightToLeft,
      page: () => SalaryOverView(),
    ),
    GetPage(
      name: _Paths.ADDRESS_DETAILS,
      transition: Transition.rightToLeft,
      page: () => AddressDetails(),
    ),
    GetPage(
      name: _Paths.ABOUT_PAGE,
      transition: Transition.rightToLeft,
      page: () => const AboutThisApp(),
    ),
    GetPage(
      name: _Paths.PAYRAN_BAGE,
      transition: Transition.rightToLeft,
      page: () => PayRunBadge(),
    ),

    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      transition: Transition.rightToLeft,
      page: () => Notifications(),
    ),
    GetPage(
      name: _Paths.BANK_DETAILS,
      transition: Transition.rightToLeft,
      page: () => BankDetails(),
    ),
    GetPage(
      name: _Paths.ANNOUNCE_SCREEN,
      transition: Transition.rightToLeft,
      page: () => AnnounceScreen(),
    ), GetPage(
      name: _Paths.LEAVE_ALLOWANCE_SCREEN,
      transition: Transition.rightToLeft,
      page: () => LeaveAllowanceScreen(),
    ),

  ];
}
