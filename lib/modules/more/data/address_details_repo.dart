import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/more/domain/address_details_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class AddressDetailsRepository {
  final NetworkClient networkClient;

  AddressDetailsRepository(this.networkClient);

  Future<AddressDetailsModel> getAddressDetailsData() async {
    try {
      Response response =
      await networkClient.getRequest(AppString.EMPLOYEE_ADDRESS);
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
}
