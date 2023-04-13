import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DropdownBtnController extends GetxController {
  var dropdownValue = AppString.text_male.obs;

  void onValueChanged(String? newValue) {
    dropdownValue.value = newValue!;
    // print(newValue.toString());//
    print(dropdownValue.toString());
  }
}