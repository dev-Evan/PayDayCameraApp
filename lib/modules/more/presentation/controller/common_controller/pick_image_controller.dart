import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';

class PickImageController extends GetxController {
  var pickedImage = Rx<XFile?>(null);
  final ProfileDataController _profileDataController =
      Get.put(ProfileDataController());

  Future<void> pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      if (image.path.endsWith(".jpeg")) {
        showCustomSnackBar(message:"jpeg image not support" );
      }else{
        pickedImage.value = image;
        await _profileDataController.changeProfileImage(image);
      }
    }
    
  }
}
