import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pay_day_mobile/modules/more/domain/logout_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../data/log_out_repo.dart';

class LogoutController extends GetxController with StateMixin {

  LogoutRepository logoutRepository=LogoutRepository(NetworkClient());

  LogoutModel? logoutModel;

  logOut() async {
    change(null, status: RxStatus.loading());
    try {
      await logoutRepository.getLogoutRepoData().then((value) {
        print(value);
        logoutModel = value;
          SystemNavigator.pop();
      }, onError: (error) {
        print(error.message);
      });

      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }

}


