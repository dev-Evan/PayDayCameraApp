import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/data/attandance_logs_repository.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary_overview.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../domain/all_log_summary/all_log_summay.dart';

class AttendanceLogsController extends GetxController with StateMixin {
  final AttendanceLogsRepository _attendanceLogsRepository =
      AttendanceLogsRepository(NetworkClient());

  Rx<LogSummary> logSummaryByMonth = LogSummary().obs;
  Rx<LogSummary> logSummaryByYear = LogSummary().obs;
  Rx<FilteredLogSummary> filteredLogSummary = FilteredLogSummary().obs;
  final currentIndex = 0.obs;
  LogSummaryOverview logSummaryOverview = LogSummaryOverview();

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

  void getAllFilteredLogSummary({String? queryParams}) async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository.getAllFilteredLogs().then(
        (value) => filteredLogSummary.value = value,
        onError: (error) => print(error.message));
    change(null, status: RxStatus.success());
  }

  void getLogSummaryOverview({String? queryParams}) async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository
        .getLogSummaryOverview(queryParams: queryParams)
        .then((value) => logSummaryOverview = value,
            onError: (error) => print(error.message));
    change(null, status: RxStatus.success());
  }
}
