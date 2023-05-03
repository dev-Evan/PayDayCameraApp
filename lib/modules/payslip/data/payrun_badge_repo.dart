import 'package:get/get.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payrun_badge_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class PayrunBadgeRepository {
  final NetworkClient networkClient;

  PayrunBadgeRepository(this.networkClient);

  Future<PayrunBadgeModel> getPayrunBagReoData() async {
    try {
      Response response =
      await networkClient.getRequest(AppString.PAYRUN_BADGE);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body);
        return PayrunBadgeModel.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}

