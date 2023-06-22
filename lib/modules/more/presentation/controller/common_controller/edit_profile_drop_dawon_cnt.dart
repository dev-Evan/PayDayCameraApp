import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class DropdownBtnController extends GetxController {
  var dropdownValue = AppString.text_male.obs;
  var value = "";
  void onValueChanged(String? newValue) {
    dropdownValue.value = newValue!;
    if (dropdownValue == "Male") {
      value = "male";
    } else if(dropdownValue == "Female") {
      value = "female";
    }else{
      return;
    }
  }
}

