import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_repository.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AuthController extends GetxController {
  final AuthDataSource _authDataSource = AuthDataSource(NetworkClient());

  final GetStorage box = GetStorage();

  void _writeUserInfo(Login? login) async {
    await box.write(AppString.idStore, login?.data!.id);
    await box.write(AppString.USERNAME, login?.data!.firstName);
    await box.write(AppString.ACCESS_TOKEN, login?.data!.token);
    await box.write(AppString.loginCheckKey, AppString.loginValue);
    print(
        "${box.read(AppString.idStore)}::${box.read(AppString.USERNAME)}::${box.read(AppString.ACCESS_TOKEN)}::${box.read(AppString.loginCheckKey)}");
  }

  void logIn(String email, String password) {
    try {
      _authDataSource.loginIntoAccount(email, password).then((value) {
        print(value);
        _writeUserInfo(value);
        Get.toNamed(AppString.home);
      }, onError: (error) => _showToast(error.message));
    } catch (ex) {
      _showToast(ex.toString());
    }
  }

  _showToast(message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.hintColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
