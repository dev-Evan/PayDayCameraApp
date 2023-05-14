import 'dart:io';

import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/common/domain/success_model.dart';
import 'package:pay_day_mobile/modules/leave/domain/individual_date_leave.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_allowance.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_details.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_summary.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_type.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../domain/leave_record.dart';

class LeaveRepository {
  final NetworkClient networkClient;

  LeaveRepository(this.networkClient);

  Future<LeaveAllowance> getLeaveAllowance() async {
    try {
      Response response =
          await networkClient.getRequest(AppString.LEAVE_ALLOWANCE);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LeaveAllowance.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LeaveSummary> getLeaveSummary() async {
    try {
      Response response =
          await networkClient.getRequest(AppString.LEAVE_SUMMARY);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LeaveSummary.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LeaveRecord> getLeaveRecord(String params) async {
    try {
      Response response =
          await networkClient.getRequest("${AppString.LEAVE_RECORD}$params");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LeaveRecord.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LeaveType> getLeaveType() async {
    try {
      Response response = await networkClient.getRequest(AppString.LEAVE_TYPE);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LeaveType.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<IndividualDateLeave> getIndividualDateLeave(
      {required String queryParams}) async {
    try {
      Response response = await networkClient
          .getRequest("${AppString.INDIVIDUAL_DATE_LEAVE}?$queryParams");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return IndividualDateLeave.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<LeaveDetails> getLeaveDetails({required int id}) async {
    try {
      Response response = await networkClient.getRequest(
          "${AppString.LEAVE_DETAILS}/$id?timezone=${DateTime.now().toUtc().timeZoneName}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LeaveDetails.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<SuccessModel> cancelLeave({required int id}) async {
    try {
      Response response = await networkClient
          .postRequest(AppString.CANCEL_LEAVE, {"leave_id": id});
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return SuccessModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  requestLeave({required Map<dynamic, dynamic> leaveQueries}) async {
    final formData = FormData({});

    leaveQueries.forEach((key, value) {
      if (key == "attachments[]") {
        formData.files.add(MapEntry(
            key,
            MultipartFile(File(value),
                filename:
                    "${DateTime.now().toUtc().microsecondsSinceEpoch}.${value.split(".").last}")));
      } else {
        formData.fields.add(MapEntry(key, value));
      }
    });
    print("${leaveQueries.keys}:::${leaveQueries.values}");
    // try {
    //   Response response =
    //       await networkClient.postRequest(AppString.REQUEST_LEAVE, formData);
    //   print(response.body);
    //   if (response.status.hasError) {
    //     return Future.error(ErrorModel.fromJson(response.body));
    //   } else {
    //     return SuccessModel.fromJson(response.body);
    //   }
    // } catch (ex) {
    //   return Future.error(ErrorModel(message: ex.toString()));
    // }
  }
}
