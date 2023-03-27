import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:get_storage/get_storage.dart';

Future<void> initApp() async {
  await GetStorage.init();
  Get.lazyPut(() => AuthController());
  // Get.lazyPut(() => AttendanceController(), fenix: true);
  Get.put(AttendanceController());
}
