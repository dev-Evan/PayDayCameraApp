import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/error_alert_pop_up.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen(
        (connectivityResult) => _updateConnectivity(connectivityResult));
    super.onInit();
  }

  void _updateConnectivity(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      print("Lost Internet");
      errorAlertPopup(() {});
    } else {
      print("Connected");
      Get.back(canPop: false);
    }
  }
}
