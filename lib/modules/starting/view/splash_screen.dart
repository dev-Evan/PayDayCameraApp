import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/starting/controller/splash_controller.dart';
import 'package:pay_day_mobile/utils/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bodyH = MediaQuery.of(context).size.height;
    double bodyW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: bodyW,
          height: bodyH,
          child: Stack(
            children: [Obx(() => _animatedContainer())],
          ),
        ),
      ),
    );
  }

  _animatedContainer() {
    SplashController controller = Get.put(SplashController());
    return AnimatedContainer(
      alignment:
          controller.status.isTrue ? Alignment.topCenter : Alignment.center,
      duration: _duration(),
      curve: _curve(),
      child: _animatedLogoLayout(),
    );
  }

  _animatedLogoLayout() {
    SplashController controller = Get.put(SplashController());
    return AnimatedContainer(
      height: controller.height.toDouble(),
      width: controller.width.toDouble(),
      curve: _curve(),
      duration: _duration(),
      child: _logoView(logo: Images.favIcon),
    );
  }

  _duration() {
    return const Duration(milliseconds: 1200);
  }

  _curve() {
    return Curves.fastOutSlowIn;
  }
}

_logoView({required logo}) {
  return SvgPicture.asset(
    logo.toString(),
  );
}
