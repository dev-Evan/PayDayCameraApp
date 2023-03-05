import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/data/auth_data_interface.dart';
import 'package:pay_day_mobile/modules/auth/domain/login_res.dart';

class AuthController extends GetxController {

  AuthDataInterface _authDataInterface = Get.find<AuthDataInterface>();

  final box = GetStorage();

  login(String email,String password) async {
    Login _login =
        await _authDataInterface.login(email: email, password: password);

  }
}
