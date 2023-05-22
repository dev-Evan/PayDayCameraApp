import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/modules/more/data/change_password_repo.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class ChangePassController extends GetxController with StateMixin {
  final ChangePassDataSource changePassDataSource =
      ChangePassDataSource(NetworkClient());
  final oldPassController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GetStorage box = GetStorage();
  void changePassword() async {
    change(null, status: RxStatus.loading());
    try {
      await changePassDataSource
          .changePassIntoAccount(
        oldPassController.text,
        passwordController.text,
        confirmPasswordController.text,
      )
          .then((value) {
        _successDialog();
      }, onError: (error) {
        print(error.toString());
        _showToast(error.toString());

      });
    } catch (ex) {
      _showToast(ex.toString());
    }
    change(null, status: RxStatus.success());
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

Future _successDialog(){
  return CustomSuccessAlertDialog(
    context: Get.context,
    titleText: AppString.text_success,
    icon:Icons.check,
    iconColor: AppColor.successColor,
    iconBgColor: AppColor.successColor.withOpacity(0.2),
    contentText: AppString.text_password_change_successfully,
    popupAction: ()=>Get.toNamed(AppString.profileView),
  );
}