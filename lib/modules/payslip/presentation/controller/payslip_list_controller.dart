import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_alert_pop_up.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_data_repository.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_list_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_std_drop_dawon_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/drop_dawon_seleted_date.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class PayslipListController extends GetxController with StateMixin {
  SummaryModel summaryModel = SummaryModel();
  PayslipListModel payslipListModel = PayslipListModel();

  DropdownBtnStdController dropdownBtnStdController =
      Get.put(DropdownBtnStdController());

  PayslipDataRepository payslipDataRepository =
      PayslipDataRepository(NetworkClient());

  getPayslipListData({value}) async {
    change(null, status: RxStatus.loading());
      await payslipDataRepository
          .getPayslipListRepo(selectedType: value.toString())
          .then((payslipListData) {
        payslipListModel = payslipListData;
      }, onError: (error) {
        print(error.message);
        errorAlertPopup(getPayslipListData);
      });
    change(null, status: RxStatus.success());
  }

  void getSummaryData() async {
    change(null, status: RxStatus.loading());
    await payslipDataRepository.getSummaryViewData().then((value) {
      print(value);
      summaryModel = value;
    }, onError: (error) {
      print(error.message);
      errorAlertPopup(getSummaryData);
    });
    change(null, status: RxStatus.success());
  }
}
