import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/more/domain/address_details_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';

import '../domain/address_update_model.dart';
import '../domain/deleted_address_model.dart';


class AddressRepository {
  final NetworkClient networkClient;
  AddressRepository(this.networkClient);

  Future<AddressDetailsModel> getAddressDetailsData() async {
    try {
      Response response =
      await networkClient.getRequest(Api.EMPLOYEE_ADDRESS);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body.toString());
        return AddressDetailsModel.fromJson(response.body as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }

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
  Future<DeletedAddressModel> deletedAddressRepo(String addressType,) async {
    try {
      Response  response = await networkClient.postRequest(
        Api.DELETED_ADDRESS,
        {
          "type":addressType,
        },
      );
      print(response.body);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Deleted address Called ::: ${response.body}");
        Get.back();
        return DeletedAddressModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }


}
