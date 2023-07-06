
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/modules/attendance/data/attandance_logs_repository.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary_overview.dart';
import 'package:pay_day_mobile/modules/attendance/domain/request_attendance/request_attendance.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../../../common/widget/error_snackbar.dart';
import '../../domain/all_log_summary/all_log_summay.dart';

class AttendanceLogsController extends GetxController with StateMixin {
  @override
  void onInit() {
    floatingScrollController = ScrollController()
      ..addListener(() {
        print("Called:: floatingScrollController");
        if (floatingScrollController.position.atEdge) {
          if (floatingScrollController.position.pixels > 0) {
            if (isFloatingActionVisible.isTrue) {
              isFloatingActionVisible(false);
            }
          }
        } else {
          if (isFloatingActionVisible.isFalse) {
            isFloatingActionVisible(true);
          }
        }
      });
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          _loadMoreFilteredLogSummary();
        }
      });
    super.onInit();
  }

  late ScrollController scrollController;

  late ScrollController floatingScrollController;

  final RxBool isFloatingActionVisible = true.obs;

  final queryString = "within=thisMonth".obs;

  final AttendanceLogsRepository _attendanceLogsRepository =
      AttendanceLogsRepository(NetworkClient());

  Rx<LogSummary> logSummaryByMonth = LogSummary().obs;
  Rx<LogSummary> logSummaryByYear = LogSummary().obs;
  FilteredLogSummary filteredLogSummary = FilteredLogSummary();
  LogSummaryOverview logSummaryOverview = LogSummaryOverview();
  final isMoreDataLoading = false.obs;
  final currentIndex = 0.obs;
  final tabIndex = 0.obs;
  final RxList logList = [].obs;
  final TextEditingController textEditingController = TextEditingController();

  void _loadMoreFilteredLogSummary() async {
    print("_loadMoreFilteredLogSummary :: Called");
    if (filteredLogSummary.data != null) {
      if (filteredLogSummary.data!.meta!.currentPage! <
          filteredLogSummary.data!.meta!.totalPages!) {
        isMoreDataLoading(true);
        await _attendanceLogsRepository
            .getAllFilteredLogs(
                queryParams: queryString.value,
                page: filteredLogSummary.data!.meta!.currentPage! + 1)
            .then((value) {
          value.data!.data!.map((e) => logList.add(e)).toList();
          print("logList.length::: ${logList.length}");
          print("getAllFiltered More data::: called");
          filteredLogSummary = value;
        }, onError: (error) => print(error.message));
        isMoreDataLoading(false);
      } else {
        queryString("within=thisMonth");
      }
    }
  }

  void getLogSummaryByMonth() async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository.getLogSummaryByThisMonth().then(
        (logSummaryByMonth) {
      print("getLogSummaryByMonth:: called");
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
      print("getLogSummaryByYear:: called");
      this.logSummaryByYear.value = logSummaryByYear;
    }, onError: (error) {
      print(error);
    });
    change(null, status: RxStatus.success());
  }

  void getAllFilteredLogSummary({String? queryParams, int? page}) async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository
        .getAllFilteredLogs(queryParams: queryString.value)
        .then((value) {
      filteredLogSummary = value;
      logList.clear();
      value.data!.data!.map((e) => logList.add(e)).toList();
      print("logList.length::: ${logList.length}");
      print("getAllFilteredLogSummary::: called");
      if (filteredLogSummary.data!.meta!.currentPage! ==
          filteredLogSummary.data!.meta!.totalPages!) {
        queryString("within=thisMonth");
      }
    }, onError: (error) {
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }

  void getLogSummaryOverview({String? queryParams}) async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository
        .getLogSummaryOverview(queryParams: queryParams)
        .then((value) => logSummaryOverview = value, onError: (error) {
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }

  Future<bool> requestAttendance() async {
    bool returnValue = false;
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
        .then((value) {
      print(value.toString());
      textEditingController.clear();
      returnValue = true;
    }, onError: (error) {
      print(error.message);
      textEditingController.clear();
      errorSnackBar(errorMessage: error.message);
      returnValue = false;
    });
    change(null, status: RxStatus.success());
    return returnValue;
  }
}
