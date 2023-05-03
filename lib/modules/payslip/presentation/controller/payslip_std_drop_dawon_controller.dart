import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_list_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DropdownBtnStdController extends GetxController {
  var dropdownValue = AppString.text_total.obs;

  void onValueChanged(String? newValue) {
    PayslipListController payslipListController =
        Get.put(PayslipListController());
    dropdownValue.value = newValue!;
    if (newValue == AppString.text_this_year) {
      payslipListController.getPayslipListData(value: "thisYear");
    } else if (newValue == AppString.text_this_month) {
      payslipListController.getPayslipListData(value: "thisMonth");
    } else if (newValue == AppString.text_last_month) {
      payslipListController.getPayslipListData(value: "lastMonth");
    } else {
      payslipListController.getPayslipListData(value: "total");
    }
  }
}
