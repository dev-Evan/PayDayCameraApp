import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/controller/api_check_controller.dart';
import 'package:pay_day_mobile/modules/setting/data/setting_rep.dart';
import 'package:pay_day_mobile/modules/setting/domain/setting_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class SettingController extends GetxController with StateMixin {
  final _box = GetStorage();
  BasicInfo? basicInfo;

  @override
  void onInit() {
    getCurrencyData();
    super.onInit();
  }

  SettingDataRepository settingDataRepository = SettingDataRepository(NetworkClient());

  getCurrencyData() async {
    change(null, status: RxStatus.loading());

      await settingDataRepository.getSettingData().then((value) {
        basicInfo = value;
        _box.write(AppString.STORE_CURRENCY,
            basicInfo?.data.currencySymbol.toString() ?? "");
      }, onError: (error) {
        CheckForApi().checkForApi(error);
      });
    change(null, status: RxStatus.success());
  }

}

