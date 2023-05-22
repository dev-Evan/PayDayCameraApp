import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_data_repository.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payrun_badge_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class PayrunBadgeController extends GetxController with StateMixin {
  PayrunBadgeModel payrunBadgeModel =PayrunBadgeModel();
  PayslipDataRepository payrunBadgeRepository =
  PayslipDataRepository(NetworkClient());
  getPayrunBadgeData() async {
    change(null, status: RxStatus.loading());
    try {
      await payrunBadgeRepository.getPayrunBagReoData().then((value) {
        print(value);
        payrunBadgeModel = value;
      }, onError: (error) {
        print(error.message);
      });
      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }
}
