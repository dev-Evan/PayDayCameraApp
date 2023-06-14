import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_repository.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/modules/auth/domain/reset_password_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../routes/app_pages.dart';

class AuthController extends GetxController with StateMixin {
  final AuthDataSource _authDataSource = AuthDataSource(NetworkClient());
  ResetPasswordModel resetPasswordModel = ResetPasswordModel();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final GetStorage box = GetStorage();
  @override
  void onInit() {
    restPassword();
    super.onInit();
  }

  void logIn() {
    Get.dialog(Center(child: CircularProgressIndicator()));
    try {
      _authDataSource.loginIntoAccount(emailController.text, passwordController.text)
          .then((value) {
        print(value);
        _writeUserInfo(value);
        Get.back();
        Get.offAllNamed(Routes.HOME);
      }, onError: (error) {
        Get.back();
        showCustomSnackBar( message: error.message);
      });
    } catch (ex) {
      print(ex.toString());
    }
  }

  void _writeUserInfo(Login? login) {
    box.write(AppString.ID_STORE, login?.data!.id);
    box.write(AppString.USER_NAME, login?.data!.fullName);
    box.write(AppString.ACCESS_TOKEN, login?.data!.token);
    box.write(AppString.LOGIN_CHECK_KEY, AppString.LOGIN_VALUE);
    box.write(AppString.STORE_CURRENT_PASSWORD, passwordController.text);
    box.write(AppString.STORE_CURRENT_EMAIL, emailController.text);
    print(box.read(AppString.STORE_CURRENT_EMAIL));
  }


  void restPassword() async {
    change(null, status: RxStatus.loading());
    try {
      await _authDataSource.restPasswordRepo().then((value) {
        print(value);
        resetPasswordModel = value;
      }, onError: (error) {
        print(error.message);
      });
      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }
}
