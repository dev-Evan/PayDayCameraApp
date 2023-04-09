// import 'package:get/get.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
// import 'package:get_storage/get_storage.dart';
//
//
// class NetworkClient extends GetConnect {
//   Future<Response> getRequest(String apiEndPoint) async {
//     return await get(_getRequestUrl(apiEndPoint), headers: {
//       "Content-Type": "application/json",
//       "Accept": "application/json",
//       "Authorization": GetStorage().read(AppString.ACCESS_TOKEN) != null
//           ? "Bearer ${GetStorage().read(AppString.ACCESS_TOKEN)}"
//           : "Bearer 34|jLoLoZwDOREPNdzTUU4y8h3kZz93ngMslgogb0l6"
//     }).timeout(const Duration(seconds: 20));
//   }
//
//   Future<Response> postRequest(String apiEndPoint, dynamic  body) async {
//
//         await post(_getRequestUrl(apiEndPoint),
//             body,
//             headers: {
//       "Content-Type": "application/json",
//       "Accept": "application/json; charset=UTF-8",
//       "Authorization": GetStorage().read(AppString.ACCESS_TOKEN) != null
//           ? "Bearer ${GetStorage().read(AppString.ACCESS_TOKEN)}"
//           : ""
//     }).timeout(const Duration(seconds: 20));
//
//
//
//
//
//
//     Response response = await post(_getRequestUrl(apiEndPoint), body,
//
//         headers: {
//           "Content-Type": "application/json",
//           "Accept": "application/json"
//         }).timeout(const Duration(seconds: 20));
//
//     return response;
//   }
//
//   String _getRequestUrl(String apiEndPoint) => AppString.BASE_URL + apiEndPoint;
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:get_storage/get_storage.dart';


class NetworkClient extends GetConnect {
  Future<Response> getRequest(String apiEndPoint) async {
    return await get(_getRequestUrl(apiEndPoint), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer 38|oY2k6j3XyK7XZ2jYHhaKDKiCr4EcLj7RVqinb1xt"
    }).timeout(const Duration(seconds: 20));
  }

  Future<Response> postRequest(String apiEndPoint, dynamic  body) async {

    await post(_getRequestUrl(apiEndPoint),
        body,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json; charset=UTF-8",
          "Authorization": "Bearer 40|MOhcg9DoLwGRppa5RYCmEv9BARvBWBJU7C4sr5Iv"
        }).timeout(const Duration(seconds: 20));






    Response response = await post(_getRequestUrl(apiEndPoint), body,

        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        "Authorization": "Bearer 40|MOhcg9DoLwGRppa5RYCmEv9BARvBWBJU7C4sr5Iv"

        }).timeout(const Duration(seconds: 20));

    return response;
  }

  String _getRequestUrl(String apiEndPoint) => AppString.BASE_URL + apiEndPoint;
}
