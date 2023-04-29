import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';

import 'common/controller/status_controller.dart';

Future<void> initApp() async {
  await GetStorage.init();
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => AttendanceController(),fenix: true);
  Get.lazyPut(() => AttendanceLogsController(),fenix: true);
  Get.lazyPut(() => LeaveController(),fenix: true);
  // Get.lazyPut(() => DateTimeController(), fenix: true);
  // Get.lazyPut(() => StatusController(), fenix: true);
  Get.put(StatusController());
}
