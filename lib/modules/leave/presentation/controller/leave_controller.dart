import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/error_alert_pop_up.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/leave/data/leave_repository.dart';
import 'package:pay_day_mobile/modules/leave/domain/individual_date_leave.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_allowance.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_details.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_record.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_summary.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_type.dart';
import 'package:pay_day_mobile/network/network_client.dart';

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
      print("getLeaveAllowance ::: called");
      leaveAllowance = value;
    }, onError: (error) {
      if (!Get.isDialogOpen!) {
        errorAlertPopup(_refreshPage);
      }
    });

    change(null, status: RxStatus.success());
  }

  getLeaveSummary() async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveSummary().then((value) {
      print("getLeaveSummary ::: called");
      leaveSummary = value;
    }, onError: (error) {
      if (!Get.isDialogOpen!) {
        errorAlertPopup(_refreshRecordPage);
      }
    });

    change(null, status: RxStatus.success());
  }

  getLeaveRecord({required String params}) async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveRecord(params).then((LeaveRecord value) {
      print("getLeaveRecord ::: called");
      leaveRecord = value;
    }, onError: (error) {
      if (!Get.isDialogOpen!) {
        errorAlertPopup(_refreshRecordPage);
      }
    });

    change(null, status: RxStatus.success());
  }

  getLeaveType() async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveType().then((LeaveType value) {
      print("getLeaveType ::: called");
      leaveType.clear();
      leaveType = {for (var e in value.data!) e.id: e.name ?? ''};
      print("list data::: $leaveType");
    }, onError: (error) => print("getLeaveType ${error.message}"));

    change(null, status: RxStatus.success());
  }

  getIndividualLeaveList({required String queryParams}) async {
    isValueLoading.value = true;
    await _leaveRepository
        .getIndividualDateLeave(queryParams: queryParams)
        .then((individualDateLeaveValue) {
      print("getIndividualLeaveList ::: called $individualDateLeaveValue");
      individualDateLeaveList.value = individualDateLeaveValue;
    }, onError: (error) => print("getIndividualLeaveList ${error.message}"));

    isValueLoading.value = false;
  }

  getILeaveDetails({required int id}) async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveDetails(id: id).then((value) {
      print("getILeaveDetails ::: called");
      leaveDetails = value;
    }, onError: (error) => print("getILeaveDetails ${error.message}"));

    change(null, status: RxStatus.success());
  }

  cancelLeave({required int id}) async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.cancelLeave(id: id).then((value) async {
      print("getILeaveDetails ::: called");
      Get.back(canPop: false);
      getLeaveRecord(params: "&within=thisYear");
      Map<String, String> queryParams = {
        "start": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "end": DateFormat("yyyy-MM-dd").format(DateTime.now())
      };
      String dateValue = json.encode(queryParams);
      await Get.find<LeaveController>()
          .getIndividualLeaveList(queryParams: "date_range=$dateValue");
    }, onError: (error) => print("getILeaveDetails ${error.message}"));

    change(null, status: RxStatus.success());
  }

  requestLeave({required Map<dynamic, dynamic> leaveARequestQueries}) async {
    isLoading(true);
    await _leaveRepository
        .requestLeave(leaveQueries: leaveARequestQueries)
        .then((value) async {
      isLoading(false);
      print("requestLeave ::: called");
      showCustomSnackBar(message: value.message ?? "");
      Map<String, String> queryParams = {
        "start": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        "end": DateFormat("yyyy-MM-dd").format(DateTime.now())
      };
      String dateValue = json.encode(queryParams);
      await Get.find<LeaveController>()
          .getIndividualLeaveList(queryParams: "date_range=$dateValue");
      Get.back(canPop: false);
      //clear queries after api call
      Get.find<LeaveController>().requestLeaveQueries.clear();
    }, onError: (error) {
      isLoading(false);
      showCustomSnackBar(message: "${error.message}");
      print("getILeaveDetails $error");
    });
    isLoading(false);
  }

  _refreshPage() async {
    getLeaveAllowance();
    Map<String, String> queryParams = {
      "start": DateFormat("yyyy-MM-dd").format(DateTime.now()),
      "end": DateFormat("yyyy-MM-dd").format(DateTime.now())
    };
    String value = json.encode(queryParams);
    getIndividualLeaveList(queryParams: "date_range=$value");
  }

  _refreshRecordPage() async {
    await getLeaveSummary();
    await getLeaveRecord(params: "&within=thisMonth");
  }
}
