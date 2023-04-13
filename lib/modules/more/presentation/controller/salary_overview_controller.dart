

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/more/data/salary_overview_rep.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class SalaryOverviewController extends GetxController with StateMixin {
  SalaryOverViewModel? salaryOverView;
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  SalaryOverViewRepository salaryOverViewRepository =
      SalaryOverViewRepository(NetworkClient());

  getUserData() async {
    change(null, status: RxStatus.loading());
    try {
      await salaryOverViewRepository.getSalaryOverViewData().then((value) {
        print(value);
        salaryOverView = value;
      }, onError: (error) {
        print(error.message);
      });

      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }
}
