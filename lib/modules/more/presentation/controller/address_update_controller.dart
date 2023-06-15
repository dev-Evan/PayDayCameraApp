import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/address_update_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/address_details.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/utils.dart';


class AddressUpdateController extends GetxController with StateMixin {
  final AddressUpdateDataSource addressUpdateDataSource =
      AddressUpdateDataSource(NetworkClient());
  var newValue="";
  void addressUpdate({required typeKey,required context,
 required area,required city,required country,required details ,required phone, required state, required zipcode,required String message}) async {
    waitingLoader();
    try {
      await addressUpdateDataSource
          .getAddressUpdate(area,city,country,details,phone,state,typeKey, zipcode).then((value) {
        Get.find<AddressDetailsController>().getEmployeeAddressData();
        Get.back();
        _navigator(context: context);
        FutureDelayed(onAction: () => showCustomSnackBar(message: message));
        FutureDelayed(onAction: ()=>_fieldClear());
        newValue="value";
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
  Get.find<CustomTextEditingController>().addPhoneNumberController.clear();
  Get.find<CustomTextEditingController>().addAreaController.clear();
  Get.find<CustomTextEditingController>().addCityController.clear();
  Get.find<CustomTextEditingController>().addStateController.clear();
  Get.find<CustomTextEditingController>().addZipCodeController.clear();
  Get.find<CustomTextEditingController>().addDetailsController.clear();
  Get.find<CustomTextEditingController>().addCountyController.clear();
}
Future _navigator({context}){
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => AddressDetails(),
    ),
  );
}