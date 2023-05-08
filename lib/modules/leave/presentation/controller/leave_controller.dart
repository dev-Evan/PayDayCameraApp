import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/leave/data/leave_repository.dart';
import 'package:pay_day_mobile/modules/leave/domain/individual_date_leave.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_allowance.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_details.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_record.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_summary.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class LeaveController extends GetxController with StateMixin {
  final LeaveRepository _leaveRepository = LeaveRepository(NetworkClient());

  LeaveAllowance leaveAllowance = LeaveAllowance();

  LeaveSummary leaveSummary = LeaveSummary();

  LeaveRecord leaveRecord = LeaveRecord();

  List<String> leaveType = [];

  Rx<IndividualDateLeave> individualDateLeaveList = IndividualDateLeave().obs;

  LeaveDetails leaveDetails = LeaveDetails();

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
    }, onError: (error) => print("getLeaveAllowance ${error.message}"));

    change(null, status: RxStatus.success());
  }

  getLeaveSummary() async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveSummary().then((value) {
      print("getLeaveSummary ::: called");
      leaveSummary = value;
    }, onError: (error) => print("getLeaveSummary ${error.message}"));

    change(null, status: RxStatus.success());
  }

  getLeaveRecord(String params) async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveRecord(params).then((value) {
      print("getLeaveRecord ::: called");
      leaveRecord = value;
    }, onError: (error) => print("getLeaveRecord ${error.message}"));

    change(null, status: RxStatus.success());
  }

  getLeaveType() async {
    change(null, status: RxStatus.loading());
    await _leaveRepository.getLeaveType().then((value) {
      print("getLeaveType ::: called");
      leaveType.clear();
      value.data?.map((e) => leaveType.add(e.name!)).toList(growable: true);
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
    ;
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
    await _leaveRepository.cancelLeave(id: id).then((value) {
      print("getILeaveDetails ::: called");
      Get.back(canPop: false);
      getLeaveRecord("&within=thisYear");
    }, onError: (error) => print("getILeaveDetails ${error.message}"));

    change(null, status: RxStatus.success());
  }
}
