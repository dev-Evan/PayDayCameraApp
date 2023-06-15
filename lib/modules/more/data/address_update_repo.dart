import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/more/domain/address_update_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';

class AddressUpdateDataSource {
  final NetworkClient networkClient;
  AddressUpdateDataSource(this.networkClient);
  Future<AddressUpdateModel> getAddressUpdate(area,city,county,details,phoneNumber,state,type,zipCode) async {
    try {
      Response response = await networkClient.postRequest(
        Api.ADDRESS_UPDATE,
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
        Get.back();
        return AddressUpdateModel.fromJson(response.body);
      }
    } catch (ex) {


      return Future.error(ErrorModel(message: ex.toString()));

    }
  }
}


