import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/address_update_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/utils.dart';

class AddressUpdateController extends GetxController with StateMixin {
  final AddressUpdateDataSource addressUpdateDataSource =
      AddressUpdateDataSource(NetworkClient());

  void addressUpdate({required typeKey, required selectedCounty}) async {
    waitingLoader();
    try {
      await addressUpdateDataSource.getAddressUpdate(
        Get.find<CustomTextEditingController>().areaController.value.text,
        Get.find<CustomTextEditingController>().cityController.value.text,
        selectedCounty.toString(),
        Get.find<CustomTextEditingController>().detailsController.value.text,
        Get.find<CustomTextEditingController>().phoneNumberController.value.text,
        Get.find<CustomTextEditingController>().stateController.value.text,
        typeKey.toString(),
        Get.find<CustomTextEditingController>().zipCodeController.value.text,
      ).then((value) {
        Get.find<AddressDetailsController>().getEmployeeAddressData();
        FutureDelayed(onAction: () => showCustomSnackBar(message: AppString.text_address_update_successfully));
        _fieldClear();

        print("Address update called ::: $value");



      }, onError: (error) {
            print("${error.message}");

        Get.back();
        errorSnackBar(errorMessage: error.toString());
      });
    } catch (ex) {
      Get.back();
      errorSnackBar(errorMessage: ex.toString());
    }
  }
}

_fieldClear() {
  Get.find<CustomTextEditingController>().phoneNumberController.clear();
  Get.find<CustomTextEditingController>().areaController.clear();
  Get.find<CustomTextEditingController>().cityController.clear();
  Get.find<CustomTextEditingController>().stateController.clear();
  Get.find<CustomTextEditingController>().zipCodeController.clear();
  Get.find<CustomTextEditingController>().detailsController.clear();
}
