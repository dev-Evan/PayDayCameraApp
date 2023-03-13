import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';

Future<void> initApp() async {
  Get.lazyPut(() => AuthController());

}
