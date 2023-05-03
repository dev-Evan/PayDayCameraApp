import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_list_repo.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_list_model.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_std_drop_dawon_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';


class PayslipListController extends GetxController with StateMixin {
  PayslipListModel? payslipListModel;

  DropdownBtnStdController dropdownBtnStdController =
      Get.put(DropdownBtnStdController());
  PayslipListRepository payslipListRepository =
      PayslipListRepository(NetworkClient());
  getPayslipListData({required value}) async {
    change(null, status: RxStatus.loading());
    try {
      await payslipListRepository
          .getPayslipListRepo(selectedType: value.toString())
          .then((value) {
        payslipListModel = value;
      }, onError: (error) {
        print(error.message);
      });
    } catch (ex) {
      print(ex.toString());
      change(null, status: RxStatus.success());
    }
    change(null, status: RxStatus.success());
  }
}
