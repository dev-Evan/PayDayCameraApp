// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:pay_day_mobile/utils/app_string.dart';
//
// class LogoutController extends GetxController {
//   var isLoggedIn = false.obs;
//   var baseUrl = AppString.BASE_URL + AppString.LOG_OUT;
//
//   var users=[].obs;
//   @override
//   void onInit() async {
//     logout();
//     super.onInit();
//   }
//
//   Future<void> logout() async {
//     try {
//       final response = await http.get(Uri.parse('https://payday.php8.gainhq.com/api/logout'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Access-Control-Allow-Origin': "*",
//           'Authorization': 'Bearer 22|GGwGszcGH4zlgz3BV4YR5GMOAEvMT1GURpzXzfjR',
//           // 'Authorization': 'Bearer $storeToken',
//         },
//
//       );
//       final jsonData = jsonDecode(response.body);
//       users.value = jsonData; // update users observable with fetched data
//     } catch (e) {
//       // handle error
//       print(e.toString());
//     }
//
//   }
// }
//
//
