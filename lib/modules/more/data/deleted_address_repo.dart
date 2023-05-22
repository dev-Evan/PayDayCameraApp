import 'package:get/get.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../common/domain/error_model.dart';
import '../../../utils/app_string.dart';
import '../domain/deleted_address_model.dart';

class DeletedAddRepository {
  final NetworkClient networkClient;
  DeletedAddRepository(this.networkClient);
  Future<DeletedAddressModel> deletedAddressRepo(String addressType,) async {
    try {
      Response  response = await networkClient.postRequest(
        AppString.DELETED_ADDRESS,
        {
          "type":addressType,
        },
      );
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("Deleted address Called ::: ${response.body}");
        return DeletedAddressModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ex.toString());
    }
  }
}

