import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/domain/change_password.dart';
import 'package:pay_day_mobile/modules/more/domain/change_profile_img.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../common/domain/error_model.dart';
import '../domain/edit_profile_model.dart';
import '../domain/user_profile.dart';

class ProfileDataRepository {
  final NetworkClient networkClient;

  ProfileDataRepository(this.networkClient);
  var baseUrl = Api.BASE_URL + Api.USER_CHANGE_PICTURE;
  final _box = GetStorage();
  late var accessToken = _box.read(AppString.ACCESS_TOKEN);




  Future<UserProfile> getUserProfileData() async {
    try {
      Response response =
      await networkClient.getRequest(Api.USER_PROFILE);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print('User profile called ::: ${response.body.toString()}');
        return UserProfile.fromJson(response.body);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }


  Future<ChangePasswordModel> changePassIntoAccount(String oldPassword,String password,String confirmPassword) async {
    try {
      Response  response = await networkClient.postRequest(
        Api.USER_CHANGE_PASSWORD,
        {
          "old_password":oldPassword,
          "password":password,
          "password_confirmation":confirmPassword
        },
      );
      print(response.body.toString());
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print(response.body.toString());
        return ChangePasswordModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }


  Future<EditProfileModel> editProfileRepo(String firstName, String lastName, String email, String contact, String dateOfBirth, String gender, String aboutMe, String address,) async {
    try {
      Response response = await networkClient.postRequest(
        Api.UPDATE_PROFILE_DATA,
        {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "contact": contact,
          "date_of_birth": dateOfBirth,
          "gender": gender,
          "about_me": aboutMe,
          "address": address
        },
      );
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print('Edit profile called ::: ${response.body.toString()}');

        return EditProfileModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));

    }
  }


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


