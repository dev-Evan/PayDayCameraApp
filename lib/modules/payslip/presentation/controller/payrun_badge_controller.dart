
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/more/data/salary_overview_rep.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/modules/payslip/data/payrun_badge_repo.dart';
import 'package:pay_day_mobile/modules/payslip/data/summmary_repo.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payrun_badge_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class PayrunBadgeController extends GetxController with StateMixin {
  PayrunBadgeModel? payrunBadgeModel;
  PayrunBadgeRepository payrunBadgeRepository =
  PayrunBadgeRepository(NetworkClient());

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
