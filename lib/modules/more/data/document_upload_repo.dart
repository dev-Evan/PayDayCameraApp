import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_upload_controller.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../presentation/controller/document_controller.dart';
import 'package:http/http.dart' as http;


class DocumentUploadRepo{
  final _box = GetStorage();
  var baseUrl = AppString.BASE_URL + AppString.DOCUMENT_UPLOAD;
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);

Future uploadDocumentRepo({required  filePath, required fileName,}) async {
  try {
    var request = http.MultipartRequest(AppString.POST, Uri.parse(baseUrl));
    request.fields['name'] = fileName.toString();
    request.fields['file'] = filePath;
    request.fields['user_id'] = _box.read(AppString.ID_STORE).toString();
    var file = File(filePath);
    request.files.add(await http.MultipartFile.fromPath('file', file.path,
        filename: fileName.toString()));
    request.headers['Authorization'] = 'Bearer $accessToken';
    var response = await request.send();

    if (response.statusCode == 200) {
      Get.back();
      print(AppString.text_document_upload_successfully);
      Get.find<DocumentController>().getDocumentData();
      showToast(AppString.text_document_upload_successfully);
    } else {
      return '${response.statusCode}';
    }
  } catch (ex) {
    print("Upload document called ::: $ex");
  }
}
}