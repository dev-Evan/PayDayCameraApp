import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomTextFieldDob(
    {required String hintText,  required IconData dobIcon ,dobIconAction}){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),

    child: TextField(

      readOnly: true,
      onTap: ()=>dobIconAction(),
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
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.solidGray, width: 1.0),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)
          ),

          border: OutlineInputBorder(
            borderSide:
            const BorderSide(width: 0.0, color: AppColor.solidGray),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          ),

          suffixIcon: IconButton(
            onPressed: ()=>dobIconAction(),icon: Icon(dobIcon),
          ),



        ),

      ),

  );
}