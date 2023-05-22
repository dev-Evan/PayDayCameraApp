import 'dart:convert';

import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/domain/request_attendance/request_attendance.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../common/domain/success_model.dart';
import '../domain/all_log_summary/all_log_summay.dart';
import '../domain/log_summary/log_summary.dart';
import '../domain/log_summary/log_summary_overview.dart';

class AttendanceLogsRepository {
  final NetworkClient networkClient;

  AttendanceLogsRepository(this.networkClient);

  Future<LogSummary> getLogSummaryByThisMonth() async {
    try {
      Response response =
          await networkClient.getRequest(AppString.LOG_SUMMARY_BY_THIS_MONTH);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogSummary.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LogSummary> getLogSummaryByThisYear() async {
    try {
      Response response =
          await networkClient.getRequest(AppString.LOG_SUMMARY_BY_THIS_YEAR);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogSummary.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LogSummaryOverview> getLogSummaryOverview(
      {String? queryParams}) async {
    queryParams ??= "within=thisMonth";
    try {
      Response response = await networkClient
          .getRequest("${AppString.DETAILS_SUMMARY}$queryParams");
      print("LogSummaryOverview:: ${response.body.toString()}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogSummaryOverview.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }



  Future<FilteredLogSummary> getAllFilteredLogs({String? queryParams}) async {
    queryParams ??= "within=thisMonth";
    try {
      Response response = await networkClient.getRequest(
          "${AppString.SUMMARY_ALL_LOG}$queryParams&timezone=${DateTime.now().timeZoneName}");
      print("${AppString.SUMMARY_ALL_LOG}$queryParams&timezone=${DateTime.now().timeZoneName}");
      print("Filtered log:: ${response.body.toString()}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return FilteredLogSummary.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<SuccessModel> requestAttendance(
      RequestAttendanceChangeReq attendanceChangeReq) async {
    try {
      Response response = await networkClient.postRequest(
          AppString.REQUEST_ATTENDANCE,
          json.encode(attendanceChangeReq.toJson()));
      print(" request attendance :::: ${response.body}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return SuccessModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}
