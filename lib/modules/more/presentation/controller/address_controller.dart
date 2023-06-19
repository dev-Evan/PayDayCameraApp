import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/address_repo_data.dart';
import 'package:pay_day_mobile/modules/more/domain/deleted_address_model.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/address_details.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/utils.dart';
import '../../../../network/network_client.dart';
import '../../domain/address_details_model.dart';
import 'common_controller/more_text_editing_controller.dart';

class AddressController extends GetxController with StateMixin {
  AddressDetailsModel addressDetailsModel = AddressDetailsModel();
  DeletedAddressModel  deletedAddressModel=DeletedAddressModel();
  AddressRepository addressRepository = AddressRepository(NetworkClient());
  var newValue = "";


  getEmployeeAddressData() async {
    change(null, status: RxStatus.loading());
    await addressRepository.getAddressDetailsData().then((value) {
      print("Address details called ::: $value");
      addressDetailsModel = value;
    }, onError: (error) {
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }


  void addressUpdate({required typeKey, required context, required area, required city, required country, required details, required phone, required state, required zipcode, required String message}) async {
    waitingLoader();
    try {
      await addressRepository
          .getAddressUpdate(
              area, city, country, details, phone, state, typeKey, zipcode)
          .then((value) {
        getEmployeeAddressData();
        Get.back();
        FutureDelayed(onAction: () => showCustomSnackBar(message: message));
        FutureDelayed(onAction: () => _fieldClear());
        newValue = "value";
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





  void deletedAddressApi({required addressType, required context}) async {
    waitingLoader();
    try {
      await addressRepository.deletedAddressRepo(addressType.toString())
          .then((DeletedAddressModel value) async {
        await getEmployeeAddressData();
        Get.back();
        _navigator(context: context);
        showCustomSnackBar(message: AppString.text_address_deleted_successfully);
      }, onError: (error) {
        Get.back();
        print("Deleted Address ::: ${error.toString()}");
      });
    } catch (ex) {
      Get.back();
      print("Deleted Address ex ::: ${ex.toString()}");
      errorSnackBar(errorMessage: ex.toString());
    }
    Get.back();
  }


}

_fieldClear() {
  Get.find<InputTextFieldController>().addPhoneNumberController.clear();
  Get.find<InputTextFieldController>().addAreaController.clear();
  Get.find<InputTextFieldController>().addCityController.clear();
  Get.find<InputTextFieldController>().addStateController.clear();
  Get.find<InputTextFieldController>().addZipCodeController.clear();
  Get.find<InputTextFieldController>().addDetailsController.clear();
  Get.find<InputTextFieldController>().addCountyController.clear();
}

Future _navigator({context}) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => AddressDetails(),
    ),
  );
}
