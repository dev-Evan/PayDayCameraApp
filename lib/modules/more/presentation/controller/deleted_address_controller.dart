import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/modules/more/data/deleted_address_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DeletedAddController extends GetxController with StateMixin {
  final DeletedAddRepository deletedAddRepository = DeletedAddRepository(NetworkClient());
  void deletedAddressApi({required addressType}) async {
    waitingLoader();
    try {
      await deletedAddRepository
          .deletedAddressRepo(
        addressType.toString(),
      )
          .then((value) {
            Get.back();
        _successDialog();
        Get.find<AddressDetailsController>().getEmployeeAddressData();
      }, onError: (error) {
            Get.back();
      print(error.toString());
      });
    } catch (ex) {
      Get.back();
      errorSnackBar(errorMessage: ex.toString());
    }
    Get.back();
  }
}


Future _successDialog(){
  return CustomSuccessAlertDialog(
    context: Get.context,
    titleText: AppString.text_success,
    icon:Icons.check,
    iconColor: AppColor.successColor,
    iconBgColor: AppColor.successColor.withOpacity(0.2),
    contentText: AppString.text_deleted_address_successfully,
    popupAction: ()=>Future.delayed(Duration(seconds: 1),()=>Get.back()),
  );
}