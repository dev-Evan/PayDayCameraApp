import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_interface.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AuthController extends GetxController {
  AuthDataInterface _authDataInterface = Get.find<AuthDataInterface>();

  final box = GetStorage();
  final _idStore = AppString.idStore;






  login(String email, String password) async {
    Login _login =
        await _authDataInterface.login(email: email, password: password);
    print(_login.message.toString());










    if (_login.status == true) {
      print(_login.status.toString());
      print(_login.message.toString());

      var storeId = _login.data!.id.toString();
      box.write(_idStore, storeId);
      // Get.toNamed(attendLog);
      Fluttertoast.showToast(
          msg: "${_login.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.hintColor,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "${_login.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.errorColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
