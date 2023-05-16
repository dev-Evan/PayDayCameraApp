import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_repository.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AuthController extends GetxController with StateMixin{
  final AuthDataSource _authDataSource = AuthDataSource(NetworkClient());

  final GetStorage box = GetStorage();

  void logIn(String email, String password) {
    try {
      _authDataSource.loginIntoAccount(email, password).then((value) {
        print(value);
        _writeUserInfo(value);
        Get.offAllNamed(AppString.home);
      }, onError: (error) => _showToast(error.message));
    } catch (ex) {
      print(ex.toString());
      _showToast(ex.toString());
    }
    change(null,status: RxStatus.success());
  }

  void _writeUserInfo(Login? login ){
    box.write(AppString.ID_STORE, login?.data!.id);
    box.write(AppString.USERNAME, login?.data!.firstName);
    box.write(AppString.ACCESS_TOKEN, login?.data!.token);
    box.write(AppString.LOGIN_CHECK_KEY, AppString.LOGIN_VALUE);
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
