import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/date_of_birth_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget dateOfBirthField({required context}) {
  return TextFormField(
    controller: Get.find<DatePickerController>().dobDateController.value,
    readOnly: true,
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: 'YYYY-MM-DD',
        focusColor: AppColor.primaryColor,
        hintStyle: GoogleFonts.poppins(
            color: AppColor.hintColor, fontSize: Dimensions.fontSizeDefault),
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
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.solidGray, width: 1.0),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.0, color: AppColor.solidGray),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        ),
        suffixIcon: IconButton(
          onPressed: () =>
              Get.find<DatePickerController>().dateOfBirth(context),
          icon: const Icon(Icons.calendar_month_rounded),
        )),
  );
}