import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../common/widget/error_message.dart';
import '../common_controller/more_text_editing_controller.dart';

class UpdateDocumentController extends GetxController {
  PickedFormUpdatedStorage storageForUpdate = PickedFormUpdatedStorage();

  Future<dynamic> updateDocFile({required context}) async {
    storageForUpdate.isLoading(true);
    bool isReturnValue = false;

    File? file = storageForUpdate.selectedFile.value;
    if (file == null) {
      return;
    }
    final url = Uri.parse(storageForUpdate.baseUrl);
    var request = _request(url);

    request.fields['id'] =
        storageForUpdate._box.read(AppString.STORE_DOC_Id).toString();
    request.fields['name'] =
        Get.find<InputTextFieldController>().docFileNameController.text;
    request.fields['file'] = file.path;
    request.fields['user_id'] =
        storageForUpdate._box.read(AppString.ID_STORE).toString();
    request.headers['Authorization'] = 'Bearer ${storageForUpdate.accessToken}';
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Document updated ::: $response");
      storageForUpdate.isLoading(false);
      isReturnValue = true;
      storageForUpdate._inputClear();
      storageForUpdate.toastMessage(false);
      print(' Document update ::: File updated successfully');
    } else {
      isReturnValue = false;
      storageForUpdate.toastMessage(true);
      storageForUpdate.isLoading(false);
      print('Document update ::: Failed to upload file');
    }
    storageForUpdate.isLoading(false);
    return isReturnValue;
  }
}

_request(url) {
  return http.MultipartRequest('POST', url);
}

class PickedFormUpdatedStorage {
  final isLoading = false.obs;
  final _box = GetStorage();
  Rx<File?> selectedFile = Rx<File?>(null);
  var baseUrl = Api.BASE_URL + Api.UPDATE_DOCUMENT;
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);
  RxString filePath = ''.obs;
  var newValue = "";

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }

    if (permissionStatus.isGranted) {
      if (result != null) {
        if (result.files.single.path!.length > 500.toInt()) {
          showCustomSnackBar(message: AppString.text_jpeg_format_not_support);
        } else {
          File file = File(result.files.single.path!);
          selectedFile.value = file;
          _box.write("Doc", file.path);
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

  _inputClear() {
    return Get.find<InputTextFieldController>().docFileNameController.clear();
  }
}
