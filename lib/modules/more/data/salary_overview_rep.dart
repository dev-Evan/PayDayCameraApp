import 'dart:convert';

import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../../utils/app_string.dart';
import '../domain/user_profile.dart';

class SalaryOverViewRepository {
  final NetworkClient networkClient;

  SalaryOverViewRepository(this.networkClient);

  Future<SalaryOverViewModel?> getSalaryOverViewData() async {
    try {
      Response response =
      await networkClient.getRequest(AppString.SALARY_OVERVIEW);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return SalaryOverViewModel.fromJson(response.body as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}


