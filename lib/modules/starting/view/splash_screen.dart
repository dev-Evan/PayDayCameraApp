import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/images.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  bool isLoad = false;
  final box = GetStorage();

  Future chooseScreen() async {
    final idStore = box.read(AppString.idStore);
    dynamic remValue = box.read(AppString.rememberKey);
    dynamic logValue = box.read(AppString.loginCheckKey);
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
      isLoad = !isLoad;
    });
  }

  var _width = AppLayout.getWidth(104.0);
  var _height = AppLayout.getHeight(70.0);

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      isMove();
    });

    Future.delayed(const Duration(seconds: 3), () {
      chooseScreen();
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _width = AppLayout.getWidth(28.0);
        _height = AppLayout.getHeight(45.0);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _heightf = MediaQuery.of(context).size.height;
    double _widthf = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: _widthf,
          height: _heightf,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                alignment: isLoad ? Alignment.topCenter : Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: _width,
                  height: _height,
                  child: Image.asset(Images.logo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
