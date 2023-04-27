import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/utils/app_string.dart';


class DocumentUploadController extends GetxController {
  var baseUrl = AppString.BASE_URL+AppString.DOCUMENT_UPLOAD;
  final _box = GetStorage();
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);

  var pickedImage = Rx<XFile?>(null);
  uploadImage(String filePath, String fileName,) async {
    var request = http.MultipartRequest(AppString.POST, Uri.parse(baseUrl));
    request.fields['name'] = fileName;
    request.fields['file'] = filePath;
    request.fields['user_id'] =_box.read(AppString.idStore);
    var file = File(filePath);
    request.files.add(await http.MultipartFile.fromPath('file', file.path, filename: fileName));
    request.headers['Authorization'] = 'Bearer $accessToken';
    var response = await request.send();
    if (response.statusCode == 200) {
      print("ok");

    } else {
      return 'Error uploading image: ${response.statusCode}';
    }
  }

}