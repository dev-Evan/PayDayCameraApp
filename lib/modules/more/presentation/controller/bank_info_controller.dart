import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_entry/log_entry_request.dart';
import 'package:pay_day_mobile/modules/more/data/bank_info_repository.dart';
import 'package:pay_day_mobile/modules/more/domain/bank_info_model.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_bank_info.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/logger.dart';
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

//get bank information here
  getBankInformation() async {
    change(null, status: RxStatus.loading());
    await moreDataRepository.bankInfoRepo().then((BankInfoModel value) {
      bankInfoModel = value;
      //store user id for deleted bank information
      _bankInfoAdded(value);
    }, onError: (error) {
      LoggerHelper.errorLog(message: error.message);
      errorChecker(error.message);
    });
    change(null, status: RxStatus.success());
  }

 //add bank information here
   Future<bool> addBankInformation({required context}) async {
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
      returnValue=true;
      //add bank information than input field clear
      clearData();
    }, onError: (error) {
      isLoading(false);
      returnValue=false;
      LoggerHelper.errorLog(message: error.message);
    });
     isLoading(false);
     return returnValue;
  }


//deleted bank information here
  Future<bool> deletedBankInformation() async {
    isLoading(true);
      await moreDataRepository.deletedBankInfoRepo().then((value) {
        deleteReturnValue=true;
        //deleted bank information than input field clear
        clearData();
      }, onError: (error) {
        isLoading(false);
        deleteReturnValue=false;
        LoggerHelper.errorLog(message: error.message);
      });
    isLoading(false);
    return deleteReturnValue;
  }

  void _bankInfoAdded(BankInfoModel? info) {
    box.write(AppString.BANK_USER_ID_STORE, info?.data!.id);
  }

//updated bank information here
  updateBankInformation({required context}) async {
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
      updatedBankInfoValue=true;
      //updated bank information than input field clear
      clearData();
    }, onError: (error) {
      isLoading(false);
      updatedBankInfoValue=false;
      showErrorMessage(errorMessage: error.message);
      LoggerHelper.errorLog(message: error.message);
    });
    isLoading(false);
    return updatedBankInfoValue;
  }
}