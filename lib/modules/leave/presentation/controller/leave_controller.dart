import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/leave/data/leave_repository.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_allowance.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_record.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_summary.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_type.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class LeaveController extends GetxController with StateMixin {
  final LeaveRepository _leaveRepository = LeaveRepository(NetworkClient());

  LeaveAllowance leaveAllowance = LeaveAllowance();

  LeaveSummary leaveSummary = LeaveSummary();

  LeaveRecord leaveRecord = LeaveRecord();

  List<String> leaveType = [];

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
}
