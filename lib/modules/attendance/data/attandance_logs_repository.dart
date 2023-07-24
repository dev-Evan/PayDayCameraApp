import 'dart:convert';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/domain/request_attendance/request_attendance.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../../../common/domain/success_model.dart';
import '../domain/all_log_summary/all_log_summay.dart';
import '../domain/log_summary/log_summary.dart';
import '../domain/log_summary/log_summary_overview.dart';
import 'package:http/http.dart' as http;

class AttendanceLogsRepository {
  final NetworkClient networkClient;

  AttendanceLogsRepository(this.networkClient);

  Future<LogSummary> getLogSummaryByThisMonth() async {
    try {
      http.Response response =
          await networkClient.getReq(Api.LOG_SUMMARY_BY_THIS_MONTH);
      if (response.statusCode!=200) {
        return Future.error(ErrorModel.fromJson(json.decode(response.body)));
      } else {
        return LogSummary.fromJson(json.decode(response.body));
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LogSummary> getLogSummaryByThisYear() async {
    try {
      http.Response response =
          await networkClient.getReq(Api.LOG_SUMMARY_BY_THIS_YEAR);
      if (response.statusCode!=200) {
        return Future.error(ErrorModel.fromJson(json.decode(response.body)));
      } else {
        return LogSummary.fromJson(json.decode(response.body));
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LogSummaryOverview> getLogSummaryOverview(
      {String? queryParams}) async {
    queryParams ??= "within=thisMonth";
    try {
      http.Response response = await networkClient
          .getReq("${Api.DETAILS_SUMMARY}$queryParams");
      if (response.statusCode!=200) {
        return Future.error(ErrorModel.fromJson(json.decode(response.body)));
      } else {
        return LogSummaryOverview.fromJson(json.decode(response.body));
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<FilteredLogSummary> getAllFilteredLogs(
      {required String queryParams, int? page = 1}) async {
    try {
      http.Response response = await networkClient.getReq(
          "${Api.SUMMARY_ALL_LOG}$queryParams&timezone=${DateTime.now().timeZoneName}&per_page=10&page=$page");
      if (response.statusCode!=200) {
        return Future.error(ErrorModel.fromJson(json.decode(response.body)));
      } else {
        return FilteredLogSummary.fromJson(json.decode(response.body));
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<SuccessModel> requestAttendance(
      RequestAttendanceChangeReq attendanceChangeReq) async {
    try {
      Response response = await networkClient.postRequest(
          Api.REQUEST_ATTENDANCE,
          json.encode(attendanceChangeReq.toJson()));
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
