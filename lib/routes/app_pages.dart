import 'package:get/get.dart';

import '../modules/example/presentation/view/example.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const Example(),
      // binding: HomeBinding(),
    ),
  ];
}
