import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'common/controller/status_controller.dart';
import 'modules/more/presentation/controller/user_profile_controller.dart';
import 'modules/payslip/presentation/controller/payrun_badge_controller.dart';
import 'modules/payslip/presentation/controller/payslip_list_controller.dart';

Future<void> initApp() async {
  await GetStorage.init();
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => AttendanceController(),fenix: true);
  Get.lazyPut(() => AttendanceLogsController(),fenix: true);
   Get.lazyPut(() => PayslipListController(), fenix: true);
   Get.lazyPut(() => PayrunBadgeController(), fenix: true);
   Get.lazyPut(() => DocumentController(), fenix: true);
   Get.lazyPut(() => ProfileDataController(), fenix: true);




  Get.put(StatusController());
}
