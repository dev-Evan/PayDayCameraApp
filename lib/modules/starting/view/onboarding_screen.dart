import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/sign_in.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List _onboardImage = [
    Images.calendar,
    Images.mobile,
    Images.mobile,
  ];

  final List _title = [
    AppString.onboardTileMainAttend,
    AppString.onboardTileEasy,
    AppString.onboardTileReceivePay,
  ];

  final List _description = [
    AppString.onboardTileMainAttendDes,
    AppString.onboardTileEasyDes,
    AppString.onboardTileReceivePayDes,
  ];

  final RxInt _currentIndex = 0.obs;

  bool isleft = false;

  leftRight() {
    setState(() {
      isleft = !isleft;
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
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
              SizedBox(
                  height: _height,
                  width: _width,
                  child: Stack(
                    children: [_headerLayout(isLeft: isleft)],
                  )),
              Obx(
                () => Expanded(
                    flex: 2,
                    child: Center(
                        child:
                            Image.asset(_onboardImage[_currentIndex.toInt()]))),
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
              customSpacerH(height: 20),
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
                      dotsCount: _onboardImage.length,
                      position: _currentIndex.toDouble(),
                      decorator: const DotsDecorator(
                          color: AppColor.disableColor,
                          activeColor: AppColor.primaryColor,
                          size: Size.square(8.0),
                          activeSize: Size(16.0, 7),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(5.0),
                                  left: Radius.circular(5.0)))),
                    ),
                  ),
                ],
              ),
              customSpacerH(height: 30),
              _buttonLayout(
                  context: context,
                  titleText: _title,
                  currentIndex: _currentIndex)
            ],
          ),
        ));
  }
}

Widget _skipButton({context}) {
  return TextButton(
    onPressed: () =>
        CustomNavigator(context: context, pageName: const SignInScreen()),
    child: Text(
      AppString.text_skip,
      style: GoogleFonts.poppins(
          fontSize: Dimensions.fontSizeMid,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w600),
    ),
  );
}

Widget _buttonLayout({context, currentIndex, titleText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _skipButton(context: context),
      CustomSmallButton(AppString.text_next, () {
        if (currentIndex == titleText.length - 1) {
          CustomNavigator(context: context, pageName: const SignInScreen());
        } else {
          currentIndex + 1;
        }
      }),
    ],
  );
}

Widget _headerLayout({isLeft}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      alignment: isLeft ? Alignment.topCenter : Alignment.topRight,
      curve: Curves.easeInOut,
      child: Image.asset(Images.app_logo),
    ),
  );
}
