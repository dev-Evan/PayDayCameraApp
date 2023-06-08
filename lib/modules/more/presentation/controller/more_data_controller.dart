import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/more_data_repository.dart';
import 'package:pay_day_mobile/modules/more/domain/bank_info_model.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/bank_details.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_bank_info.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class MoreDataController extends GetxController with StateMixin {
  final box = GetStorage();
  BankInfoModel bankInfoModel = BankInfoModel();
  MoreDataRepository moreDataRepository = MoreDataRepository(NetworkClient());
  CustomTextEditingController textEditingController =
      Get.put(CustomTextEditingController());

  getBankInfo() async {
    change(null, status: RxStatus.loading());
    await moreDataRepository.bankInfoRepo().then((value) {
      bankInfoModel = value;
      print(bankInfoModel.data?.accountTitle);
      print("Bank info called ::: $value");
      _bankInfo(value);
    }, onError: (error) {
      print("Bank info called:::$error");
      errorSnackBar(errorMessage: error.toString());
    });
    change(null, status: RxStatus.success());
  }

  addBankInfo({required context}) async {
    waitingLoader();
    await moreDataRepository.AddBankInfoRepo(
      textEditingController.bankNameController.text,
      textEditingController.bankCodeController.text,
      textEditingController.branchNameController.text,
      textEditingController.accountTitleController.text,
      textEditingController.accountHolderNameController.text,
      textEditingController.accountNumberController.text,
      textEditingController.taxPayerIdController.text,
    ).then((value) {
      print("Bank Info Added ::: $value");
      Get.back();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => BankDetails(),
        ),
      );
      getBankInfo();
      clearData();
    }, onError: (error) {
      Get.back();
      print("Add BankInfo ::: $error");
    });
  }
  var newValue="";
  void deletedBankInfoApi() async {
    waitingLoader();
    try {
      await moreDataRepository.deletedBankInfoRepo().then((value) {
        getBankInfo();
        showCustomSnackBar(message: AppString.text_bank_details_deleted_successfully);
        newValue="value";
        Get.back();
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

  void _bankInfo(BankInfoModel? info) {
    box.write(AppString.BANK_USER_ID_STORE, info?.data!.id);
  }

  updateBankInfo({required context}) async {
    waitingLoader();
    await moreDataRepository.UpdateBankInfoRepo(
      textEditingController.bankNameController.text,
      textEditingController.bankCodeController.text,
      textEditingController.branchNameController.text,
      textEditingController.accountTitleController.text,
      textEditingController.accountHolderNameController.text,
      textEditingController.accountNumberController.text,
      textEditingController.taxPayerIdController.text,
    ).then((value) {
      print("BANK INFO UPDATED ::: $value");
      Get.back();
      showCustomSnackBar(message: AppString.text_bank_details_update_successfully);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => BankDetails(),
        ),
      );
      getBankInfo();
      clearData();
    }, onError: (error) {
      Get.back();
      print("BANK INFO UPDATED ::: $error");
    });
  }

}
