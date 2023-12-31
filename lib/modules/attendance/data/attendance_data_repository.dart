import 'dart:convert';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/domain/change_request/change_request_respose.dart';
import 'package:pay_day_mobile/modules/attendance/domain/check_entry_status/check_entry_status.dart';
import 'package:pay_day_mobile/modules/attendance/domain/daily_log/daily_log.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_details/log_details.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../../../common/domain/error_model.dart';
import '../../../common/domain/success_model.dart';
import '../domain/log_entry/log_entry_request.dart';
import '../domain/log_entry/log_entry_response.dart';
import 'package:http/http.dart' as http;

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
      http.Response response = await networkClient.getReq(
          "${Api.CHECK_PUNCH_IN}?timezone=${DateTime.now().timeZoneName}");

      if (response.statusCode != 200) {
        return Future.error(ErrorModel.fromJson(json.decode(response.body)));
      } else {
        return CheckEntryStatus.fromJson(json.decode(response.body));
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<DailyLog> getDailyLog() async {
    try {
      http.Response response = await networkClient
          .getReq("${Api.DAILY_LOG}?timezone=${DateTime.now().timeZoneName}");
      if (response.statusCode != 200) {
        return Future.error(ErrorModel.fromJson(json.decode(response.body)));
      } else {
        return DailyLog.fromJson(json.decode(response.body));
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LogDetails> getLogDetails(int logId) async {
    try {
      http.Response response = await networkClient.getReq(
          "${Api.LOG_DETAILS}/$logId?timezone=${DateTime.now().timeZoneName}");
      if (response.statusCode != 200) {
        return Future.error(ErrorModel.fromJson(json.decode(response.body)));
      } else {
        return LogDetails.fromJson(json.decode(response.body));
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<SuccessModel> changeAttendanceRequest(
      {required int logId,
      required String inTime,
      required String outTime,
      required String note}) async {
    try {
      Response response = await networkClient.postRequest(
          "${Api.ATTENDANCE_REQUEST}/$logId",
          {"in_time": inTime, "out_time": outTime, "note": note});
      print("in_time: $inTime, out_time: $outTime, note: $note");
      print(response.body.toString());
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return SuccessModel.fromJson(response.body);
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
