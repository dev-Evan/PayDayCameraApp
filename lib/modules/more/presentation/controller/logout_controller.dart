import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/modules/more/data/log_out_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/logout_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../routes/app_pages.dart';

class LogoutController extends GetxController with StateMixin {
  LogoutRepository logoutRepository=LogoutRepository(NetworkClient());
  final _box=GetStorage();
  LogoutModel  logoutModel =LogoutModel();
  logOut() async {
    waitingLoader();
    try {
      await logoutRepository.getLogoutRepoData().then((value) {
        logoutModel = value;
          _box.remove(AppString.STORE_TOKEN);
        Get.back();
        Get.offNamed(Routes.SIGN_IN);
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
Future waitingLoader(){
  return Get.dialog(Center(child: CircularProgressIndicator()));

}
