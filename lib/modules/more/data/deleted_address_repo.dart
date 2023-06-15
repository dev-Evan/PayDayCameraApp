import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../../../common/domain/error_model.dart';
import '../domain/deleted_address_model.dart';

class DeletedAddRepository {
  final NetworkClient networkClient;
  DeletedAddRepository(this.networkClient);
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

