import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_list_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DropdownBtnStdController extends GetxController {
  final _box = GetStorage();
  var dropdownValue = AppString.text_this_year.obs;
  var currentValue;

  void onValueChanged(String? newValue) {
    _box.write("test", currentValue);
    PayslipListController payslipListController =
        Get.put(PayslipListController());
    dropdownValue.value = newValue!;
    if (newValue == AppString.text_this_year) {
      currentValue = "thisYear";
      payslipListController.getPayslipListData();
      _box.remove("test");

    } else if (newValue == AppString.text_this_month) {
      currentValue = "thisMonth";
      payslipListController.getPayslipListData();
      _box.remove("test");

    } else if (newValue == AppString.text_last_month) {
      currentValue = "lastMonth";
      payslipListController.getPayslipListData();
      _box.remove("test");


    } else {
      currentValue = "total";
      payslipListController.getPayslipListData();
      _box.remove("test");

    }
    //print(currentValue.toString());
  }
}
