import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/data/address_update_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

class AddressUpdateController extends GetxController with StateMixin {
  final AddressUpdateDataSource addressUpdateDataSource = AddressUpdateDataSource(NetworkClient());
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final countyController = TextEditingController();
  final detailsController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final stateController = TextEditingController();
  final typeController = TextEditingController();
  final zipCodeController = TextEditingController();

  void addressUpdate({required typeKey, required selectedCounty}) async {
    change(null, status: RxStatus.loading());
    try {
      await addressUpdateDataSource
          .getAddressUpdate(
        areaController.value.text,
        cityController.value.text,
        selectedCounty.toString(),
        detailsController.value.text,
        phoneNumberController.value.text,
        stateController.value.text,
        typeKey.toString(),
        zipCodeController.value.text,
      )
          .then((value) {
        Get.back();
        Get.find<AddressDetailsController>().getEmployeeAddressData();
        _showToast(value.message);
        _fieldClear();
        print("Address update called ::: $value");
      }, onError: (error) => _showToast(error.message));
    } catch (ex) {

      _showToast(ex.toString());
    }
    change(null, status: RxStatus.success());
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

_fieldClear(){
  Get.find<AddressUpdateController>()
      .phoneNumberController.clear();
  Get.find<AddressUpdateController>()
      .areaController.clear();
  Get.find<AddressUpdateController>()
      .cityController.clear();
  Get.find<AddressUpdateController>()
      .stateController.clear();
  Get.find<AddressUpdateController>()
      .zipCodeController.clear();
  Get.find<AddressUpdateController>()
      .detailsController.clear();
}