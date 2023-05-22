import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/modules/auth/presentation/widget/login_view_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
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
                            containerLayout(isLeft: _isLeft),
                          ],
                        )),
                    bodyContent(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldTitleText(titleText: AppString.email),
                        customSpacerHeight(height: 4),
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
                    customSpacerHeight(height: Dimensions.fontSizeLarge),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldTitleText(titleText: AppString.password),
                        customSpacerHeight(height: 8),
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
                    customSpacerHeight(height: Dimensions.fontSizeDefault),
                    Row(
                      children: [
                        Checkbox(
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
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
                        forgotButton()
                      ],
                    ),
                    customSpacerHeight(height: Dimensions.fontSizeExtraLarge),
                    logInButton(
                        onAction: () => Get.find<AuthController>().logIn(
                            _emailController.text, _passwordController.text))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
