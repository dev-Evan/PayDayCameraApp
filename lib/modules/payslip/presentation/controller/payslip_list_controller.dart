import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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


  @override
  void onInit() {

      getPayslipListData();

    super.onInit();
  }

  DropdownBtnStdController dropdownBtnStdController =Get.put(DropdownBtnStdController());
late var setValue= dropdownBtnStdController.currentValue.toString();

  PayslipListRepository payslipListRepository =
      PayslipListRepository(NetworkClient());
  getPayslipListData() async {
    change(null, status: RxStatus.loading());
    try {

      await payslipListRepository
          .getPayslipListRepo(selectedType: setValue ==null?AppString.text_this_year2:setValue.toString())
          .then((value) {
        payslipListModel = value;
        print(payslipListModel?.message.toString());
        print(payslipListModel?.data?.payslips?.first.month.toString());
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
