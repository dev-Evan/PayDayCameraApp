import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/warning_message.dart';
import 'package:pay_day_mobile/utils/exception_handler.dart';
import 'package:pay_day_mobile/common/widget/success_message.dart';
import 'package:pay_day_mobile/modules/leave/data/leave_repository.dart';
import 'package:pay_day_mobile/modules/leave/domain/individual_date_leave.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_allowance.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_details.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_record.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_summary.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_type.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../../utils/app_string.dart';

class LeaveController extends GetxController with StateMixin {
  final LeaveRepository _leaveRepository = LeaveRepository(NetworkClient());
  final isLoading = false.obs;

  LeaveAllowance leaveAllowance = LeaveAllowance();

  LeaveSummary leaveSummary = LeaveSummary();

  LeaveRecord leaveRecord = LeaveRecord();

  Map<dynamic, String> leaveType = {};

  Rx<IndividualDateLeave> individualDateLeaveList = IndividualDateLeave().obs;

  LeaveDetails leaveDetails = LeaveDetails();

  final leaveDurationIndex = 0.obs;
  final isFilePicked = false.obs;

  final leaveNote = TextEditingController();

  final RxMap<dynamic, dynamic> requestLeaveQueries = {}.obs;

  final startDate = DateFormat('yyyy-MM-dd').format(DateTime.now().toUtc()).obs;
  final endDate = DateFormat('yyyy-MM-dd').format(DateTime.now().toUtc()).obs;

  final isValueLoading = false.obs;

  final rangeName = "This Month".obs;

  final rangeStartDay =
      DateTime.utc(DateTime.now().year, DateTime.now().month, 1).obs;
  final rangeEndDate =
      DateTime.utc(DateTime.now().year, DateTime.now().month + 1, 0).obs;

  getLeaveAllowance() async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveAllowance().then((value) {
      leaveAllowance = value;
    }, onError: (error) {
      errorChecker(error.message);
    });

    change(null, status: RxStatus.success());
  }

  getLeaveSummary() async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveSummary().then((value) {
      leaveSummary = value;
    }, onError: (error) {
      errorChecker(error.message);
    });

    change(null, status: RxStatus.success());
  }

  getLeaveRecord({required String params}) async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveRecord(params).then((LeaveRecord value) {
      leaveRecord = value;
    }, onError: (error) {
      errorChecker(error.message);
    });

    change(null, status: RxStatus.success());
  }

  getLeaveType() async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveType().then((LeaveType value) {
      leaveType.clear();
      leaveType = {for (var e in value.data!) e.id: e.name ?? ''};
    }, onError: (error) {
      showWarningMessage(
          message: "Leave type not loaded properly. Please try again later");
    });
    change(null, status: RxStatus.success());
  }

  getIndividualLeaveList({required String queryParams}) async {
    isValueLoading.value = true;
    await _leaveRepository
        .getIndividualDateLeave(queryParams: queryParams)
        .then((individualDateLeaveValue) {
      individualDateLeaveList.value = individualDateLeaveValue;
    }, onError: (error) {
      errorChecker(error.message);
    });

    isValueLoading.value = false;
  }

  getILeaveDetails({required int id}) async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveDetails(id: id).then((value) {
      leaveDetails = value;
    }, onError: (error) {
      errorChecker(error.message);
    });

    change(null, status: RxStatus.success());
  }

  cancelLeave({required int id}) async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.cancelLeave(id: id).then((value) async {
      Get.back(canPop: false);
      getLeaveRecord(params: "&within=thisYear");
      Map<String, String> queryParams = {
        "start": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "end": DateFormat("yyyy-MM-dd").format(DateTime.now())
      };
      String dateValue = json.encode(queryParams);
      await Get.find<LeaveController>()
          .getIndividualLeaveList(queryParams: "date_range=$dateValue");
    }, onError: (error) {
      errorChecker(error.message);
    });
    change(null, status: RxStatus.success());
  }

  requestLeave({required Map<dynamic, dynamic> leaveARequestQueries}) async {
    isLoading(true);
    await _leaveRepository
        .requestLeave(leaveQueries: leaveARequestQueries)
        .then((value) async {
      isLoading(false);
      Map<String, String> queryParams = {
        "start": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "end": DateFormat("yyyy-MM-dd").format(DateTime.now())
      };
      String dateValue = json.encode(queryParams);
      await Get.find<LeaveController>()
          .getIndividualLeaveList(queryParams: "date_range=$dateValue");
      Get.back(canPop: false);
      showSuccessMessage(
          message: AppString.text_leave_request_successfully,
          marginForButton: 60);
      //clear queries after api call
      requestLeaveQueries.clear();
      //clear textField data
      leaveNote.clear();
      isFilePicked(false);
    }, onError: (error) {
      isLoading(false);
      errorChecker(error.message);
    });
    isLoading(false);
  }
}
