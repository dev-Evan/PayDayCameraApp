import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/data/address_update_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';


class AddressUpdateController extends GetxController with StateMixin {
  final AddressUpdateDataSource addressUpdateDataSource =
      AddressUpdateDataSource(NetworkClient());
  AddressDetailsController addressDetailsController =Get.put(AddressDetailsController());

  final areaController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final countyController = TextEditingController().obs;
  final detailsController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final typeController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;



  void addressUpdate({required typeKey,required selectedCounty}) async {
    change(null, status: RxStatus.loading());
    try {
      await addressUpdateDataSource
          .getAddressUpdate(areaController.value.text, cityController.value.text, selectedCounty.toString(), detailsController.value.text, phoneNumberController.value.text, stateController.value.text, typeKey.toString(),
        zipCodeController.value.text,
      )
          .then((value) {
         Get.back();
         addressDetailsController.getEmployeeAddressData();
        _showToast(value.message);

        print("Address update ::: update done");
      }, onError: (error) => _showToast(error.message));
    } catch (ex) {
      print(ex.toString());
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

