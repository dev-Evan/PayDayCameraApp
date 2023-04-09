// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:pay_day_mobile/modules/auth/data/auth_data_repository.dart';
// import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
// import 'package:pay_day_mobile/modules/more/data/change_password_repo.dart';
// import 'package:pay_day_mobile/network/error_model.dart';
// import 'package:pay_day_mobile/network/network_client.dart';
// import 'package:pay_day_mobile/utils/app_color.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
//
// class ChangePassController extends GetxController  {
//   final ChangePassDataSource changePassDataSource =
//       ChangePassDataSource(NetworkClient());
//
//   final oldPassController = TextEditingController().obs;
//   final passwordController = TextEditingController().obs;
//   final confirmPasswordController = TextEditingController().obs;
//
//   final GetStorage box = GetStorage();
//
//   void changePass() async {
//     try {
//       await changePassDataSource
//           .changePassIntoAccount(
//               oldPassController.value.text,
//               passwordController.value.text,
//               confirmPasswordController.value.text)
//           .then((value) {
//         print(value.toString());
//       }, onError: (error) {
//         print("error");
//         //print(error.message.toString());
//       });
//     } catch (ex) {
//       print(ex.toString());
//     }
//   }
// }
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/common/custom_alert_dialog.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class ChangePassController extends GetxController {
  final oldPassController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  var baseUrl = AppString.BASE_URL + AppString.USER_CHANGE_PASSWORD;
  final _connect = http.Client();
  RxBool loading = false.obs;
  void changePassword() async {
    loading.value = true;
    try {
      final body = {
        "old_password": oldPassController.value.text,
        "password": passwordController.value.text,
        "password_confirmation": confirmPasswordController.value.text,
      };
      final headers = {
        "Content-type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer 40|MOhcg9DoLwGRppa5RYCmEv9BARvBWBJU7C4sr5Iv',
      };
      final response = await _connect.post(
        Uri.parse(baseUrl),
        body: jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        _successDialog();
        print(response.body);
      }
    } catch (error) {
      print(error);
    }
  }
}

Future _successDialog(){
  return  CustomSuccessAlertDialog(
    titleText: AppString.text_success,
    icon: Icons.published_with_changes,
    iconBgColor: AppColor.successColor.withOpacity(0.2),
    iconColor: AppColor.successColor,
    contentText: AppString.text_password_change_successfully,
    context: Get.context,
  );
}