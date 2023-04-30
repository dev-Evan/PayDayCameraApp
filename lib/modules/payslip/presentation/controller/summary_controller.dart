import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/more/data/salary_overview_rep.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/modules/payslip/data/summmary_repo.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class SummaryViewController extends GetxController with StateMixin {
  SummaryModel? summaryModel;
  @override
  void onInit() {
    getSummaryData();
    super.onInit();
  }
  SummaryViewRepository summaryViewRepository =
  SummaryViewRepository(NetworkClient());

  getSummaryData() async {
    change(null, status: RxStatus.loading());
    try {
      await summaryViewRepository.getSummaryViewData().then((value) {
        print(value);
        summaryModel = value;
      }, onError: (error) {
        print(error.message);
      });
      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }
}
