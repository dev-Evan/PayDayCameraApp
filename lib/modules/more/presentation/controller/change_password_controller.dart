import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class AuthController {
  final box = GetStorage();
  String url = AppString.BASE_URL;

  Future signUp(oldPassword,
      newPassword,
      confirmPassword,) async {
    var Url = url + "/user/change-password";
    try {
      http.Response response = await http.post(Uri.parse(Url), body: {
        'old_password': oldPassword,
        'password': newPassword,
        'password_confirmation': confirmPassword,

      },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': "*",
          'Authorization': 'Bearer 8|7nHfQDGfMZI02MIS5ATw97rGwI0hipRhmvlyXWRp',
          // 'Authorization': 'Bearer $storeToken',

        },);
      var signUpData = jsonDecode(response.body.toString());
      print(signUpData);

      if (response.statusCode == 200) {
        print(response.body);
        print("${'message'}");

      } else {

      }
    } catch (e) {

    }
  }
}
