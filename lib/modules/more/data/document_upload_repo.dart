import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_upload_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../presentation/controller/document_controller.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';


class DocumentUploadRepo{
  final _box = GetStorage();
  var baseUrl = AppString.BASE_URL + AppString.DOCUMENT_UPLOAD;
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);
  Rx<File?> selectedFile = Rx<File?>(null);
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      selectedFile.value = file;
    }


  }


  Future uploadDocumentRepo({required  fileName}) async {
    File? file = selectedFile.value;

    try {
      var request = http.MultipartRequest("POST", Uri.parse(baseUrl));
      request.fields['name'] = fileName;
      request.fields['file'] = file?.path ??"";
      request.fields['user_id'] = _box.read(AppString.ID_STORE).toString();
      request.headers['Authorization'] = 'Bearer $accessToken';

      request.files.add(await http.MultipartFile.fromPath('file',file?.path ??""));
      var response = await request.send();



      if (response.statusCode == 200) {
        print("Called ::: ${response}");
        Get.back();
        print(AppString.text_document_upload_successfully);
        Get.find<DocumentController>().getDocumentData();
       // showToast(AppString.text_document_upload_successfully);
      } else {
        return '${response.statusCode}';
      }
    } catch (ex) {
      print("Upload document called ::: $ex");
    }
  }
}