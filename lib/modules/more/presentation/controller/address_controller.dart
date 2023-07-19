import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/address_repo_data.dart';
import 'package:pay_day_mobile/modules/more/domain/deleted_address_model.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/utils.dart';
import '../../../../common/widget/error_alert_pop_up.dart';
import '../../../../network/network_client.dart';
import '../../domain/address_details_model.dart';
import 'common_controller/more_text_editing_controller.dart';

class AddressController extends GetxController with StateMixin {
  AddressDetailsModel addressDetailsModel = AddressDetailsModel();
  DeletedAddressModel deletedAddressModel = DeletedAddressModel();
  AddressRepository addressRepository = AddressRepository(NetworkClient());

  getEmployeeAddressData() async {
    change(null, status: RxStatus.loading());
    await addressRepository.getAddressDetailsData().then((value) {
      print("Address details called ::: $value");
      addressDetailsModel = value;
    }, onError: (error) {
      errorAlertPopup(getEmployeeAddressData);
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }

  Future<bool> addressUpdate(
      {required typeKey,
      required context,
      required area,
      required city,
      required country,
      required details,
      required phone,
      required state,
      required zipcode,
      required String message}) async {
    bool isReturnValue = false;
    change(null, status: RxStatus.loading());
    try {
      await addressRepository
          .getAddressUpdate(
              area, city, country, details, phone, state, typeKey, zipcode)
          .then((value) {
        isReturnValue = true;
        FutureDelayed(onAction: () => showCustomSnackBar(message: message));
        FutureDelayed(onAction: () => _fieldClear());
        print("Address update called ::: $value");
      }, onError: (error) {
        isReturnValue = false;
        errorSnackBar(errorMessage: error.toString());
      });
    } catch (ex) {
      isReturnValue = false;
    }
    change(null, status: RxStatus.success());
    return isReturnValue;
  }

  deletedAddressApi({required addressType, required context}) async {
    bool isDetReturnValue = false;
    change(null, status: RxStatus.loading());
    try {
      await addressRepository.deletedAddressRepo(addressType.toString()).then(
          (DeletedAddressModel value) async {
        isDetReturnValue = true;
        showCustomSnackBar(
            message: AppString.text_address_deleted_successfully);
      }, onError: (error) {
        isDetReturnValue = false;
        errorSnackBar(errorMessage: error.toString());
        print("Deleted Address ::: ${error.toString()}");
      });
    } catch (ex) {
      isDetReturnValue = false;
      print("Deleted Address ex ::: ${ex.toString()}");
    }
    change(null, status: RxStatus.success());

    return isDetReturnValue;
  }
}

_fieldClear() {
  //test data
  Get.find<InputTextFieldController>().addPhoneNumberController.clear();
  Get.find<InputTextFieldController>().addAreaController.clear();
  Get.find<InputTextFieldController>().addCityController.clear();
  Get.find<InputTextFieldController>().addStateController.clear();
  Get.find<InputTextFieldController>().addZipCodeController.clear();
  Get.find<InputTextFieldController>().addDetailsController.clear();
  Get.find<InputTextFieldController>().addCountyController.clear();
}
