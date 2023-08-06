import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/utils/exception_handler.dart';
import 'package:pay_day_mobile/common/widget/error_message.dart';
import 'package:pay_day_mobile/common/widget/warning_message.dart';
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
  final RxBool isLoading = false.obs;
  final GetStorage box = GetStorage();

  @override
  void onInit() {
    restPassword();
    super.onInit();
  }

   logIn() {
    isLoading.value = true;
      _authDataSource.loginIntoAccount(emailController.text, passwordController.text).then((value) {
       _writeUserInfo(value);
        isLoading.value = false;
       Get.offAllNamed(Routes.HOME);
      }, onError: (error) {
        isLoading.value = false;
        ExceptionHandler().errorChecker(error);
      });
  }

  void _writeUserInfo(Login? login) {
    box.write(AppString.ID_STORE, login?.data!.id);
    box.write(AppString.USER_NAME, login?.data!.fullName);
    box.write(AppString.ACCESS_TOKEN, login?.data!.token);
    box.write(AppString.LOGIN_CHECK_KEY, AppString.LOGIN_VALUE);
    box.write(AppString.STORE_CURRENT_PASSWORD, passwordController.text);
    box.write(AppString.STORE_CURRENT_EMAIL, emailController.text);
  }


  void restPassword() async {
    change(null, status: RxStatus.loading());
      await _authDataSource.restPasswordRepo().then((value) {
        print("Rest password ::: $value");
        resetPasswordModel = value;
      }, onError: (error) {
        print("Rest password ::: ${error.message}");
      });
      change(null, status: RxStatus.success());
  }
}

