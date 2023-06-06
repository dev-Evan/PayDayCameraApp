import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/color_picker_helper.dart';

class DropdownBtnController extends GetxController {
  var dropdownValue = capitalize(Get.find<ProfileDataController>()
      .userProfile.data?.gender
      .toString() ??
      "").obs;

  var value = "";
  void onValueChanged(String? newValue) {
    dropdownValue.value = newValue!;

    if (dropdownValue.value == "Male") {
      value = "male";
    } else {
      value = "female";
    }
  }
}



