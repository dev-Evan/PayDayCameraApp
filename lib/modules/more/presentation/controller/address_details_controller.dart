import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/data/address_details_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/address_details_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class AddressDetailsController extends GetxController with StateMixin {
  AddressDetailsModel addressDetailsModel=AddressDetailsModel();
  AddressDetailsRepository addressDetailsRepository =
      AddressDetailsRepository(NetworkClient());
  getEmployeeAddressData() async {
    change(null, status: RxStatus.loading());
    await addressDetailsRepository.getAddressDetailsData().then((value) {
      print("Address details called ::: ${value}");
      addressDetailsModel = value;
    }, onError: (error) {
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }
}
