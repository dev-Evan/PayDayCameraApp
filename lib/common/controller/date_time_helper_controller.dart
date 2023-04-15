import 'package:get/get.dart';

class DateTimeController extends GetxController {
  RxBool isInTimeClicked = false.obs;
  String selectedInputHrs = '06';
  String selectedInputMins = '30';
  String clockHrsFormat = '';
  RxString requestedDate = ''.obs;

  RxString pickedInTime = ''.obs;
  RxString pickedOutTime = ''.obs;

  void getTime() {
    if (clockHrsFormat.isNotEmpty) {
      isInTimeClicked.isTrue
          ? pickedInTime.value =
              "${selectedInputHrs.padLeft(2, '0')}:${selectedInputMins.padLeft(2, '0')} $clockHrsFormat"
          : pickedOutTime.value =
              "${selectedInputHrs.padLeft(2, '0')}:${selectedInputMins.padLeft(2, '0')} $clockHrsFormat";
    }
    print("in time: $pickedInTime  out time: $pickedOutTime");
  }

  @override
  void dispose() {
    print("Dispose Called");
    selectedInputHrs = '';
    selectedInputMins = '';
    isInTimeClicked.value = false;
    super.dispose();
  }
}
