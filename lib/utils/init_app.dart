import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_interface.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_source.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';

import '../network/network_client.dart';

Future<void> initApp() async {
  Get.lazyPut<AuthDataInterface>(() => AuthDataSource(NetworkClient()));

  Get.lazyPut(() => AuthController(), fenix: true);
}
