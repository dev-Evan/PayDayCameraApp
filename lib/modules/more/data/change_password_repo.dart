import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/more/domain/change_password.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class ChangePassDataSource {
  final NetworkClient networkClient;
  ChangePassDataSource(this.networkClient);
  Future<ChangePasswordModel> changePassIntoAccount(String oldPassword,String password,String confirmPassword) async {
    try {
      Response  response = await networkClient.postRequest(
        AppString.USER_CHANGE_PASSWORD,
        {
          "old_password":oldPassword,
          "password":password,
          "password_confirmation":confirmPassword
        },
      );
      print(response.body.toString());
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body.toString());
        return ChangePasswordModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }
}

