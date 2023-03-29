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

  Future<Either<ErrorModel, LogEntryResponse>> punchIn(
      {required LogEntryRequest punchInRequest}) async {
    Response response = await networkClient.postRequest(
        AppString.PUNCH_IN, jsonEncode(punchInRequest));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(LogEntryResponse.fromJson(response.body));
      return right(LogEntryResponse.fromJson(response.body));
    } else {
      print(ErrorModel.fromJson(response.body));
      return left(ErrorModel.fromJson(response.body));
    }
  }

  Future<Either<ErrorModel, LogEntryResponse>> punchOut(
      {required LogEntryRequest punchOutRequest}) async {
    Response response = await networkClient.postRequest(
        AppString.PUNCH_OUT, jsonEncode(punchOutRequest));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(LogEntryResponse.fromJson(response.body));
      return right(LogEntryResponse.fromJson(response.body));
    } else {
      print(ErrorModel.fromJson(response.body));
      return left(ErrorModel.fromJson(response.body));
    }
  }

  Future<Either<ErrorModel, CheckEntryStatus>?> checkEntryStatus() async {
    Response response =
        await networkClient.getRequest(AppString.CHECK_PUNCH_IN);
    print(response.statusCode);
    if (response.body != null) {
      if (response.statusCode == 200) {
        print(CheckEntryStatus.fromJson(response.    body));
        return right(CheckEntryStatus.fromJson(response.body));
      } else {
        print(ErrorModel.fromJson(response.body));
        return left(ErrorModel.fromJson(response.body));
      }
    }
    return null;
  }

  Future<Either<ErrorModel, DailyLog>> getDailyLog() async {
    Response response =
        await networkClient.getRequest(AppString.DAILY_LOG);
    print("DailyLogs::: ${response.body.toString()}");
    if (response.statusCode == 200) {
      print(DailyLog.fromJson(response.body));
      return right(DailyLog.fromJson(response.body));
    } else {
      print(ErrorModel.fromJson(response.body));
      return left(ErrorModel.fromJson(response.body));
    }
  }

  Future<Either<ErrorModel, LogDetails>> getLogDetails(int logId) async {
    Response response = await networkClient.getRequest(AppString.LOG_DETAILS);
    if (response.statusCode == 200) {
      return right(LogDetails.fromJson(response.body));
    } else {
      return left(ErrorModel.fromJson(response.body));
    }
  }

  Future<Either<ErrorModel, ChangeLog>> changeLog(int logId) async {
    Response response = await networkClient.getRequest(AppString.LOG_DETAILS);
    if (response.statusCode == 200) {
      return right(ChangeLog.fromJson(response.body));
    } else {
      return left(ErrorModel.fromJson(response.body));
    }
  }

  Future<Either<ErrorModel, ChangeRequestResponseModel>>
      changeAttendanceRequest(
          int logId, ChangeRequestReqModel changeRequestReqModel) async {
    Response response = await networkClient.postRequest(
        AppString.ATTENDANCE_REQUEST, jsonEncode(changeRequestReqModel));
    if (response.statusCode == 200) {
      return right(ChangeRequestResponseModel.fromJson(response.body));
    } else {
      return left(ErrorModel.fromJson(response.body));
    }
  }
}
