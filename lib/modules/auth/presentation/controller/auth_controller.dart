import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_repository.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AuthController extends GetxController {
  final AuthDataSource _authDataSource = AuthDataSource(NetworkClient());

  final GetStorage box = GetStorage();

  login(String email, String password, context) async {
    Either<ErrorModel?, Login?> response =
        await _authDataSource.login(email: email, password: password);

    response.fold((error) {
      Fluttertoast.showToast(
          msg: "${error?.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.hintColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }, (login) {
      _writeUserInfo(login);
      Fluttertoast.showToast(
          msg: "${login?.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.hintColor,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.toNamed(AppString.home);
    });
  }

  void _writeUserInfo(Login? login) {
    box.write(AppString.idStore, login?.data!.id);
    box.write(AppString.USERNAME, login?.data!.firstName);
    box.write(AppString.ACCESS_TOKEN, login?.data!.token);
    box.write(AppString.loginCheckKey, AppString.loginValue);
  }
}
