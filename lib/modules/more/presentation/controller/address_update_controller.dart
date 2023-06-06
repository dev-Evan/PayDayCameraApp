import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/data/address_update_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

class AddressUpdateController extends GetxController with StateMixin {
  final AddressUpdateDataSource addressUpdateDataSource =
      AddressUpdateDataSource(NetworkClient());

  void addressUpdate({required typeKey, required selectedCounty}) async {
    waitingLoader();
    try {
      await addressUpdateDataSource
          .getAddressUpdate(
        Get.find<CustomTextEditingController>().areaController.value.text,
        Get.find<CustomTextEditingController>().cityController.value.text,
        selectedCounty.toString(),
        Get.find<CustomTextEditingController>().detailsController.value.text,
        Get.find<CustomTextEditingController>()
            .phoneNumberController
            .value
            .text,
        Get.find<CustomTextEditingController>().stateController.value.text,
        typeKey.toString(),
        Get.find<CustomTextEditingController>().zipCodeController.value.text,
      )
          .then((value) {
        Get.back();
        Get.back();
        Get.find<AddressDetailsController>().getEmployeeAddressData();
        _showToast(value.message);
        _fieldClear();

        print("Address update called ::: $value");
      }, onError: (error) {
        Get.back();

        _showToast(error.message);
      });
    } catch (ex) {
      Get.back();
      _showToast(ex.toString());
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
}

_fieldClear() {
  Get.find<CustomTextEditingController>().phoneNumberController.clear();
  Get.find<CustomTextEditingController>().areaController.clear();
  Get.find<CustomTextEditingController>().cityController.clear();
  Get.find<CustomTextEditingController>().stateController.clear();
  Get.find<CustomTextEditingController>().zipCodeController.clear();
  Get.find<CustomTextEditingController>().detailsController.clear();
}
