import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/modules/more/data/change_password_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class ChangePassController extends GetxController with StateMixin {
  final ChangePassDataSource changePassDataSource =
      ChangePassDataSource(NetworkClient());
  void changePassword() async {
    waitingLoader();
    try {
      await changePassDataSource
          .changePassIntoAccount(
      Get.find<CustomTextEditingController>().oldPassController.text,
        Get.find<CustomTextEditingController>(). passwordController.text,
        Get.find<CustomTextEditingController>(). confirmPasswordController.text,
      ).then((value) {
        GetStorage().remove(AppString.STORE_TOKEN);
        Get.back();
        showCustomSnackBar(message:AppString.text_password_update_successfully);
        Get.offNamed(AppString.signInScreen);
        Get.put(AuthController());
      }, onError: (error) {
        print(error.toString());
        Get.back();
        print(error.message);
        errorSnackBar(errorMessage: error.message);


      });
    } catch (ex) {
      Get.back();
      errorSnackBar(errorMessage: ex.toString());
    }
  }
}

