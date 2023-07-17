import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/modules/more/data/log_out_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/logout_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../routes/app_pages.dart';

class LogoutController extends GetxController with StateMixin {
  LogoutRepository logoutRepository = LogoutRepository(NetworkClient());
  final _box = GetStorage();
  LogoutModel logoutModel = LogoutModel();
  logOut() async {
    _loadingIndicator();
    try {
      await logoutRepository.getLogoutRepoData().then((value) {
        logoutModel = value;
        _box.remove(AppString.STORE_TOKEN);
        _box.remove(AppString.REMEMBER_KEY);
        _box.remove(AppString.LOGIN_CHECK_KEY);
        Get.back();
        Get.offAllNamed(Routes.SIGN_IN);
        Get.put(AuthController());
      }, onError: (error) {
        print(error.message);
      });
    } catch (ex) {
      print(ex.toString());
    }
    change(null, status: RxStatus.success());
  }
}

Future waitingLoader() {
  return Get.dialog(const Center(child: LoadingIndicator()),
  barrierColor: AppColor.backgroundColor
  );
}
_loadingIndicator(){
  return  Get.dialog( Center(child: Platform.isIOS
      ? const CupertinoActivityIndicator(
    color: AppColor.primaryBlue,
  )
      : const CircularProgressIndicator(
    color: AppColor.primaryColor,
  ),));
}