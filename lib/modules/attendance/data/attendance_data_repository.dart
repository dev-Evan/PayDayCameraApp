import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/domain/change_log/change_log.dart';
import 'package:pay_day_mobile/modules/attendance/domain/change_request/change_request_respose.dart';
import 'package:pay_day_mobile/modules/attendance/domain/check_entry_status/check_entry_status.dart';
import 'package:pay_day_mobile/modules/attendance/domain/daily_log/daily_log.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_details/log_details.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../network/error_model.dart';
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
          AppString.PUNCH_IN, jsonEncode(punchInRequest));
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogEntryResponse.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<LogEntryResponse> punchOut(
      {required LogEntryRequest punchOutRequest}) async {
    try {
      Response response = await networkClient.postRequest(
          AppString.PUNCH_OUT, jsonEncode(punchOutRequest));
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogEntryResponse.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<CheckEntryStatus> checkEntryStatus() async {
    try {
      Response response =
          await networkClient.getRequest(AppString.CHECK_PUNCH_IN);

      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return CheckEntryStatus.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }

  Future<DailyLog> getDailyLog() async {
    try {
      Response response = await networkClient.getRequest(
          "${AppString.DAILY_LOG}?timezone=${DateTime.now().timeZoneName}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return DailyLog.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }

  Future<LogDetails> getLogDetails(int logId) async {
    try {
      Response response = await networkClient.getRequest(
          "${AppString.LOG_DETAILS}/$logId?timezone=${DateTime.now().timeZoneName}");
      print('res:::: ${response.body.toString()}');
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogDetails.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }

  Future<ChangeLog> changeLog(int logId) async {
    try {
      Response response = await networkClient.getRequest(AppString.LOG_DETAILS);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return ChangeLog.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }

  Future<ChangeRequestResponseModel> changeAttendanceRequest(
      int logId, ChangeRequestReqModel changeRequestReqModel) async {
    try {
      Response response = await networkClient.postRequest(
          AppString.ATTENDANCE_REQUEST, jsonEncode(changeRequestReqModel));
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return ChangeRequestResponseModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}
