import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/leave/presentation/view/leve_records_view.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/announce.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/edit_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/modules/starting/view/splash_screen.dart';
import '../modules/attendance/presentation/view/attendance_log.dart';
import '../modules/auth/presentation/view/sign_in.dart';
import '../modules/home/presentation/home.dart';
import '../modules/leave/presentation/view/leave.dart';
import '../modules/more/presentation/view/about_this_app.dart';
import '../modules/more/presentation/view/address_details.dart';
import '../modules/more/presentation/view/bank_details.dart';
import '../modules/more/presentation/view/change_password.dart';
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
      page: () =>  SplashScreen(),
    ),
    GetPage(
        name: _Paths.SIGN_IN,
        transition: Transition.rightToLeft,
        page: () =>  SignInScreen()),
    GetPage(
      transition: Transition.cupertino,
      name: _Paths.ONBOARD_SCREEN,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      transition: Transition.cupertino,
      name: _Paths.ATTENDANCE_LOG,
      page: () => const AttendanceLog(),
    ),
    GetPage(
      transition: Transition.cupertino,
      name: _Paths.MORE_SCREEN,
      page: () => const MoreScreen(),
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
      page: () =>  const ViewProfile()),

    GetPage(
      name: _Paths.UPDATE_DOCUMENT,
      page: () =>  UpdateDocument(),
    ),
    GetPage(
      name: _Paths.DOCUMENT_SCREEN,
      transition: Transition.rightToLeft,
      page: () => const DocumentScreen(),
    ),
    GetPage(
      name: _Paths.JOB_HISTORY,
      transition: Transition.rightToLeft,
      page: () => const JodHistory(),
    ),
    GetPage(
      name: _Paths.SALARY_OVERVIEW,
      transition: Transition.rightToLeft,
      page: () => const SalaryOverView(),
    ),
    GetPage(
      name: _Paths.ADDRESS_DETAILS,
      transition: Transition.rightToLeft,
      page: () => const AddressDetails(),
    ),
    GetPage(
      name: _Paths.ABOUT_PAGE,
      transition: Transition.rightToLeft,
      page: () => const AboutThisApp(),
    ),
    GetPage(
      name: _Paths.PAYRAN_BAGE,
      transition: Transition.rightToLeft,
      page: () => const PayRunBadge(),
    ),

    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      transition: Transition.rightToLeft,
      page: () => const Notifications(),
    ),
    GetPage(
      name: _Paths.BANK_DETAILS,
      transition: Transition.rightToLeft,
      page: () => const BankDetails(),
    ),
    GetPage(
      name: _Paths.ANNOUNCE_SCREEN,
      transition: Transition.rightToLeft,
      page: () => const AnnounceScreen(),
    ),

    GetPage(
      name: _Paths.LEAVE_ALLOWANCE_SCREEN,
      transition: Transition.rightToLeft,
      page: () => const LeaveAllowanceScreen(),
    ),



    GetPage(
      name: _Paths.EDIT_PROFILE,
      transition: Transition.rightToLeft,
      page: () =>  EditProfile(),
    ),

    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      transition: Transition.rightToLeft,
      page: () => ChangePassword(),
    ),

    GetPage(
      name: _Paths.LEAVE_RECORD,

      transition: Transition.rightToLeft,
      page: () => const LeaveRecordsView(),
    ),



  ];
}
