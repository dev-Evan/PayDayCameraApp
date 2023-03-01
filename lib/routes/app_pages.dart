
// import 'package:get/get.dart';
// import 'package:pay_day_mobile/modules/example/presentation/auth/sign_in.dart';
// import 'package:pay_day_mobile/modules/example/presentation/view/splash_screen.dart';
//
// import '../modules/example/presentation/view/example.dart';
//
// part 'app_routes.dart';
//
// class AppPages {
//   AppPages._();
//
//   static const INITIAL = Routes.splash;
//
//   static final routes = [
//     GetPage(
//       name: _Paths.HOME,
//       page: () => const Example(),
//       // binding: HomeBinding(),
//     ),
//     GetPage(
//       name: _Paths.splash,
//       page: () => const splashScreen(),
//       // binding: HomeBinding(),
//     ),
//     GetPage(
//       name: _Paths.signIn,
//       page: () => const signInScreen(),
//       // binding: HomeBinding(),
//     ),
//   ];
// }


import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/example/presentation/auth/forgot_password.dart';
import 'package:pay_day_mobile/modules/example/presentation/auth/received_screen.dart';
import 'package:pay_day_mobile/modules/example/presentation/auth/sign_in.dart';
import 'package:pay_day_mobile/modules/example/presentation/view/attendance_logs.dart';
import 'package:pay_day_mobile/modules/example/presentation/view/onboarding_screen.dart';
import 'package:pay_day_mobile/modules/example/presentation/view/splash_screen.dart';
import 'package:pay_day_mobile/utils/app_string.dart';



const String splash =AppString.splashScreen;
const String signIn =AppString.signInScreen;
const String forgot =AppString.forgotScreen;
const String receive =AppString.receiveScreen;
const String onboard =AppString.onboardScreen;
const String attendLog =AppString.attendLogScreen;




List<GetPage> getPage=[
  GetPage(name: splash, page: ()=>splashScreen(),),
  GetPage(name: signIn, page: ()=>signInScreen(),),
  GetPage(name: forgot, page: ()=>forgotScreen(),),
  GetPage(name: receive, page: ()=>receiveScreen(),),
  GetPage(name: onboard, page: ()=>onboardingScreen(),),
  GetPage(name: attendLog, page: ()=>attendanceLogsScreen(),),
];
// =======
// import 'package:get/get.dart';
// import 'package:pay_day_mobile/modules/home/presentation/home.dart';
//
// import '../modules/example/presentation/view/example.dart';
//
//
// part 'app_routes.dart';
//
// class AppPages {
//   AppPages._();
//
//   static const INITIAL = Routes.HOME;
//
//   static final routes = [
//     GetPage(
//       name: _Paths.HOME,
//       page: () => const Home(),
//       // binding: HomeBinding(),
//     ),
//   ];
// }
// >>>>>>> master
