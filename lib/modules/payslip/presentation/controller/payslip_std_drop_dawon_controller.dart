import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_list_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DropdownBtnStdController extends GetxController {
  var dropdownValue = AppString.text_total.obs;
  var sltDate =_total();

  void onValueChanged(String? newValue) {
    PayslipListController payslipListController =
        Get.put(PayslipListController());
    dropdownValue.value = newValue!;
    if (newValue == AppString.text_this_year) {
      sltDate = _thisYear();

      payslipListController.getPayslipListData(value: "thisYear");
    } else if (newValue == AppString.text_this_month) {
      sltDate = _thisMonth();

      payslipListController.getPayslipListData(value: "thisMonth");
    } else if (newValue == AppString.text_last_month) {
      sltDate = _lastMonth();
      payslipListController.getPayslipListData(value: "lastMonth");
    } else {
      sltDate = _total();

      payslipListController.getPayslipListData(value: "total");
    }
  }
}

String _lastMonth() {
  DateTime date = DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
  return DateFormat('MMMM yyyy').format(date);
}

String _thisMonth() {
  return DateFormat.MMMMd().format(DateTime.now());
}

String _thisYear() {
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  return DateFormat('MMMM yyyy').format(date);
}

String _total() {
  DateTime firstDate = DateTime(DateTime.now().year, 1, 1);
  DateTime lastDate = DateTime(DateTime.now().year, 12, 31);
  var fistDate1 = DateFormat('dd MMM yyyy').format(firstDate);
  var lastDate1 = DateFormat('dd MMM yyyy').format(lastDate);
  return '$fistDate1 - $lastDate1';
}
