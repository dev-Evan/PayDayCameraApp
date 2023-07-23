import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/controller/connectivity_controller.dart';
import 'package:pay_day_mobile/common/controller/downloader_helper.dart';
import 'package:pay_day_mobile/common/controller/language_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_log_controller.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/notification/presentation/controller/notication_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/documet_controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/documet_controller/update_document_controller.dart';
import 'common/controller/status_controller.dart';
import 'modules/more/presentation/controller/address_controller.dart';
import 'modules/more/presentation/controller/announcement_controller.dart';
import 'modules/more/presentation/controller/common_controller/date_of_birth_controller.dart';
import 'modules/more/presentation/controller/documet_controller/document_upload_controller.dart';
import 'modules/more/presentation/controller/common_controller/edit_profile_drop_dawon_cnt.dart';
import 'modules/more/presentation/controller/logout_controller.dart';
import 'modules/more/presentation/controller/bank_info_controller.dart';
import 'modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'modules/more/presentation/controller/common_controller/pick_image_controller.dart';
import 'modules/more/presentation/controller/salary_overview_controller.dart';
import 'modules/more/presentation/controller/user_profile_controller.dart';
import 'modules/payslip/presentation/controller/payslip_controller.dart';
import 'modules/payslip/presentation/controller/payslip_view_controller.dart';
import 'modules/setting/presentation/controller/setting_controller.dart';

Future<void> initApp() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(ignoreSsl: true);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  Get.put(LanguageController(), permanent: true);
  Get.put(ConnectivityController(), permanent: true);
  Get.lazyPut(() => DownloadHelper(), fenix: true);
  Get.lazyPut(() => StatusController(), fenix: true);
  Get.lazyPut(() => SettingController(), fenix: true);
  Get.lazyPut(() => AttendanceController(), fenix: true);
  Get.lazyPut(() => AttendanceLogsController(), fenix: true);
  Get.lazyPut(() => LeaveController(), fenix: true);
  Get.lazyPut(() => NotificationController(), fenix: true);
  Get.lazyPut(() => PayslipController(), fenix: true);
  Get.lazyPut(() => DocumentController(), fenix: true);
  Get.lazyPut(() => ProfileDataController(), fenix: true);
  Get.lazyPut(() => JobHistoryController(), fenix: true);
  Get.lazyPut(() => AddressController(), fenix: true);
  Get.lazyPut(() => SalaryOverviewController(), fenix: true);
  Get.lazyPut(() => DropdownBtnController(), fenix: true);
  Get.lazyPut(() => PayslipViewController(), fenix: true);
  Get.lazyPut(() => PickImageController(), fenix: true);
  Get.lazyPut(() => LogoutController(), fenix: true);
  Get.lazyPut(() => FileUploadController(), fenix: true);
  Get.lazyPut(() => UpdateDocumentController(), fenix: true);
  Get.lazyPut(() => AuthController(), fenix: true);
  Get.lazyPut(() => BankInfoController(), fenix: true);
  Get.lazyPut(() => InputTextFieldController(), fenix: true);
  Get.lazyPut(() => DatePickerController(), fenix: true);
  Get.lazyPut(() => AnnouncementController(), fenix: true);
}
