import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/error_alert_pop_up.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isleft = false;
  bool? rememberMe = false;

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
                    SizedBox(height: AppLayout.getHeight(30)),
                    SizedBox(
                        height: _height,
                        width: _width,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                alignment: isleft
                                    ? Alignment.topCenter
                                    : Alignment.topRight,
                                curve: Curves.easeInOut,
                                child: Image.asset(Images.app_logo),
                              ),
                            ),
                          ],
                        )),
                    Text(
                      AppString.login,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: Dimensions.fontSizeLarge),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.email,
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.fontSizeMid,
                              fontWeight: FontWeight.w600,
                              color: AppColor.hintColor),
                        ),
                        CustomTextFeild(
                          hintText: AppString.enterYourEmail,
                          inputType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppString.fieldIsRequired;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                        height: AppLayout.getHeight(
                      Dimensions.fontSizeLarge,
                    )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.password,
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.fontSizeMid,
                              fontWeight: FontWeight.w600,
                              color: AppColor.hintColor),
                        ),
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
                    SizedBox(
                        height: AppLayout.getHeight(
                      Dimensions.fontSizeLarge,
                    )),
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
                              value: rememberMe,
                              onChanged: (bool? rememberMe) {
                                setState(() {
                                  this.rememberMe = rememberMe;
                                  if (rememberMe == true) {
                                    box.write(AppString.rememberKey,
                                        AppString.rememberValue);
                                  }
                                });
                              },
                            ),
                            TextButton(
                                onPressed: () =>
                                    Get.toNamed(AppString.forgotScreen),
                                child: Text('Remember me',
                                    style: GoogleFonts.poppins(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: AppColor.primaryColor)))
                          ],
                        ),
                        TextButton(
                            onPressed: () =>
                                Get.toNamed(AppString.forgotScreen),
                            child: Text('Forgot password?',
                                style: GoogleFonts.poppins(
                                    fontSize: Dimensions.fontSizeSmall,
                                    color: AppColor.primaryColor))),
                      ],
                    ),
                    SizedBox(
                        height: AppLayout.getHeight(
                      Dimensions.fontSizeExtraLarge,
                    )),
                    CustomButton('Log In', () {
                      Get.find<AuthController>().logIn(
                          _emailController.text,
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
