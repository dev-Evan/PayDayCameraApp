import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  String text;
  final onAction;

  CustomButton(this.text, this.onAction);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 18,
      child: ElevatedButton(
          onPressed: () => onAction(),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              primary: AppColor.primaryColor,
              elevation: 0),
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: Dimensions.fontSizeMid-3),
          )),
    );
  }
}

class CustomSmallButton extends StatelessWidget {
  String text;
  final onAction;

  CustomSmallButton(this.text, this.onAction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 18,
      child: ElevatedButton(
        onPressed: () => onAction(),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: AppColor.primaryColor,
            elevation: 0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: Dimensions.fontSizeMid, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
