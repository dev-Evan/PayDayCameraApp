import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../common/widget/error_message.dart';
import '../../../../utils/app_string.dart';

class PickedFileFormStorage {
  final box = GetStorage();
  var baseUrl = Api.BASE_URL + Api.DOCUMENT_UPLOAD;
  late var accessToken = box.read(AppString.ACCESS_TOKEN);
  late var accessId = box.read(AppString.ID_STORE);

  Rx<File?> selectedFile = Rx<File?>(null);
  RxString filePath = ''.obs;
  final isLoading = false.obs;

  Future<void> pickFile() async {
    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (permissionStatus.isGranted) {
      if (result != null) {
        if (result.files.single.path!.length > 500.toInt()) {
          showCustomSnackBar(message: AppString.text_jpeg_format_not_support);
        } else {
          File file = File(result.files.single.path!);
          selectedFile.value = file;
          filePath.value = result.files.single.path!;
        }
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    } else {
      showErrorMessage(errorMessage: AppString.storage_permission);
    }
  }

  toastMessage(bool status) {
    return status == false
        ? showCustomSnackBar(
            message: AppString.text_file_upload_update_successfully)
        : showCustomSnackBar(message: AppString.text_file_upload_file);
  }
}
