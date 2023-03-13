import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_source.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../network/error_model.dart';

class AuthController extends GetxController {

  final AuthDataSource _authDataSource = AuthDataSource(NetworkClient());

  final box = GetStorage();
  final _idStore = AppString.idStore;

  login(String email, String password) async {
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
      var storeId = login?.data!.id.toString();
      box.write(_idStore, storeId);
      Fluttertoast.showToast(
          msg: "${login?.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.hintColor,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
