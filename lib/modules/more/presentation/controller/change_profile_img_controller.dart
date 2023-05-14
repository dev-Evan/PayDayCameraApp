import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class ImagePickerController extends GetxController {
  var baseUrl = AppString.BASE_URL + AppString.USER_CHANGE_PICTURE;
  final _box = GetStorage();
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);
  var pickedImage = Rx<XFile?>(null);

  Future<void> pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      pickedImage.value = image;
      await sendImage(image);
    }
  }

  Future<void> sendImage(XFile image) async {
    print(image.path);
    try {
      final request = http.MultipartRequest('POST', Uri.parse(baseUrl));
      request.headers['Authorization'] =
          'Bearer $accessToken';
      request.fields['profile_picture'];
      request.files.add(
          await http.MultipartFile.fromPath('profile_picture', image.path));
      final response = await request.send();
      if (response.statusCode == HttpStatus.ok) {
        print('Image uploaded successfully!');
      } else {
        print('Failed to upload image!');
      }
    } catch (ex) {
      print(ex.toString());
    }
  }
}
