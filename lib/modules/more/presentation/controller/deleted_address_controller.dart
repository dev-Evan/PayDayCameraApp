import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/deleted_address_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/deleted_address_model.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/address_details.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import 'address_details_controller.dart';

class DeletedAddController extends GetxController with StateMixin {
  final DeletedAddRepository deletedAddRepository =
      DeletedAddRepository(NetworkClient());
  DeletedAddressModel  deletedAddressModel=DeletedAddressModel();
  @override
  void onInit() async {
  await  Get.find<AddressDetailsController>().getEmployeeAddressData();
    super.onInit();
  }
  var newValue;
  void deletedAddressApi({required addressType, required context}) async {
    waitingLoader();
    try {
      await deletedAddRepository.deletedAddressRepo(addressType.toString())
          .then((value)  {
        Get.find<AddressDetailsController>().getEmployeeAddressData();
        Get.back();
        showCustomSnackBar(message: AppString.text_address_deleted_successfully);
        _navigator(context: context);
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
Future _navigator({context}){
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => AddressDetails(),
    ),
  );
}