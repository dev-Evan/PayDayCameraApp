import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/modules/attendance/data/attandance_logs_repository.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_summary/log_summary_overview.dart';
import 'package:pay_day_mobile/modules/attendance/domain/request_attendance/request_attendance.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/logger.dart';
import '../../../../common/widget/error_message.dart';
import '../../../../utils/exception_handler.dart';
import '../../domain/all_log_summary/all_log_summay.dart';

class AttendanceLogsController extends GetxController with StateMixin {
  @override
  void onInit() {
    floatingScrollController = ScrollController()
      ..addListener(() {
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

  final isShortSummaryClicked = false.obs;

  late ScrollController scrollController;

  final isLoading = false.obs;

  late ScrollController floatingScrollController;

  final RxBool isFloatingActionVisible = true.obs;

  final queryString = "within=thisMonth".obs;

  final clickIndex = 0.obs;

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

          filteredLogSummary = value;
        }, onError: (error) {
          LoggerHelper.errorLog(message: error.message);
        });
        isMoreDataLoading(false);
      } else {
        queryString("within=thisMonth");
      }
    }
  }

  getLogSummaryByMonth() async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository.getLogSummaryByThisMonth().then(
        (logSummaryByMonth) {
      this.logSummaryByMonth.value = logSummaryByMonth;
      LoggerHelper.infoLog(message: logSummaryByMonth.message);
    }, onError: (error) {
      errorChecker(error.message);
      LoggerHelper.errorLog(message: error.message);
    });
    change(null, status: RxStatus.success());
  }

  getLogSummaryByYear() async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository.getLogSummaryByThisYear().then(
        (logSummaryByYear) {
      this.logSummaryByYear.value = logSummaryByYear;
      LoggerHelper.infoLog(message: logSummaryByYear.message);
    }, onError: (error) {
      errorChecker(error.message);
      LoggerHelper.errorLog(message: error.message);
    });
    change(null, status: RxStatus.success());
  }

  getAllFilteredLogSummary({String? queryParams, int? page}) async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository
        .getAllFilteredLogs(queryParams: queryString.value)
        .then((value) {
      filteredLogSummary = value;
      logList.clear();
      value.data!.data!.map((e) => logList.add(e)).toList();
      if (filteredLogSummary.data!.meta!.currentPage! ==
          filteredLogSummary.data!.meta!.totalPages!) {
        queryString("within=thisMonth");
      }
      LoggerHelper.infoLog(message: value.message);
    }, onError: (error) {
      LoggerHelper.errorLog(message: error.message);
      errorChecker(error.message);
    });
    change(null, status: RxStatus.success());
  }

  getLogSummaryOverview({String? queryParams}) async {
    change(null, status: RxStatus.loading());
    await _attendanceLogsRepository
        .getLogSummaryOverview(queryParams: queryParams)
        .then((value) {
      logSummaryOverview = value;
      LoggerHelper.infoLog(message: value.message);
    }, onError: (error) {
      LoggerHelper.errorLog(message: error.message);
      errorChecker(error.message);
    });
    change(null, status: RxStatus.success());
  }

  Future<bool> requestAttendance() async {
    bool returnValue = false;
    isLoading(true);
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
      isLoading(false);
      textEditingController.clear();
      returnValue = true;
      //showSuccessMessage(message: value.message ?? "");
      getAllFilteredLogSummary();
      LoggerHelper.infoLog(message: value.message);
    }, onError: (error) {
      isLoading(false);
      textEditingController.clear();
      showErrorMessage(errorMessage: error.message);
      returnValue = false;
      LoggerHelper.errorLog(message: error.message);
    });
    isLoading(false);

    return returnValue;
  }

  cancelRequest({required int requestId}) async {
    isLoading.value = true;
    _attendanceLogsRepository.cancelRequest(requestId).then((value) {
      LoggerHelper.infoLog(message: value.message);
      Get.back(canPop: false);
      getAllFilteredLogSummary();
      isLoading.value = false;
    }, onError: (error) {
      LoggerHelper.errorLog(message: error.message);
      isLoading.value = false;
    });
  }
}
