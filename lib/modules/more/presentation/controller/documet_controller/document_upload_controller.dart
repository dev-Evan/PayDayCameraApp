import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import '../../../data/document_repository/picked_form_storage.dart';

class FileUploadController extends GetxController {
  PickedFileFormStorage storageForUpload = PickedFileFormStorage();

  Future<dynamic> uploadFile({required context}) async {
    storageForUpload.isLoading(true);
    bool isReturnValue = false;

    File? file = storageForUpload.selectedFile.value;
    if (file == null) {
      return;
    }
    final url = Uri.parse(storageForUpload.baseUrl);
    var request = _request(url);
    request.fields['name'] = Get.find<InputTextFieldController>().docFileNameController.text;
    request.fields['file'] = file.path;
    request.fields['user_id'] = storageForUpload.accessId.toString();
    request.headers['Authorization'] = 'Bearer ${storageForUpload.accessToken}';

    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      storageForUpload.isLoading(false);
      isReturnValue = true;
      storageForUpload.filePath.value = "";
      _inputClear();
    } else {
      storageForUpload.isLoading(false);
      isReturnValue = false;
      storageForUpload.toastMessage(true);
    }

    storageForUpload.isLoading(false);
    return isReturnValue;
  }

  _inputClear() {
    return Get.find<InputTextFieldController>().docFileNameController.clear();
  }

  _request(url) {
    return http.MultipartRequest('POST', url);
  }
}
