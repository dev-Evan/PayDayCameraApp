
import 'package:get/get.dart';
import 'more_text_editing_controller.dart';

class CountryPickerController extends GetxController {


  RxString phoneNumber = ''.obs;
  RxString flag = ''.obs;

  void onPhoneNumberChanged(String number) {
    phoneNumber.value = number;
  }  void flagChanged(String number) {
    flag.value = number;
  }

  final InputTextFieldController _inputTextFieldController =
      Get.put(InputTextFieldController());

  void setSelectedCountry(String country) {
    _inputTextFieldController.addCountyController.text = country;
  }

  void editSetSelectedCountry(String country) {
    _inputTextFieldController.countyTextController.text = country;
  }




}

