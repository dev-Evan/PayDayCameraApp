import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/common/widget/warning_message.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../common/widget/error_message.dart';
import '../../../../../common/widget/success_message.dart';
import '../common_controller/more_text_editing_controller.dart';

class UpdateDocumentController extends GetxController {
  //picked document path here
  PickedFormUpdatedStorage storageForUpdate = PickedFormUpdatedStorage();

  //document upload for server
  Future<dynamic> updateDocumentFile({required context}) async {
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
      storageForUpdate.isLoading(false);
      isReturnValue = true;

      //document update than input field clear here
      storageForUpdate._inputClear();
    } else {
      isReturnValue = false;
      storageForUpdate.toastMessage(true);
      storageForUpdate.isLoading(false);
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

 //picked file form storage here
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

  //device sdk version check here
    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }

  // permission check for device form storage
    if (permissionStatus.isGranted) {
      if (result != null) {
        if (result.files.single.path!.length > 500.toInt()) {
          showWarningMessage(message: AppString.text_jpeg_format_not_support);
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
        ? showSuccessMessage(
            message: AppString.text_file_upload_update_successfully,marginForButton: 60)
        : showErrorMessage(errorMessage: AppString.text_file_upload_file);
  }

  _inputClear() {
    return Get.find<InputTextFieldController>().docFileNameController.clear();
  }
}
