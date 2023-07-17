import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/drop_dawon_seleted_date.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DropdownBtnStdController extends GetxController {
  var dropdownValue = AppString.text_this_year.obs;
  var sltDate =thisYear();
  void onValueChanged(String? newValue) {
    dropdownValue.value = newValue!;
    if (newValue == AppString.text_this_year) {
      sltDate = thisYear();
      Get.find<PayslipController>().getPayslipListData(value: thisYarKey());
    } else if (newValue == AppString.text_this_month) {
      sltDate = thisMonth();
      Get.find<PayslipController>().getPayslipListData(value: thisMonthKey());
    } else if (newValue == AppString.text_last_month) {
      sltDate = lastMonth();
      Get.find<PayslipController>().getPayslipListData(value: lastMonthKey());
    } else {
      sltDate = lastYear();
      Get.find<PayslipController>().getPayslipListData(value: lastYearKey());
    }
  }
}




