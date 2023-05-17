import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class UpdateDocumentController extends GetxController {
  final _box = GetStorage();
  var baseUrl = AppString.BASE_URL + AppString.UPDATE_DOCUMENT;
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);

  final docNameController = TextEditingController().obs;
  var pickedImage = Rx<XFile?>(null);
  uploadDocument(String filePath) async {
    var id=Get.find<DocumentController>().documentModel.data?.documents?.first.id.toString()??"";

    var request = http.MultipartRequest(AppString.POST, Uri.parse(baseUrl));
    request.fields['id'] = id.toString();
    request.fields['name'] = docNameController.value.text;
    request.fields['file'] = filePath;
    request.fields['user_id'] = _box.read(AppString.ID_STORE).toString();
    var file = File(filePath);
    request.files.add(await http.MultipartFile.fromPath('file', file.path,
        filename: docNameController.value.text));
    request.headers['Authorization'] = 'Bearer $accessToken';
    var response = await request.send();
    if (response.statusCode == 200) {
      print(AppString.text_document_update_successfully);
      _showToast(AppString.text_document_update_successfully);
      Get.find<DocumentController>()
          .getDocumentData();
            Get.back();

    } else {
      return 'Error update image ::: ${response.statusCode}';
    }
  }


}
_showToast(message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColor.hintColor,
    textColor: Colors.white,
    fontSize: 16.0);