import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/data/salary_overview_rep.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/modules/payslip/data/payslip_list_repo.dart';
import 'package:pay_day_mobile/modules/payslip/data/summmary_repo.dart';
import 'package:pay_day_mobile/modules/payslip/domain/payslip_list_model.dart';
import 'package:pay_day_mobile/modules/payslip/domain/summary_model.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_std_drop_dawon_controller.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class PayslipListController extends GetxController with StateMixin {
  PayslipListModel? payslipListModel;

  DropdownBtnStdController dropdownBtnStdController =
      Get.put(DropdownBtnStdController());
  PayslipListRepository payslipListRepository =
      PayslipListRepository(NetworkClient());
  getPayslipListData() async {
    change(null, status: RxStatus.loading());
    try {
      await payslipListRepository
          .getPayslipListRepo(
              selectedType: dropdownBtnStdController.currentValue.toString()

      )
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
