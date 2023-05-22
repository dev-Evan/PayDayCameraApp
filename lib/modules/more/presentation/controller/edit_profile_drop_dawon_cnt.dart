import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class DropdownBtnController extends GetxController {
  var dropdownValue = AppString.text_male.obs;
  void onValueChanged(String? newValue) {
    dropdownValue.value = newValue!;
  }
}