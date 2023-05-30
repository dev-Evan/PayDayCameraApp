

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/data/edit_profile_data_repo.dart';
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

  final TextEditingController firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final aboutMeController = TextEditingController();
  final addressController = TextEditingController();

  final GetStorage box = GetStorage();
  void editProfileData({selectedDate}) async {
    change(null, status: RxStatus.loading());
    try {
      await editProfileDataSource
          .editProfileRepo(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        contactController.text,
        selectedDate.toString(),
        Get.find<DropdownBtnController>().dropdownValue.toString(),
        aboutMeController.text,
        addressController.text,
      )
          .then((value) {
        Get.find<ProfileDataController>().getUserData();
        _successDialog();
      }, onError: (error) {
        print(error.toString());
        errorSnackBar(errorMessage: error.toString());

      });
    } catch (ex) {
      errorSnackBar(errorMessage: ex.toString());
      //_showToast(ex.toString());
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
    popupAction: (){
    Get.back();
      Get.toNamed(AppString.profileView);
    },
  );
}