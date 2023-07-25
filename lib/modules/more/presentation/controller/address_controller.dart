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
  final isLoading = false.obs;
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

  Future<bool> addressUpdate({required typeKey, required context, required area, required city, required country, required details, required phone, required state, required zipcode, required String message,required isoCode}) async {
    bool isReturnValue = false;
    isLoading(true);
    try {
      await addressRepository
          .getAddressUpdate(
              area, city, country, details, phone, state, typeKey, zipcode,isoCode)
          .then((value) {
        isReturnValue = true;
        isLoading(true);
        FutureDelayed(onAction: () => showCustomSnackBar(message: message));
        FutureDelayed(onAction: () => _fieldClear());
        print("Address update called ::: $value");
      }, onError: (error) {
        isReturnValue = false;
        isLoading(false);
        errorSnackBar(errorMessage: error.toString());
      });
    } catch (ex) {
      isReturnValue = false;
    }
    isLoading(false);
    return isReturnValue;
  }

  deletedAddressApi({required addressType, required context}) async {
    bool isDetReturnValue = false;
    isLoading(true);
      await addressRepository.deletedAddressRepo(addressType.toString()).then(
          (DeletedAddressModel value) async {
        isDetReturnValue = true;
        showCustomSnackBar(message: AppString.text_address_deleted_successfully);
      }, onError: (error) {
        isLoading(false);
        isDetReturnValue = false;
        errorSnackBar(errorMessage: error.toString());
        print("Deleted Address ::: ${error.toString()}");
      });
    isLoading(false);
    return isDetReturnValue;
  }
}

_fieldClear() {
  Get.find<InputTextFieldController>().addPhoneNumberController.clear();
  Get.find<InputTextFieldController>().addAreaController.clear();
  Get.find<InputTextFieldController>().addCityController.clear();
  Get.find<InputTextFieldController>().addZipCodeController.clear();
  Get.find<InputTextFieldController>().addDetailsController.clear();
  Get.find<InputTextFieldController>().addCountyController.clear();
  Get.find<InputTextFieldController>().addStateController.clear();
}
