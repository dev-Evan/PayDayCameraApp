import 'package:get/get.dart';

import '../utils/app_string.dart';
// <<<<<<< HEAD
// import 'package:pay_day_mobile/utils/app_string.dart';
//
// // const String baseUrl = "base_url/api";
// const String baseUrl = AppString.BASE_URL;
// =======

var baseUrl = AppString.BASE_URL;


class NetworkClient extends GetConnect {

  Future<Response> getRequest(String apiEndPoint) async {
    return await get(_getRequestUrl(apiEndPoint), headers: {

      "Content-Type": "application/json",
      "Accept": "application/json"
    }).timeout(const Duration(seconds: 20));
  }

  Future<Response> postRequest(String apiEndPoint, dynamic payload) async {
    Response response = await post(_getRequestUrl(apiEndPoint), payload,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }).timeout(const Duration(seconds: 20));
    return response;
  }

  String _getRequestUrl(String apiEndPoint) => baseUrl + apiEndPoint;
}
