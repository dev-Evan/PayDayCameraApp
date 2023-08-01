import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../data/document_repository/picked_form_storage.dart';

class FileUploadController extends GetxController {

  PickedFileFormStorage storageForUpload=PickedFileFormStorage();

  Future<dynamic> uploadFile({required context}) async {
    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }

    if (permissionStatus.isGranted) {
      storageForUpload. isLoading(true);
      bool isReturnValue = false;

      File? file = storageForUpload.selectedFile.value;
      if (file == null) {
        return;
      }
      final url = Uri.parse(storageForUpload.baseUrl);
      var request = _request(url);
      request.fields['name'] = Get.find<InputTextFieldController>().docFileNameController.text;
      request.fields['file'] = file.path;
      request.fields['user_id'] =storageForUpload.accessId.toString();
      request.headers['Authorization'] = 'Bearer ${storageForUpload.accessToken}';

      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        storageForUpload.isLoading(false);
        isReturnValue = true;
        storageForUpload.toastMessage(false);
        storageForUpload. filePath.value = "";
        _inputClear();
      } else {
        storageForUpload. isLoading(false);
        isReturnValue = false;
        storageForUpload.toastMessage(true);
      }

      storageForUpload. isLoading(false);
      return isReturnValue;
    } else if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    } else {
      errorSnackBar(errorMessage: AppString.storage_permission);
    }
  }

 _inputClear() {
    return Get.find<InputTextFieldController>().docFileNameController.clear();
  }

  _request(url)  {
    return http.MultipartRequest('POST', url);
  }

}

