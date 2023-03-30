// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:get/get_connect.dart';
// import 'package:pay_day_mobile/modules/more/domain/user_profile.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
//
// class UserProfileController extends GetxController {
//   var baseUrl = AppString.BASE_URL+AppString.USER_PROFILE;
//   final storeToken=AppString.storeToken;
//   final _connect = GetConnect();
//   UserProfile? userProfile;
//   RxBool loading = false.obs;
//   @override
//   void onInit() {
//     getProfileData();
//     super.onInit();
//   }
//   void getProfileData() async {
//     loading(true);
//     final response =
//     await _connect.get(baseUrl,
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Access-Control-Allow-Origin': "*",
//         'Authorization': 'Bearer 20|NCBmTPCCKgjnjRYnNnHvau84r9bBaDkEhnwnkwKD',
//         // 'Authorization': 'Bearer $storeToken',
//       },
//     );
//     var json1 = response.body ;
//     print(response.body);
//     userProfile =UserProfile.fromJson(json1);
//
// //     if(response.body==null) {
// // print('error');
// //     }else{
// //       userProfile = UserProfile.fromJson(json.decode(response.body));
// //
// //     }
//     loading(false);
//     print(json1);
//   }
// }
