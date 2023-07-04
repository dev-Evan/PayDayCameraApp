import 'dart:async';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/data/attendance_data_repository.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'attendance_controller.dart';

class BreakController extends GetxController {
  final AttendanceDataRepository _attendanceDataRepository =
      AttendanceDataRepository(NetworkClient());
  final selectedIndex = 100.obs;

  Timer timer = Timer(Duration.zero, () {});
  Rx<Duration> duration = const Duration().obs;

  @override
  void onInit() {
    if (Get.find<AttendanceController>().breakDetails.value.breakTimeId !=
        null) {
      DateTime startTime = DateTime.parse(
          Get.find<AttendanceController>().breakDetails.value.startAt!);
      DateTime currentTime = DateTime.now().toUtc();
      print("start:: $startTime current::: $currentTime without utc:: ${DateTime.now()}");
      print("Time diff:: ${currentTime.toUtc().difference(startTime)}");
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
    duration.value=Duration();
  }

  void _timer() {
    duration.value = Duration(seconds: duration.value.inSeconds + 1);
    print(duration.value);
  }

  startBreak({required int logId, required int breakId}) async {
    await _attendanceDataRepository.startBreak(logId, breakId).then(
        (value) async {
      print("startBreak:: $value");
      _startTimer();
      await Get.find<AttendanceController>().checkUserIsPunchedIn();
    }, onError: (error) {
      print("startBreak::${error.message}");
    });
  }

  endBreak({required int logId, required int breakId}) async {
    await _attendanceDataRepository.endBreak(logId, breakId).then(
        (value) async {
      print("endBreak:: $value");
      stopTimer();
      await Get.find<AttendanceController>().checkUserIsPunchedIn();
      Get.back(canPop: false);
    }, onError: (error) {
      print("endBreak::${error.message}");
    });
  }
}
