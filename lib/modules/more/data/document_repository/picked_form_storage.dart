import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
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
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      selectedFile.value = file;
      filePath.value = result.files.single.path!;
      print(filePath.toString());
    }
  }

  toastMessage(bool status) {
    return status == false
        ? showCustomSnackBar(
            message: AppString.text_file_upload_update_successfully)
        : showCustomSnackBar(message: AppString.text_file_upload_file);
  }
}
