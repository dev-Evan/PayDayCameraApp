
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pay_day_mobile/modules/more/domain/change_password.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class ChangePassDataSource {
  final NetworkClient networkClient;

  ChangePassDataSource(this.networkClient);
  Future<ChangePasswordModel?> changePassIntoAccount( oldPassword,  password, confirmPassword) async {
    try {
      Response response = await networkClient.postRequest(
        AppString.USER_CHANGE_PASSWORD,
        {
          "old_password": oldPassword.toString(),
          "password": password.toString(),
          "password_confirmation":confirmPassword.toString(),
        },
      );
      if (response.status.hasError) {

        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("password change done");
        print(response.body.toString());
       return ChangePasswordModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}


