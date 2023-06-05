import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class UpdateDocumentController extends GetxController {
  final _box = GetStorage();
  var baseUrl = AppString.BASE_URL + AppString.UPDATE_DOCUMENT;
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);

  final docNameController = TextEditingController().obs;
  var pickedImage = Rx<XFile?>(null);
  // uploadDocument1(String filePath, context) async {
  //   waitingLoader();
  //   var id = Get.find<DocumentController>()
  //           .documentModel
  //           .data
  //           ?.documents
  //           ?.first
  //           .id
  //           .toString() ??
  //       "";
  //
  //   var request = http.MultipartRequest(AppString.POST, Uri.parse(baseUrl));
  //   request.fields['id'] = id.toString();
  //   request.fields['name'] = docNameController.value.text;
  //   request.fields['file'] = filePath;
  //   request.fields['user_id'] = _box.read(AppString.ID_STORE).toString();
  //
  //   var file = File(filePath);
  //   request.files.add(await http.MultipartFile.fromPath('file', file.path,
  //       filename: docNameController.value.text));
  //   request.headers['Authorization'] = 'Bearer $accessToken';
  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     Get.back();
  //     Get.back();
  //     _showToast(AppString.text_document_update_successfully);
  //     Get.find<DocumentController>().getDocumentData();
  //
  //
  //   } else {
  //     return 'Error update image ::: ${response.statusCode}';
  //   }
  //
  //   Get.back();
  // }


    var id = Get.find<DocumentController>()
            .documentModel
            .data
            ?.documents
            ?.first
            .id
            .toString() ??
        "";



  Rx<File?> selectedFile = Rx<File?>(null);

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      selectedFile.value = file;
    }
  }



  Future<void> uploadDocument({required context}) async {


    waitingLoader();
    File? file = selectedFile.value;
    if (file == null) {
      return;
    }
    final url = Uri.parse(baseUrl);

    var request = http.MultipartRequest('POST', url);


    request.fields['id'] = _box.read(AppString.STORE_DOC_Id).toString();

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

_showToast(message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.hintColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
