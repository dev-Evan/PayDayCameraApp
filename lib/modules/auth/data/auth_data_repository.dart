// interface implementation will be here

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AuthDataSource {
  final NetworkClient networkClient;

  AuthDataSource(this.networkClient);

  Future<Either<ErrorModel, Login>> login({required String email, required String password}) async {
    Response response = await networkClient.postRequest(
      AppString.LOG_IN,
      {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      return right(Login.fromJson(response.body));
    } else {
      return left(ErrorModel.fromJson(response.body));
    }
  }
}


