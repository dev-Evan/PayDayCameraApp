import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';

class PickImageController extends GetxController {
  var pickedImage = Rx<XFile?>(null);
  ProfileDataController _profileDataController =
      Get.put(ProfileDataController());

  Future<void> pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      pickedImage.value = image;
      await _profileDataController.changeProfileImage(image);
    }
  }
}
