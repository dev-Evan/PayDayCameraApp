import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/custom_alert_dialog.dart';
import 'package:pay_day_mobile/modules/more/data/edit_profile_data_repo.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'edit_profile_drop_dawon_cnt.dart';

class EditProfileDataController extends GetxController with StateMixin {
  final EditProfileDataSource editProfileDataSource =
  EditProfileDataSource(NetworkClient());

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final contactController = TextEditingController().obs;
  final dobController = TextEditingController().obs;
  final genderController = TextEditingController().obs;
  final aboutMeController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  DropdownBtnController dropdownBtnController =Get.put(DropdownBtnController());

  final GetStorage box = GetStorage();
  void editProfileData({selectedDate}) async {
    change(null, status: RxStatus.loading());
    try {
      await editProfileDataSource
          .editProfileRepo(
        firstNameController.value.text,
        lastNameController.value.text,
        emailController.value.text,
        contactController.value.text,
        selectedDate.toString(),
        dropdownBtnController.dropdownValue.value.toString(),
        aboutMeController.value.text,
        addressController.value.text,
      )
          .then((value) {
        _successDialog();
      }, onError: (error) {
        print(error.toString());
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