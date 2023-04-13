import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/more/data/address_details_repo.dart';
import 'package:pay_day_mobile/modules/more/data/profile_data_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/address_details_model.dart';
import 'package:pay_day_mobile/modules/more/domain/user_profile.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AddressDetailsController extends GetxController with StateMixin {
  AddressDetailsModel? addressDetailsModel;
  RxBool loading = false.obs;

  @override
  void onInit() {
    getEmployeeAddressData();
    super.onInit();
  }

  AddressDetailsRepository addressDetailsRepository =
  AddressDetailsRepository(NetworkClient());

  getEmployeeAddressData() async {
    change(null, status: RxStatus.loading());
    await addressDetailsRepository.getAddressDetailsData().then((value) {
      print(value);
      addressDetailsModel = value;
    }, onError: (error) {
      print(error.message);
    });

    change(null, status: RxStatus.success());
  }
}
