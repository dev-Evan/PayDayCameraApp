import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/setting/domain/setting_model.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class SettingDataRepository {

  final NetworkClient networkClient;
  SettingDataRepository(this.networkClient);


  Future<BasicInfo> getSettingData() async {
    try {
      Response response =
      await networkClient.getRequest(AppString.BASIC_INFO);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return BasicInfo.fromJson(response.body as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}


