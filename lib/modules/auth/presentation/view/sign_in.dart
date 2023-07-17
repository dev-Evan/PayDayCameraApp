import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/modules/auth/presentation/widget/login_view_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../starting/view/onboarding_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
  final ExitAppController _controller = Get.put(ExitAppController());

  final AuthController _authService = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 6;
    double width = MediaQuery.of(context).size.width;
    final box = GetStorage();
    return WillPopScope(
      onWillPop: () => _controller.willPop(),
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.paddingLarge,
                          right: Dimensions.paddingLarge,
                          bottom: Dimensions.paddingDefault + 4,
                          top: Dimensions.paddingDefaultExtra + 3),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customSpacerHeight(height: 26),
                            SizedBox(
                                height: height,
                                width: width,
                                child: Stack(
                                  children: [
                                    containerLayout(isLeft: _isLeft),
                                  ],
                                )),
                            bodyContent(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textFieldTitleText(
                                    titleText: AppString.text_email),
                                CustomTextField(
                                  hintText: AppString.enterYourEmail,
                                  inputType: TextInputType.emailAddress,
                                  controller: Get.find<AuthController>()
                                      .emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppString
                                          .the_email_field_is_required;
                                    } else if (value.isEmpty ||
                                        !RegExp(emailExp()).hasMatch(value)) {
                                      return AppString
                                          .please_insert_a_valid_email_address;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textFieldTitleText(
                                    titleText: AppString.password),
                                CustomPasswordTextField(
                                  hintText: AppString.enterYourPassword,
                                  inputType: TextInputType.emailAddress,
                                  controller: Get.find<AuthController>()
                                      .passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppString
                                          .the_password_field_is_required;
                                    } else if (value.length < 6) {
                                      return AppString
                                          .incorrect_user_or_password;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppLayout.getWidth(13),
                          right: AppLayout.getWidth(18),
                          top: 0),
                      child: Row(
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
                                _rememberMe = rememberMe!;
                                if (rememberMe == true) {
                                  box.write(AppString.REMEMBER_KEY,
                                      AppString.REMEMBER_VALUE);
                                }
                              });
                            },
                          ),
                          rememberText(),
                          const Spacer(),
                          forgotButton(onAction: _launchURL),
                        ],
                      ),
                    ),
                    customSpacerHeight(height: Dimensions.fontSizeDefault + 4),
                    logInButton(onAction: () {
                      if (_formKey.currentState!.validate()) {
                        Get.find<AuthController>().logIn();
                      }
                    })
                  ],
                ),
              )),
        ),
      ),
    );
  }

  _launchURL() async {
    var url = Get.find<AuthController>().resetPasswordModel.data?.url;
    // ignore: deprecated_member_use
    if (await launch(url!)) {
      // ignore: deprecated_member_use
      await canLaunch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

emailExp() {
  const pattern =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
  return pattern;
}

passwordExp() {
  return r"(?=.*\d)(?=.*[a-z])(?=.*\W)";
}
