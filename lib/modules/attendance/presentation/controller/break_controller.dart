import 'dart:async';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/modules/attendance/data/attendance_data_repository.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/logger.dart';
import 'attendance_controller.dart';

class BreakController extends GetxController with StateMixin {
  final AttendanceDataRepository _attendanceDataRepository =
      AttendanceDataRepository(NetworkClient());
  final RxInt selectedIndex = 100.obs;

  Timer timer = Timer(Duration.zero, () {});
  Rx<Duration> duration = const Duration().obs;
  final isLoading = false.obs;

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
    isLoading(true);
    await _attendanceDataRepository.startBreak(logId, breakId).then(
        (value) async {
      _startTimer();

      await Get.find<AttendanceController>().checkUserIsPunchedIn();
      LoggerHelper.infoLog(message: value.message);
    }, onError: (error) {
      errorSnackBar(errorMessage: AppString.error_text);
      LoggerHelper.errorLog(message: error.message);
    });
    isLoading(false);
  }

  Future<bool> endBreak({required int logId, required int breakId}) async {
    bool returnValue = false;
    isLoading(true);
    await _attendanceDataRepository.endBreak(logId, breakId).then(
        (value) async {
      returnValue = true;
      stopTimer();
      await Get.find<AttendanceController>().checkUserIsPunchedIn();
      LoggerHelper.infoLog(message: value.message);
    }, onError: (error) {
      returnValue = false;
      errorSnackBar(errorMessage: AppString.error_text);
      LoggerHelper.errorLog(message: error.message);
    });
    isLoading(false);
    return returnValue;
  }
}
