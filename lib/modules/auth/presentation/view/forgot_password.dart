import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/auth/presentation/view/sign_in.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotScreen extends StatefulWidget {
  const forgotScreen({Key? key}) : super(key: key);

  @override
  State<forgotScreen> createState() => _forgotScreenState();
}

class _forgotScreenState extends State<forgotScreen> {
  TextEditingController _emailController = TextEditingController();

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingLarge),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: _height,
                    width: _width,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppLayout.getWidth(20),
                              right: AppLayout.getWidth(20),
                              top: AppLayout.getHeight(20),
                              bottom: AppLayout.getHeight(20)),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            alignment: isleft
                                ? Alignment.topCenter
                                : Alignment.topRight,
                            curve: Curves.easeInOut,
                            child: Image.asset(Images.app_logo),
                          ),
                        ),
                      ],
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SignInScreen(),
                          ));
                    },
                    child: const Icon(Icons.arrow_back)),
                SizedBox(
                  height: AppLayout.getHeight(Dimensions.fontSizeMid),
                ),
                Text(
                  "Reset Password",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: Dimensions.fontSizeLarge),
                ),
                SizedBox(
                    height: AppLayout.getHeight(
                  Dimensions.fontSizeMid,
                )),
                Text(
                  "Enter your email and request ",
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
                      hintText: 'Enter email',
                      inputType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(Dimensions.fontSizeExtraLarge),
                ),
                CustomButton('Request', () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
