import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/home/presentation/home.dart';

import '../modules/example/presentation/view/example.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const Home(),
      // binding: HomeBinding(),
    ),
  ];
}
