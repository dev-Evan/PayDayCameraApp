// interface implementation will be here
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/auth/domain/reset_password_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';

class AuthDataSource {

  final NetworkClient networkClient;
  AuthDataSource(this.networkClient);

  Future<Login> loginIntoAccount(String email, String password) async {
    try {
      Response response = await networkClient.postRequest(
        Api.LOG_IN,
        {
          "email": email,
          "password": password,
        },
      );
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Auth ::: ${response.body}");
        return Login.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }


  Future<ResetPasswordModel> restPasswordRepo() async {
    try {
      Response response =
      await networkClient.getRequest(Api.RESET_PASSWORD);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return ResetPasswordModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }





}

