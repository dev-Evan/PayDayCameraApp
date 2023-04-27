// interface implementation will be here

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AuthDataSource {
  final NetworkClient networkClient;

  AuthDataSource(this.networkClient);
  Future<Login> loginIntoAccount(String email, String password) async {
    try {
      Response response = await networkClient.postRequest(
        AppString.LOG_IN,
        {
          "email": email,
          "password": password,
        },
      );
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return Login.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}

