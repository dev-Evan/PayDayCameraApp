import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/modules/more/data/log_out_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/logout_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../utils/exception_handler.dart';
import '../../../../routes/app_pages.dart';

class LogoutController extends GetxController with StateMixin {
  LogoutRepository logoutRepository = LogoutRepository(NetworkClient());
  final _box = GetStorage();
  final isLoading=false.obs;
  LogoutModel logoutModel = LogoutModel();
  logOut() async {
    isLoading(true);
      await logoutRepository.getLogoutRepoData().then((value) {
        logoutModel = value;
        isLoading(false);
        _box.remove(AppString.STORE_TOKEN);
        _box.remove(AppString.REMEMBER_KEY);
        _box.remove(AppString.LOGIN_CHECK_KEY);
        Get.offAllNamed(Routes.SIGN_IN);
        Get.put(AuthController());
      }, onError: (error) {
        isLoading(false);
        ExceptionHandler().errorChecker(error);
      });
    isLoading(false);
  }
}
