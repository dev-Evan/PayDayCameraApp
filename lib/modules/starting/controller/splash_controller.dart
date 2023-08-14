import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class SplashController extends GetxController {
  final box = GetStorage();
  @override
  void onReady() {
    _swapLogo();
    _logoLayout();
    Future.delayed(const Duration(milliseconds: 880), ()=>chooseScreen());
    super.onReady();
  }

  RxInt width = 120.obs;
  RxInt height = 120.obs;
  RxBool status = false.obs;


  _swapLogo() {
    status.value = true;
  }
  _logoLayout() {
    width = 18.obs;
    height = 18.obs;
  }

  Future chooseScreen() async {
    final idStore = box.read(AppString.ID_STORE);
    dynamic remValue = box.read(AppString.REMEMBER_KEY);
    dynamic logValue = box.read(AppString.LOGIN_CHECK_KEY);
    if (idStore == null) {
      Get.toNamed(Routes.ONBOARD_SCREEN);
    } else if (logValue != null && remValue != null) {
      Get.toNamed(Routes.HOME);
    } else {
      Get.toNamed(Routes.SIGN_IN);
    }
  }
}