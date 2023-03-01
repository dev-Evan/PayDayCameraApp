import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AuthHelper {
  final box = GetStorage();

  Future logIn(email, password, context) async {
    String _url = AppString.BASE_URL;
    var Url = _url + "/login";




    try {
      http.Response response = await http.post(Uri.parse(Url), body: {
        'email': email,
        'password': password,
      });
      var data1 = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        print(data1);

        if (data1['status'] == true) {
          print(response.statusCode);
          var storeId = data1['data']['id'];
          box.write("store", storeId);
          Get.toNamed(attendLog);
          Fluttertoast.showToast(
              msg: "${data1['message']}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: AppColor.hintColor,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        Fluttertoast.showToast(
            msg: "${data1['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColor.errorColor,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.errorColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
