// interface implementation will be here

import 'dart:convert';

import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_interface.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AuthDataSource implements AuthDataInterface {
  final NetworkClient networkClient;

  AuthDataSource(this.networkClient);

  @override
  Future<Login> login({required String email, required String password}) async {
    Response response = await networkClient.postRequest(
      AppString.logIn,
      {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode != 200) throw Exception("Server Error");
    Login login = json.decode(response.body);
    return login;
  }
}
