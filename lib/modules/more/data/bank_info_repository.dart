import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/more/domain/add_bank_info_model.dart';
import 'package:pay_day_mobile/modules/more/domain/bank_info_deleted_model.dart';
import 'package:pay_day_mobile/modules/more/domain/bank_info_model.dart';
import 'package:pay_day_mobile/modules/more/domain/bank_info_updated_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class BankInfoRepository {
  NetworkClient networkClient;
  BankInfoRepository(this.networkClient);
  final box=GetStorage();

  Future<BankInfoModel> bankInfoRepo() async {
    try {
      Response response = await networkClient.getRequest(Api.EMPLOYEE_BANK_INFORMATION);

      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("BankInfo Called ::: ${response.body}");
        return BankInfoModel.fromJson(response.body);
      }
    } catch (ex) {
      print("Bank info ::: $ex");
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }

  Future<AddBankInfoModel> addBankInfoRepo(String bankName, String code, String branchName, String accountTitle, String accountHolderName, String accountNumber, String taxPayerId,
      ) async {
    try {
      Response response = await networkClient.postRequest(
        Api.EMPLOYEE_BANK_INFORMATION,
        {
          "key": "bank_details",
          "name": bankName,
          "code": code,
          "branch_name": branchName,
          "account_title": accountTitle,
          "account_holder_name": accountHolderName,
          "account_number": accountNumber,
          "tax_payer_id": taxPayerId,
        },
      );
      print(response.body.toString());
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Bank info added ::: ${response.body.toString()}");
        return AddBankInfoModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }

  Future<AddBankInfoDeletedModel> deletedBankInfoRepo() async {
    try {
      Response  response = await networkClient.deletedRequest(
        "${Api.EMPLOYEE_BANK_INFORMATION}/${box.read(AppString.ID_STORE)}?contact_id=${box.read(AppString.BANK_USER_ID_STORE)}");
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Deleted BankInfo Called ::: ${response.body}");
        return AddBankInfoDeletedModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }

  Future<BankInfoUpdated> updateBankInfoRepo(String bankName, String code, String branchName, String accountTitle, String accountHolderName, String accountNumber, String taxPayerId,
      ) async {
    try {
      Response response = await networkClient.patchRequest(
        "${Api.EMPLOYEE_BANK_INFORMATION}/${box.read(AppString.BANK_USER_ID_STORE)}",
        {
          "key": "bank_details",
          "name": bankName,
          "code": code,
          "branch_name": branchName,
          "account_title": accountTitle,
          "account_holder_name": accountHolderName,
          "account_number": accountNumber,
          "tax_payer_id": taxPayerId,
        },
      );
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("BankInfo Called ::: ${response.body}");
        return BankInfoUpdated.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }

}