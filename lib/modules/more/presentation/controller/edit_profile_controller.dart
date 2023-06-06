import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/data/edit_profile_data_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/widget/custom_alert_dialog.dart';
import '../../../../common/widget/error_snackbar.dart';
import 'edit_profile_drop_dawon_cnt.dart';

class EditProfileDataController extends GetxController with StateMixin {
  final EditProfileDataSource editProfileDataSource =
      EditProfileDataSource(NetworkClient());

  final GetStorage box = GetStorage();
  void editProfileData({selectedDate}) async {
    waitingLoader();
    try {
      await editProfileDataSource
          .editProfileRepo(
        Get.find<CustomTextEditingController>().firstNameController.text,
        Get.find<CustomTextEditingController>().lastNameController.text,
        Get.find<CustomTextEditingController>().emailController.text,
        Get.find<CustomTextEditingController>().contactController.text,
        selectedDate.toString(),
        Get.find<DropdownBtnController>().dropdownValue.toString(),
        Get.find<CustomTextEditingController>().aboutMeController.text,
        Get.find<CustomTextEditingController>().addressController.text,
      )
          .then((value) {
        Get.back() ;Get.back() ;
        _successDialog(onAction: ()=> Get.back());
        Get.find<ProfileDataController>().getUserData();

      }, onError: (error) {
        print(error.toString());
        errorSnackBar(errorMessage: error.toString());
      });
    } catch (ex) {
      errorSnackBar(errorMessage: ex.toString());
    }


  }
}



Future _successDialog({required onAction}) {
  return CustomSuccessAlertDialog(
    context: Get.context,
    titleText: AppString.text_success,
    icon: Icons.check,
    iconColor: AppColor.successColor,
    iconBgColor: AppColor.successColor.withOpacity(0.2),
    contentText: AppString.text_profile_update_successfully,
    popupAction: () {
     onAction();
      Get.toNamed(AppString.profileView);
    },
  );
}
