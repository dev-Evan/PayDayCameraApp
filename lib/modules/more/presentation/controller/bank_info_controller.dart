import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/bank_info_repository.dart';
import 'package:pay_day_mobile/modules/more/domain/bank_info_model.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_bank_info.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/widget/error_alert_pop_up.dart';

class BankInfoController extends GetxController with StateMixin {
  final box = GetStorage();
  BankInfoModel bankInfoModel = BankInfoModel();
  var newValue="";
  MoreDataRepository moreDataRepository = MoreDataRepository(NetworkClient());
  InputTextFieldController textEditingController =
  Get.put(InputTextFieldController());

  getBankInfo() async {
    change(null, status: RxStatus.loading());
    await moreDataRepository.bankInfoRepo().then((value) {
      bankInfoModel = value;
      print(bankInfoModel.data?.accountTitle);
      print("Bank info called ::: $value");
      _bankInfo(value);
    }, onError: (error) {
      print("Bank info called:::$error");
      errorAlertPopup(getBankInfo);
    });
    change(null, status: RxStatus.success());
  }

   Future<bool> addBankInfo({required context}) async {
     bool returnValue=false;
    change(null, status: RxStatus.loading());
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
      returnValue=true;
      clearData();
    }, onError: (error) {
      returnValue=false;
      print("Add BankInfo ::: $error");
    });
    change(null, status: RxStatus.success());
    return returnValue;
  }

  void deletedBankInfoApi() async {
    waitingLoader();
    try {
      await moreDataRepository.deletedBankInfoRepo().then((value) {
        getBankInfo();
        showCustomSnackBar(message: AppString.text_bank_details_deleted_successfully);
        newValue="value";
        Get.back();
        clearData();
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
    bool updatedBankInfoValue=false;
    change(null, status: RxStatus.loading());

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
      updatedBankInfoValue=true;
      showCustomSnackBar(message: AppString.text_bank_details_update_successfully);
      clearData();
    }, onError: (error) {
      updatedBankInfoValue=false;
      errorSnackBar(errorMessage: error);
      print("BANK INFO UPDATED ::: $error");
    });
    change(null, status: RxStatus.success());
    return updatedBankInfoValue;
  }


}