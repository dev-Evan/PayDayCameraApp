import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_data_repository.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_view_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class PayslipViewController extends GetxController with StateMixin {
  PayslipViewModel  payslipViewModel=PayslipViewModel();
  PayslipDataRepository payslipDataRepository =
  PayslipDataRepository(NetworkClient());
  getPayslipViewData() async {
    change(null, status: RxStatus.loading());
    try {
      await payslipDataRepository.getPayslipViewData().then((value) {
        payslipViewModel =value;
        print(value);
        print(payslipViewModel.data?.payslip?.considerOvertime?.toInt());
      }, onError: (error) {
        print(error.message);
      });
      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }
}
