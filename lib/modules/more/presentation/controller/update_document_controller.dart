import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'more_text_editing_controller.dart';

class UpdateDocumentController extends GetxController {
  Rx<File?> selectedFile = Rx<File?>(null);
  final _box = GetStorage();
  var baseUrl = Api.BASE_URL + Api.UPDATE_DOCUMENT;
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);
  RxString filePath = ''.obs;
  var newValue="";

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      selectedFile.value = file;
      _box.write("Doc", file.path);
      filePath.value = result.files.single.path!;
    }
  }

  Future<void> updateDocFile({required context}) async {
    waitingLoader();
    File? file = selectedFile.value;
    if (file == null) {
      return;
    }
    final url = Uri.parse(baseUrl);
    var request = http.MultipartRequest('POST', url);
    request.fields['id'] = _box.read(AppString.STORE_DOC_Id).toString();
    request.fields['name'] = Get.find<InputTextFieldController>().docFileNameController.text;
    request.fields['file'] = file.path;
    request.fields['user_id'] = _box.read(AppString.ID_STORE).toString();
    request.headers['Authorization'] = 'Bearer ${accessToken}';
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Document updated ::: ${response}");
      Get.back();
      newValue="value";
      Get.find<DocumentController>().getDocumentData();
      print(' Document update ::: File updated successfully');
    } else {
      print('Document update ::: Failed to upload file');
    }
    Get.back();
  }

}
