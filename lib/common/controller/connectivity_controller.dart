import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/network_error_pop_up.dart';

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
      networkErrorAlertPopup();
    } else {
      print("Connected");
      Get.back(canPop: false);
    }
  }
}
