import 'dart:convert';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/domain/change_log/change_log.dart';
import 'package:pay_day_mobile/modules/attendance/domain/change_request/change_request_respose.dart';
import 'package:pay_day_mobile/modules/attendance/domain/check_entry_status/check_entry_status.dart';
import 'package:pay_day_mobile/modules/attendance/domain/daily_log/daily_log.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_details/log_details.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../../../common/domain/error_model.dart';
import '../../../common/domain/success_model.dart';
import '../domain/change_request/change_request_req_model.dart';
import '../domain/log_entry/log_entry_request.dart';
import '../domain/log_entry/log_entry_response.dart';

class AttendanceDataRepository {
  final NetworkClient networkClient;

  AttendanceDataRepository(this.networkClient);

  Future<LogEntryResponse> punchIn(
      {required LogEntryRequest punchInRequest}) async {
    try {
      Response response = await networkClient.postRequest(
          Api.PUNCH_IN, jsonEncode(punchInRequest));
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogEntryResponse.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }

  Future<LogEntryResponse> punchOut(
      {required LogEntryRequest punchOutRequest}) async {
    try {
      Response response = await networkClient.postRequest(
          Api.PUNCH_OUT, jsonEncode(punchOutRequest));
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogEntryResponse.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }

  Future<CheckEntryStatus> checkEntryStatus() async {
    try {
      Response response = await networkClient.getRequest(
          "${Api.CHECK_PUNCH_IN}?timezone=${DateTime.now().timeZoneName}");

      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return CheckEntryStatus.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<DailyLog> getDailyLog() async {
    try {
      Response response = await networkClient.getRequest(
          "${Api.DAILY_LOG}?timezone=${DateTime.now().timeZoneName}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return DailyLog.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LogDetails> getLogDetails(int logId) async {
    try {
      Response response = await networkClient.getRequest(
          "${Api.LOG_DETAILS}/$logId?timezone=${DateTime.now().timeZoneName}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogDetails.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<ChangeLog> changeLog(int logId) async {
    try {
      Response response = await networkClient.getRequest(Api.LOG_DETAILS);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return ChangeLog.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<ChangeRequestResponseModel> changeAttendanceRequest(
      {required int logId,
      required String inTime,
      required String outTime,
      required String note}) async {
    try {
      Response response = await networkClient.postRequest(
          "${Api.ATTENDANCE_REQUEST}/$logId",
          {"in_time": inTime, "out_time": outTime, "note": note});
      print(response.body);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return ChangeRequestResponseModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<SuccessModel> startBreak(int logId, int breakId) async {
    try {
      Response response = await networkClient
          .patchRequest("${Api.START_BREAK}/$logId", {"break_time": breakId});
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return SuccessModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<SuccessModel> endBreak(int logId, int breakId) async {
    try {
      Response response = await networkClient
          .patchRequest("${Api.END_BREAK}/$logId", {"break_time": breakId});
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return SuccessModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }
}
