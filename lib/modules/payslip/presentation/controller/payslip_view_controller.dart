import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_data_repository.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_view_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class PayslipViewController extends GetxController with StateMixin {
  PayslipViewModel  payslipViewModel=PayslipViewModel();
  final _box=GetStorage();
   late var indexId=_box.read(AppString.STORE_PAYSLIP_LSIT_ID);
  PayslipDataRepository payslipDataRepository =
  PayslipDataRepository(NetworkClient());

  getPayslipViewData() async {
    change(null, status: RxStatus.loading());
    try {
      await payslipDataRepository.getPayslipViewData(indexId: indexId.toString()).then((value) {
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
