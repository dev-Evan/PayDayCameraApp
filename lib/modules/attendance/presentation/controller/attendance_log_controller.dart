import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/data/attandance_logs_repository.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class AttendanceLogsController extends GetxController with StateMixin {
  final AttendanceLogsRepository _attendanceLogsRepository =
      AttendanceLogsRepository(NetworkClient());

  Rx<LogSummary> logSummaryByMonth = LogSummary().obs;
  Rx<LogSummary> logSummaryByYear = LogSummary().obs;
  final currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getLogSummaryByMonth() async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository.getLogSummaryByThisMonth().then(
        (logSummaryByMonth) {
      print(logSummaryByMonth);
      this.logSummaryByMonth.value = logSummaryByMonth;
    }, onError: (error) {
      print(error);
    });
    change(null, status: RxStatus.success());
  }

  void getLogSummaryByYear() async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository.getLogSummaryByThisYear().then(
        (logSummaryByYear) {
      print(logSummaryByYear);
      this.logSummaryByYear.value = logSummaryByYear;
    }, onError: (error) {
      print(error);
    });
    change(null, status: RxStatus.success());
  }
}
