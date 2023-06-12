import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/deleted_address_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DeletedAddController extends GetxController with StateMixin {
  final DeletedAddRepository deletedAddRepository =
      DeletedAddRepository(NetworkClient());
  var newValue;
  void deletedAddressApi({required addressType, required context}) async {
    waitingLoader();
    try {
      await deletedAddRepository.deletedAddressRepo(addressType.toString())
          .then((value) {
        Get.find<AddressDetailsController>().getEmployeeAddressData();
        showCustomSnackBar(
            message: AppString.text_address_deleted_successfully);
        newValue = '${value}';
        Get.back();
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
