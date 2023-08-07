import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/data/bank_info_repository.dart';
import 'package:pay_day_mobile/modules/more/domain/bank_info_model.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_bank_info.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/widget/error_message.dart';
import '../../../../utils/exception_handler.dart';

class BankInfoController extends GetxController with StateMixin {
  final box = GetStorage();
  bool deleteReturnValue=false;
  final isLoading = false.obs;
  BankInfoModel bankInfoModel = BankInfoModel();
  BankInfoRepository moreDataRepository = BankInfoRepository(NetworkClient());
  InputTextFieldController textEditingController =
  Get.put(InputTextFieldController());

  getBankInfo() async {
    change(null, status: RxStatus.loading());
    await moreDataRepository.bankInfoRepo().then((BankInfoModel value) {
      bankInfoModel = value;
      _bankInfo(value);
    }, onError: (error) {
      errorChecker(error.message);
    });
    change(null, status: RxStatus.success());
  }

   Future<bool> addBankInfo({required context}) async {
     bool returnValue=false;
     isLoading(true);
    await moreDataRepository.addBankInfoRepo(
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
      isLoading(false);
      returnValue=false;
    });
     isLoading(false);
     return returnValue;
  }



  Future<bool> deletedBankInfoApi() async {
    isLoading(true);
      await moreDataRepository.deletedBankInfoRepo().then((value) {
        deleteReturnValue=true;
        clearData();
      }, onError: (error) {
        isLoading(false);
        deleteReturnValue=false;
        print("Bank info ::: $error");
      });
    isLoading(false);
    return deleteReturnValue;
  }

  void _bankInfo(BankInfoModel? info) {
    box.write(AppString.BANK_USER_ID_STORE, info?.data!.id);
  }

  updateBankInfo({required context}) async {
    bool updatedBankInfoValue=false;
    isLoading(true);
    await moreDataRepository.updateBankInfoRepo(
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
      clearData();
    }, onError: (error) {
      isLoading(false);
      updatedBankInfoValue=false;
      showErrorMessage(errorMessage: error.message);
    });
    isLoading(false);
    return updatedBankInfoValue;
  }
}