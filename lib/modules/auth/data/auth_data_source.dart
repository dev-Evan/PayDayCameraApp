// interface implementation will be here

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
    Login login= Login.fromJson(response.body);
    print(login.message);
    return login;
  }
}
