import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pay_day_mobile/common/domain/error_model.dart';
import 'package:pay_day_mobile/modules/more/domain/edit_profile_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';


class EditProfileDataSource {
  final NetworkClient networkClient;
  EditProfileDataSource(this.networkClient);
  Future<EditProfileModel> editProfileRepo(
    String firstName,
    String lastName,
    String email,
    String contact,
    String dateOfBirth,
    String gender,
    String aboutMe,
    String address,
  ) async {
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
}
