import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_data_repository.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_list_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_std_drop_dawon_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class PayslipListController extends GetxController with StateMixin {
  SummaryModel summaryModel = SummaryModel();
  PayslipListModel payslipListModel = PayslipListModel();

  DropdownBtnStdController dropdownBtnStdController =
      Get.put(DropdownBtnStdController());

  PayslipDataRepository payslipDataRepository =
      PayslipDataRepository(NetworkClient());

  void getPayslipListData({required value}) async {
    change(null, status: RxStatus.loading());
    try {
      await payslipDataRepository
          .getPayslipListRepo(selectedType: value.toString())
          .then((payslipListData) {
        payslipListModel = payslipListData;
        print(payslipListData.toString());
        print(payslipListModel.data?.payslips?.first.month.toString());
      }, onError: (error) {
        print(error.message);
      });
    } catch (ex) {
      print(ex.toString());
      change(null, status: RxStatus.success());
    }
    change(null, status: RxStatus.success());
  }

  void getSummaryData() async {
    change(null, status: RxStatus.loading());
    try {
      await payslipDataRepository.getSummaryViewData().then((value) {
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
