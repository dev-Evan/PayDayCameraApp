import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../common/widget/error_message.dart';

class PickImageController extends GetxController {
  var pickedImage = Rx<XFile?>(null);
  final ProfileDataController _profileDataController =
      Get.put(ProfileDataController());

  Future<void> pickImage(ImageSource source) async {
    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }

    if (permissionStatus.isGranted) {
      XFile? image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        if (image.path.length > 500.toInt()) {
          showErrorMessage(errorMessage: AppString.text_jpeg_format_not_support);
        } else {
          pickedImage.value = image;
          await _profileDataController.changeProfileImage(image);
        }
      } else if (permissionStatus.isPermanentlyDenied) {
        openAppSettings();
      } else {
        showErrorMessage(errorMessage: AppString.storage_permission);
      }
    }
  }
}
