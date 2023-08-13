import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoad = false;
  final box = GetStorage();

  Future chooseScreen() async {
    final idStore = box.read(AppString.ID_STORE);
    dynamic remValue = box.read(AppString.REMEMBER_KEY);
    dynamic logValue = box.read(AppString.LOGIN_CHECK_KEY);
    if (idStore == null) {
      Get.toNamed(Routes.ONBOARD_SCREEN);
    }else if (logValue != null && remValue != null) {
      Get.toNamed(Routes.HOME);
    }else {
      Get.toNamed(Routes.SIGN_IN);
    }
  }

  isMove() {
    setState(() {
      _isLoad = !_isLoad;
    });
  }

  var _width = AppLayout.getWidth(100.0);
  var _height = AppLayout.getHeight(100.0);

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 818), () {
      isMove();
    });

    Future.delayed( const Duration(milliseconds: 1700), () {
      chooseScreen();
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _width = AppLayout.getWidth(23.0);
        _height = AppLayout.getHeight(23.0);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            _containerLayout(height: _height,width: _width,isLoad: _isLoad)
          ],
        ),
      ),
    );
  }
}

Widget _containerLayout({isLoad,width,height}){
  return AnimatedContainer(
    duration: const Duration(milliseconds: 900),
    alignment: isLoad ? Alignment.topCenter : Alignment.center,
    child: _animatedLogo(height: height,width: width),
  );
}

Widget _animatedLogo({required height,required width}){
  return AnimatedContainer(
      duration:  const Duration(milliseconds: 900),
      width: width,
      height: height,
      child: _logoView(logo: Images.favIcon)
  );

}

Widget _logoView({required logo}){
  return  SvgPicture.asset(
    logo.toString(),

  );
}