import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/error_alert.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLeft = false;
  bool _rememberMe = false;

  leftRight() {
    setState(() {
      _isLeft = !_isLeft;
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      leftRight();
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 5;
    double _width = MediaQuery.of(context).size.width;
    final box = GetStorage();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.paddingLarge),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    customSpacerHeight(height: 30),


                    SizedBox(
                        height: _height,
                        width: _width,
                        child: Stack(
                          children: [
                            _containerLayout(isLeft: _isLeft),
                          ],
                        )),
                    _bodyContent(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textFieldTitle(titleText: AppString.email),
                        CustomTextFeild(
                          hintText: AppString.enterYourEmail,
                          inputType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppString.fieldIsRequired;
                            }
                          },
                        ),
                      ],
                    ),

                    customSpacerHeight(height:Dimensions.fontSizeLarge),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _textFieldTitle(titleText: AppString.password),
                        CustomPasswordTextField(
                          hintText: AppString.enterYourPassword,
                          inputType: TextInputType.emailAddress,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppString.fieldIsRequired;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    customSpacerHeight(height: Dimensions.fontSizeLarge),
                    Wrap(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  visualDensity: const VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radiusSmall)),
                                  value: _rememberMe,
                                  onChanged: (bool? rememberMe) {
                                    setState(() {
                                      this._rememberMe = rememberMe!;
                                      if (rememberMe == true) {
                                        box.write(AppString.rememberKey,
                                            AppString.rememberValue);
                                      }
                                    });
                                  },
                                ),
                                _rememberText()
                              ],
                            ),
                            _forgotButton()
                          ],
                        ),
                      ],
                    ),
                    customSpacerHeight(height:Dimensions.fontSizeExtraLarge),
                    CustomButton(AppString.text_log_in, () {
                      Get.find<AuthController>().logIn(
                          _emailController.text.toString(),
                          _passwordController.text);
                    })
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

Widget _containerLayout({isLeft}) {
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

Widget _rememberText() {
  return Text(
    AppString.text_remember_me,
    style: AppStyle.normal_text_grey.copyWith(
      color: AppColor.normalTextColor.withOpacity(0.7),
    ),
  );
}

Widget _forgotButton() {
  return TextButton(
      onPressed: () => Get.toNamed(AppString.forgotScreen),
      child: Text(AppString.text_forgot_password,
          style: GoogleFonts.poppins(
              fontSize: Dimensions.fontSizeDefault,
              color: AppColor.primaryColor)));
}

Widget _bodyContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppString.login,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w800, fontSize: Dimensions.fontSizeLarge),
      ),
      SizedBox(
          height: AppLayout.getHeight(
        Dimensions.fontSizeMid,
      )),
      Text(
        AppString.hi_login_to_your_dashboard,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: Dimensions.fontSizeMid,
            color: AppColor.hintColor,
            letterSpacing: 0.3),
      ),
      SizedBox(
          height: AppLayout.getHeight(
        Dimensions.fontSizeLarge,
      )),
    ],
  );
}

Widget _textFieldTitle({titleText}) {
  return Text(
    titleText,
    style: GoogleFonts.poppins(
        fontSize: Dimensions.fontSizeMid,
        fontWeight: FontWeight.w600,
        color: AppColor.hintColor),
  );
}
