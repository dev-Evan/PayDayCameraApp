import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/data/salary_overview_rep.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class SalaryOverviewController extends GetxController with StateMixin {
  SalaryOverViewModel salaryOverView=SalaryOverViewModel();
  SalaryOverViewRepository salaryOverViewRepository =
      SalaryOverViewRepository(NetworkClient());
  getSalaryOveData() async {
    change(null, status: RxStatus.loading());
    try {
      await salaryOverViewRepository.getSalaryOverViewData().then((value) {
        print(value);
        salaryOverView = value;
      }, onError: (error) {
        print(error.message);
      });
    } catch (ex) {
      print(ex.toString());
    }
    change(null, status: RxStatus.success());
  }
}
