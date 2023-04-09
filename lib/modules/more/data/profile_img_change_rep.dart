import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../domain/change_profile_img.dart';

class ProfilePicChangeRepository {
  NetworkClient networkClient;

  ProfilePicChangeRepository(this.networkClient);

  Future getProfilePicChange(profileImage) async {
    try {
      Response response =
          await networkClient.postRequest(AppString.USER_CHANGE_PICTURE, {
          "profile_picture": profileImage,
      });
      if (response.status.hasError) {
        return Future.error(ErrorModel.fromJson(response.body));
      } else {
        print("ok");
        return ProfileImageModel.fromJson(response.body);
      }
    } catch (ex) {
      return Future.error(ErrorModel(message: ex.toString()));
    }
  }
}
