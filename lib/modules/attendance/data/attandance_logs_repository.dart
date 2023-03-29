import 'package:get/get.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../domain/log_summary/log_summary.dart';

class AttendanceLogsRepository {
  final NetworkClient networkClient;

  AttendanceLogsRepository(this.networkClient);

  Future<LogSummary> getLogSummaryByThisMonth() async {
    Response response =
        await networkClient.getRequest(AppString.LOG_SUMMARY_BY_THIS_MONTH);

    try {
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogSummary.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }

  Future<LogSummary> getLogSummaryByThisYear() async {
    Response response =
        await networkClient.getRequest(AppString.LOG_SUMMARY_BY_THIS_YEAR);

    try {
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return LogSummary.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}
