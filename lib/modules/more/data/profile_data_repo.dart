import 'package:get/get.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../../utils/app_string.dart';
import '../domain/user_profile.dart';

class ProfileDataRepository {
  final NetworkClient networkClient;

  ProfileDataRepository(this.networkClient);

  Future<UserProfile> getUserProfileData() async {
    try {
      Response response =
      await networkClient.getRequest(AppString.USER_PROFILE);
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        return UserProfile.fromJson(response.body as Map<String, dynamic>);
      }
    } catch (e) {
      return Future.error(ErrorModel(message: e.toString()));
    }
  }
}


