import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomTextFieldDob(
    {required String hintText,  required IconData dobIcon ,dobIconAction}){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextField(
      readOnly: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: hintText,
          focusColor: AppColor.primaryColor,
          hintStyle: GoogleFonts.poppins(color: AppColor.hintColor,fontSize: Dimensions.fontSizeDefault),
          filled: false,
          fillColor: AppColor.backgroundColor,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(width: 0.0, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.disableColor, width: 0.0),
          ),
          border: OutlineInputBorder(
            borderSide:
            const BorderSide(width: 0.0, color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          ),

          suffixIcon: IconButton(
            onPressed: ()=>dobIconAction(),icon: Icon(dobIcon),
          )





        ),
      ),
    ),
  );
}