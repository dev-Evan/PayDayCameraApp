
import 'package:get/get.dart';
import 'more_text_editing_controller.dart';

class CountryPickerController extends GetxController {


  RxString phoneNumber = ''.obs;
  RxString isoCode = ''.obs;

  void onPhoneNumberChanged(String number) {
    phoneNumber.value = number;
  }  void isoCodeChanged(String iso) {
    isoCode.value = iso;
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

