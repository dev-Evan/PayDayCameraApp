import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_list_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DropdownBtnStdController extends GetxController {

  var dropdownValue = AppString.text_this_year.obs;
  var currentValue;

  void onValueChanged(String? newValue) {
    PayslipListController payslipListController=Get.put(PayslipListController());
    dropdownValue.value = newValue!;
    if(newValue==AppString.text_this_year){
     // print("this year");
      currentValue="thisYear";
      payslipListController.getPayslipListData();

    }else if(newValue==AppString.text_this_month){
      currentValue="thisMonth";
     payslipListController.getPayslipListData();

    }else if(newValue==AppString.text_last_month){
      currentValue="lastMonth";
      payslipListController.getPayslipListData();

    }else{
      currentValue="total";
      payslipListController.getPayslipListData();

    }
    print(currentValue.toString());


    // print(dropdownValue.toString());
  }
}