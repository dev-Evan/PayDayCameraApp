import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/button.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/example/presentation/auth/sign_in.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import 'package:google_fonts/google_fonts.dart';

class receiveScreen extends StatefulWidget {
  const receiveScreen({Key? key}) : super(key: key);

  @override
  State<receiveScreen> createState() => _receiveScreenState();
}

class _receiveScreenState extends State<receiveScreen> {
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
                          padding: const EdgeInsets.all(20.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            alignment: isleft
                                ? Alignment.topCenter
                                : Alignment.topRight,
                            child: Image.asset(Images.payday),
                            curve: Curves.easeInOut,
                          ),
                        ),
                      ],
                    )),

                // IconButton(
                //     padding: EdgeInsets.all(0.0),
                //     onPressed: (){
                //   Get.toNamed(signIn);
                // }, icon: Icon(Icons.arrow_back)),
                InkWell(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => signInScreen(),));
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(height: AppLayout.getHeight(Dimensions.fontSizeMid),),






                Text(
                  "Reset Password",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w800,
                      fontSize: Dimensions.fontSizeLarge),
                ),
                SizedBox(
                    height:AppLayout.getHeight( Dimensions.fontSizeMid,)

                ),
                Text(
                  "Enter your email and request ",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimensions.fontSizeMid,
                      color: AppColor.hintColor,
                      letterSpacing: 0.3),
                ),
                SizedBox(

                    height:AppLayout.getHeight( Dimensions.fontSizeLarge,)

                ),
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
                  height: AppLayout.getHeight(Dimensions.fontSizeExtraLarge) ,
                ),
                CustomButton('Request', () {
                  Get.toNamed(receive);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
