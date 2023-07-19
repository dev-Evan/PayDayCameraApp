import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/sockets_io.dart';
import 'package:pay_day_mobile/common/widget/network_error_pop_up.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';

import '../../utils/logger.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  final isDialogIsOpened = false.obs;

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen(
        (connectivityResult) => _updateConnectivity(connectivityResult));
    super.onInit();
  }

  void _updateConnectivity(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      LoggerHelper.infoLog(message: "Lost Internet");
      Get.to(const NetworkErrorPage());
      isDialogIsOpened(true);
    } else {
      LoggerHelper.infoLog(message: "Connected");
      if (isDialogIsOpened.isTrue) {
        Get.offAllNamed(Routes.HOME);
      }
      isDialogIsOpened(false);
    }
  }
}
