import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/date_of_birth_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/edit_profile_drop_dawon_cnt.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget dateOfBirthField({required context}) {
  return TextFormField(
    controller: Get.find<DatePickerController>().dobDateController.value,
    readOnly: true,
    onTap: (){
      Get.find<DatePickerController>().dateOfBirth(context);
    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            left: AppLayout.getWidth(16),
            right: AppLayout.getWidth(20),
            top: AppLayout.getHeight(16),
            bottom: AppLayout.getHeight(16)),
        hintText: AppString.text_not_added_yet,
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
          const BorderSide(width: 1.0, color: AppColor.primaryColor),
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

Widget dropDownField({ required context,required locations}){
  return   Container(
    decoration: BoxDecoration(
      color: AppColor.cardColor,
      border: Border.all(width: 1.0, color: AppColor.solidGray),


      borderRadius:
      BorderRadius.circular(Dimensions.radiusDefault),
    ),
    child: SizedBox(
        height: AppLayout.getHeight(53),
        width: MediaQuery.of(context).size.width,


        child: Padding(
          padding:  EdgeInsets.only( left: AppLayout.getWidth(16),
              right: AppLayout.getWidth(20),
              top: AppLayout.getHeight(16),
              bottom: AppLayout.getHeight(16)),
          child: DropdownButton<String>(
            style: const TextStyle(fontWeight: FontWeight.w500),
            isDense: true,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            icon: const Icon(Icons.expand_more),
            iconEnabledColor: AppColor.normalTextColor,
            hint: Text(
              Get.find<ProfileDataController>()
                  .userProfile
                  .data
                  ?.gender ??
                  "",
              style: AppStyle.normal_text
                  .copyWith(color: AppColor.normalTextColor),
            ),
            value: Get.find<DropdownBtnController>()
                .dropdownValue
                .value,
            borderRadius:
            BorderRadius.circular(Dimensions.radiusDefault),
            items: locations.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: AppStyle.normal_text.copyWith(
                        color: AppColor.normalTextColor)),
              );
            }).toList(),
            onChanged: (newValue) {
              Get.find<DropdownBtnController>()
                  .onValueChanged(newValue!);
              print(newValue.toString());
            },
          ),
        )




    ),
  );

}
