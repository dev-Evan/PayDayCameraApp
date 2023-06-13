import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/data/change_profile_image_repo.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class ImagePickerController extends GetxController with StateMixin {
  ChangeProfileImageRepo changeProfileImageRepo = ChangeProfileImageRepo();
  var pickedImage = Rx<XFile?>(null);
  Future<void> pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      pickedImage.value = image;
      await changeProfileImage(image);
    }
  }
  changeProfileImage(XFile image) async {
    change(null, status: RxStatus.loading());
    waitingLoader();
    await changeProfileImageRepo
        .changeImageRepo(
      image: image,
    )
        .then((value) {
      Get.back();
      showCustomSnackBar(message: AppString.text_profile_picture_update_successfully);

      print(value.toString());
    }, onError: (error) {
      print(error.message);
    });
  }
}
