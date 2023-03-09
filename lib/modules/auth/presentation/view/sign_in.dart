import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/auth/presentation/controller/auth_controller.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isleft = false;
  bool? rememberMe = false;



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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingLarge),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppLayout.getHeight(30)),
                Container(
                    height: _height,
                    width: _width,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            alignment: isleft
                                ? Alignment.topCenter
                                : Alignment.topRight,
                            child: Image.asset(Images.app_logo),
                            curve: Curves.easeInOut,
                          ),
                        ),
                      ],
                    )),
                Text(
                  "Log In",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: Dimensions.fontSizeLarge),
                ),
                SizedBox(
                    height: AppLayout.getHeight(
                  Dimensions.fontSizeMid,
                )),
                Text(
                  "Hi, login to your dashboard ",
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
                      'Email',
                      style: GoogleFonts.poppins(
                          fontSize: Dimensions.fontSizeMid,
                          fontWeight: FontWeight.w600,
                          color: AppColor.hintColor),
                    ),
                    CustomTextFeild(
                      'Enter email',
                      TextInputType.emailAddress,
                      _emailController,
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
                      'Password',
                      style: GoogleFonts.poppins(
                          fontSize: Dimensions.fontSizeMid,
                          fontWeight: FontWeight.w600,
                          color: AppColor.hintColor),
                    ),
                    CustomPasswordTextField(
                      'Enter your password',
                      TextInputType.emailAddress,
                      _passwordController,
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusSmall)),
                          value: this.rememberMe,
                          onChanged: (bool? rememberMe) {
                            setState(() {
                              this.rememberMe = rememberMe;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: GoogleFonts.poppins(
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () => Get.toNamed(forgot),
                        child: Text('Forgot password?',
                            style: GoogleFonts.poppins(
                                fontSize: Dimensions.fontSizeDefault,
                                color: AppColor.primaryColor)))
                  ],
                ),
                SizedBox(
                    height: AppLayout.getHeight(
                  Dimensions.fontSizeExtraLarge,
                )),
                CustomButton('Log In', () {
                  Get.find<AuthController>().login(
                      _emailController.text.toString(),
                      _passwordController.text);
                  // final email = _emailController.text.toString();
                  // final password = _passwordController.text;
                  // AuthHelper().logIn(email, password, context);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
