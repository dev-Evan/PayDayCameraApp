import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pay_day_mobile/modules/auth/presentation/widget/login_view_widget.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  final Function onAction;

  CustomButton(this.text, this.onAction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppLayout.getHeight(50),
      child: ElevatedButton(
          onPressed: () => onAction(),
          style: ElevatedButton.styleFrom(
              shape: roundedRectangleBorder,
              backgroundColor: AppColor.primaryColor,
              elevation: 0),
          child: Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: Dimensions.fontSizeMid - 2,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}

// ignore: must_be_immutable
class CustomSmallButton extends StatelessWidget {
  String text;
  final Function onAction;
  CustomSmallButton(this.text, this.onAction, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 18,
      child: ElevatedButton(
        onPressed: () => onAction(),
        style: ElevatedButton.styleFrom(
            shape: roundedRectangleBorder,
            backgroundColor: AppColor.primaryColor,
            elevation: 0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class LoadingButtonLayout extends StatelessWidget {
  final Color? buttonBgColor;
  final Color? loaderColor;

  const LoadingButtonLayout(
      {this.buttonBgColor = AppColor.primaryColor,this.loaderColor=AppColor.cardColor, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: buttonPadding,
      child: SizedBox(
        width: double.infinity,
        height: AppLayout.getHeight(50),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: roundedRectangleBorder,
                backgroundColor: buttonBgColor,
                elevation: 0),
            child: _loader(loaderColor: loaderColor)),
      ),
    );
  }

  _loader({required loaderColor}) {
    return SizedBox(

      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              color: loaderColor,
            )
          : Lottie.asset(Images.loading_white),
    );
  }

}

RoundedRectangleBorder get roundedRectangleBorder {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  );
}
