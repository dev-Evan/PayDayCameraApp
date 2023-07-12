import 'dart:async';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/modules/attendance/data/attendance_data_repository.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/logger.dart';
import 'attendance_controller.dart';

class BreakController extends GetxController {
  final AttendanceDataRepository _attendanceDataRepository =
      AttendanceDataRepository(NetworkClient());
  final RxInt selectedIndex = 100.obs;

  Timer timer = Timer(Duration.zero, () {});
  Rx<Duration> duration = const Duration().obs;

  @override
  void onInit() {
    if (Get.find<AttendanceController>().breakDetails.value.breakTimeId !=
        null) {
      DateTime startTime = DateTime.parse(
          Get.find<AttendanceController>().breakDetails.value.startAt!);
      DateTime currentTime = DateTime.now().toUtc();
      duration.value = currentTime.toUtc().difference(startTime);
      _startTimer();
    }
    super.onInit();
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timer();
    });
  }

  void stopTimer() async {
    timer.cancel();
    duration.value = const Duration();
  }

  void _timer() {
    duration.value = Duration(seconds: duration.value.inSeconds + 1);
  }

  startBreak({required int logId, required int breakId}) async {
    await _attendanceDataRepository.startBreak(logId, breakId).then(
        (value) async {
      _startTimer();
      await Get.find<AttendanceController>().checkUserIsPunchedIn();
      LoggerHelper.infoLog(message: value.message);
    }, onError: (error) {
          errorSnackBar(errorMessage: AppString.error_text);
      LoggerHelper.errorLog(message: error.message);
    });
  }

  endBreak({required int logId, required int breakId}) async {
    await _attendanceDataRepository.endBreak(logId, breakId).then(
        (value) async {
      stopTimer();
      await Get.find<AttendanceController>().checkUserIsPunchedIn();
      Get.back(canPop: false);
      LoggerHelper.infoLog(message: value.message);
    }, onError: (error) {
      errorSnackBar(errorMessage: AppString.error_text);
      LoggerHelper.errorLog(message: error.message);
    });
  }
}
