import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/sign_in.dart';
import 'package:pay_day_mobile/modules/home/presentation/home.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/images.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoad = false;
  final box = GetStorage();

  Future chooseScreen() async {
    dynamic idStore = box.read(AppString.ID_STORE);
    dynamic remValue = box.read(AppString.REMEMBER_KEY);
    dynamic logValue = box.read(AppString.LOGIN_CHECK_KEY);

    if (idStore == null) {
      Get.toNamed(AppString.onboardScreen);
    } else if (logValue != null && remValue != null) {
      Get.toNamed(AppString.home);
    } else {
      Get.toNamed(AppString.signInScreen);
    }
  }

  isMove() {
    setState(() {
      _isLoad = !_isLoad;
    });
  }

  var _width = AppLayout.getWidth(100.0);
  var _height = AppLayout.getHeight(70.0);

  @override
  void initState() {
    logoSwipe();
    logoSwipeHW();
    nextPage();
    super.initState();
  }

  logoSwipe() async {
    await Future.delayed(const Duration(milliseconds: 810), () {
      isMove();
    });
  }

  nextPage() async {
    await Future.delayed(const Duration(milliseconds: 1645), () {
      chooseScreen();
    });
  }

  logoSwipeHW() async {
    await Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        _width = AppLayout.getWidth(22.0);
        _height = AppLayout.getHeight(30.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double bodyH = MediaQuery.of(context).size.height;
    double bodyW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: bodyW,
          height: bodyH,
          child: Stack(
            children: [
              _containerLayout(height: _height, width: _width, isLoad: _isLoad)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _containerLayout({isLoad, width, height}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 900),
    alignment: isLoad ? Alignment.topCenter : Alignment.center,
    child: _animatedLogo(height: height, width: width),
  );
}

Widget _animatedLogo({required height, required width}) {
  return AnimatedContainer(
      duration: const Duration(milliseconds: 900),
      child: _logoView(logo: Images.favIcon));
}

Widget _logoView({required logo}) {
  return SvgPicture.asset(
    logo.toString(),
    width: 40,
    height: 40,
  );
}
