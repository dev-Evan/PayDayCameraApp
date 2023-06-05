import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class FileUploadController extends GetxController {
  Rx<File?> selectedFile = Rx<File?>(null);
  final _box=GetStorage();
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      selectedFile.value = file;
    }
  }

  var baseUrl = AppString.BASE_URL + AppString.DOCUMENT_UPLOAD;
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);


  Future<void> uploadFile({required context}) async {
    waitingLoader();
    File? file = selectedFile.value;
    if (file == null) {
      return; // No file selected
    }
    final url = Uri.parse(baseUrl);
    var request = http.MultipartRequest('POST', url);
    request.fields['name'] = Get.find<CustomTextEditingController>().docFileNameController.text;
    request.fields['file'] = file.path;
    request.fields['user_id'] = _box.read(AppString.ID_STORE).toString();
    request.headers['Authorization'] = 'Bearer ${accessToken}';
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    var response = await request.send();

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => DocumentScreen(),
        ),
      );
      Get.back();
      print("Document upload ::: ${response}");
      Get.find<DocumentController>().getDocumentData();
      print('File uploaded successfully');
      Get.find<CustomTextEditingController>().docFileNameController.clear();
    } else {
      Get.back();
      print('Failed to upload file');
    }
    Get.back();
  }
}
