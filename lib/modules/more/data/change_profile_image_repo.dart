import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:http/http.dart' as http;

class ChangeProfileImageRepo{
  var baseUrl = AppString.BASE_URL + AppString.USER_CHANGE_PICTURE;
  final _box = GetStorage();
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);

  Future changeImageRepo({required XFile image}) async {
    try {
          final request = http.MultipartRequest('POST', Uri.parse(baseUrl));
          request.headers['Authorization'] =
          'Bearer $accessToken';
          request.fields['profile_picture'];
          request.files.add(
              await http.MultipartFile.fromPath('profile_picture', image.path));
          final response = await request.send();
          if (response.statusCode == HttpStatus.ok) {
            print('Change profile ::: Image uploaded successfully!');
          } else {
            print('Failed to upload image!');
          }
    } catch (ex) {
      print("Upload document called ::: $ex");
    }
  }










}