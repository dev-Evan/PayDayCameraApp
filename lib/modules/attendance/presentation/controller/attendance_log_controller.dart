import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/modules/attendance/data/attandance_logs_repository.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary_overview.dart';
import 'package:pay_day_mobile/modules/attendance/domain/request_attendance/request_attendance.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../domain/all_log_summary/all_log_summay.dart';

class AttendanceLogsController extends GetxController with StateMixin {
  final AttendanceLogsRepository _attendanceLogsRepository =
      AttendanceLogsRepository(NetworkClient());

  Rx<LogSummary> logSummaryByMonth = LogSummary().obs;
  Rx<LogSummary> logSummaryByYear = LogSummary().obs;
  FilteredLogSummary filteredLogSummary = FilteredLogSummary();
  final currentIndex = 0.obs;
  final tabIndex = 0.obs;
  LogSummaryOverview logSummaryOverview = LogSummaryOverview();

  final TextEditingController textEditingController = TextEditingController();

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
    await _attendanceLogsRepository.getAllFilteredLogs(queryParams: queryParams ).then(
        (value) => filteredLogSummary = value,
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

  void requestAttendance() async {
    change(null, status: RxStatus.loading());
    var controller = Get.find<DateTimeController>();
    await _attendanceLogsRepository
        .requestAttendance(RequestAttendanceChangeReq(
      note: textEditingController.text,
      inDate: controller.requestedDate.value,
      inTime:
          "${DateFormat("yyyy-MM-dd hh:mm a").parse("${controller.requestedDate.value} ${controller.pickedInTime.value}")}",
      outTime:
          "${DateFormat("yyyy-MM-dd hh:mm a").parse("${controller.requestedDate.value} ${controller.pickedOutTime.value}")}",
    ))
        .then((value) => print(value.toString()), onError: (error) {
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }

}
