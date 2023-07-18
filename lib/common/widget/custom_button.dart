import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  final Function onAction;

  CustomButton(this.text, this.onAction, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          onPressed: () => onAction(),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ), backgroundColor: AppColor.primaryColor,
              elevation: 0),
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: Dimensions.fontSizeMid-2,fontWeight: FontWeight.w600),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ), backgroundColor: AppColor.primaryColor,
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
