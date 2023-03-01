import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/common/button.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class onboardingScreen extends StatefulWidget {
  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {
  List _onboardingImage = [
    Images.calendar,
    Images.mobile,
    Images.mobile,
  ];

  List _title = [
    AppString.onboardTileMainAttend,
    AppString.onboardTileEasy,
    AppString.onboardTileReceivePay,
  ];

  List _description = [
    AppString.onboardTileMainAttendDes,
    AppString.onboardTileEasyDes,
    AppString.onboardTileReceivePayDes,
  ];

  RxInt _currentIndex = 0.obs;

  bool isleft = false;

  leftRight() {
    setState(() {
      isleft = !isleft;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 100), () {
      leftRight();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 5;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppLayout.getHeight(50)),
              Container(
                  height: _height,
                  width: _width,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          alignment:
                              isleft ? Alignment.topCenter : Alignment.topRight,
                          child: Image.asset(Images.app_logo),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ],
                  )),

              Obx(
                () => Expanded(
                    flex: 2,
                    child: Center(
                        child: Image.asset(
                            _onboardingImage[_currentIndex.toInt()]))),
              ),

              SizedBox(height: AppLayout.getHeight(25)),

              Obx(
                () => Text(
                  '${_title[_currentIndex.toInt()]}',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeLarge,
                      color: AppColor.normalTextColor),
                ),
              ),
              // SizedBox(height: 10.h,),
              SizedBox(height: AppLayout.getHeight(20)),

              Obx(() => Text(
                    '${_description[_currentIndex.toInt()]}',
                    style: GoogleFonts.poppins(
                        fontSize: Dimensions.fontSizeMid,
                        fontWeight: FontWeight.w300),
                  )),

              SizedBox(height: AppLayout.getHeight(20)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => DotsIndicator(
                      dotsCount: _onboardingImage.length,
                      position: _currentIndex.toDouble(),
                      decorator: DotsDecorator(
                        color: AppColor.disableColor,
                        activeColor: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppLayout.getHeight(30)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Get.toNamed(signIn),
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                          fontSize: Dimensions.fontSizeMid,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  CustomSmallButton(" Next ", () {
                    if (_currentIndex == _title.length - 1) {
                      Get.toNamed(signIn);
                    } else {
                      _currentIndex + 1;
                    }
                  }),
                ],
              )
            ],
          ),
        ));
  }
}
