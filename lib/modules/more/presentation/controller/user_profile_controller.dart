import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:pay_day_mobile/modules/more/domain/user_profile.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class UserProfileController extends GetxController {
  var baseUrl = AppString.BASE_URL+AppString.userProfile;
  final storeToken=AppString.storeToken;
  final _connect = GetConnect();
  UserProfile? userProfile;
  RxBool loading = false.obs;
  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }
  void getProfileData() async {
    loading(true);
    final response =
    await _connect.get(baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': "*",
        'Authorization': 'Bearer 8|7nHfQDGfMZI02MIS5ATw97rGwI0hipRhmvlyXWRp',
        // 'Authorization': 'Bearer $storeToken',

      },

    );
    var json = response.body;
    userProfile = UserProfile.fromJson(json);
    loading(false);
    print(json);


  }
}
