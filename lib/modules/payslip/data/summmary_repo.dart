import 'dart:convert';

import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../../common/domain/error_model.dart';
import '../../../utils/app_string.dart';

class SummaryViewRepository {
  final NetworkClient networkClient;

  SummaryViewRepository(this.networkClient);

  Future<SummaryModel> getSummaryViewData() async {
    try {
      Response response =
      await networkClient.getRequest(AppString.PAYSLIP_SUMMARY);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return SummaryModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}


