import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/edit_profile_data_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/date_of_birth_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/profile_container_layout.dart';
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
  void editProfileData({selectedDate,required context}) async {
    waitingLoader();
    try {
      await editProfileDataSource
          .editProfileRepo(
        Get.find<CustomTextEditingController>().firstNameController.text,
        Get.find<CustomTextEditingController>().lastNameController.text,
        Get.find<CustomTextEditingController>().emailController.text,
        Get.find<CustomTextEditingController>().contactController.text,
        Get.find<DatePickerController>().dobDateController.value.text,
        Get.find<DropdownBtnController>().value.toString(),
        Get.find<CustomTextEditingController>().aboutMeController.text,
        Get.find<CustomTextEditingController>().addressController.text,
      )
          .then((value) {
        Get.back() ;
        Get.find<ProfileDataController>().getUserData();
        navigatorForViewProfile(context: context);
        showCustomSnackBar(message: AppString.text_profile_update_successfully);

      }, onError: (error) {
        Get.back() ;
        errorSnackBar(errorMessage: error.message);
      });
    } catch (ex) {
      Get.back() ;
      errorSnackBar(errorMessage: ex.toString());
    }


  }
}


