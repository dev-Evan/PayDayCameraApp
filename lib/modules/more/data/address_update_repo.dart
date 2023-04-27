//AddressUpdateModel
// interface implementation will be here
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';
import 'package:pay_day_mobile/modules/more/domain/address_update_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../common/domain/error_model.dart';

class AddressUpdateDataSource {
  final NetworkClient networkClient;
  AddressUpdateDataSource(this.networkClient);
  Future<AddressUpdateModel> getAddressUpdate(area,city,county,details,phoneNumber,state,type,zipCode) async {
    try {
      Response response = await networkClient.postRequest(
        AppString.ADDRESS_UPDATE,
        {
          "area": area,
          "city": city,
          "country": county,
          "details": details,
          "phone_number": phoneNumber,
          "state": state,
          "type": type,
          "zip_code": zipCode,

        },
      );
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return AddressUpdateModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}


