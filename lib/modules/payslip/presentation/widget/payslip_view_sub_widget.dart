import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/change_profile_img_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget profileCard({required imgUrl, required nameText, required userEmail}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
            backgroundImage:
            Get.find<ImagePickerController>().pickedImage.value == null
                ? imgUrl
                : Image.file(File(Get.find<ImagePickerController>()
                .pickedImage
                .value!
                .path))
                .image,
            radius: 28,
          ),
          customSpacerWidth(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameText,
                style: AppStyle.mid_large_text.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColor.normalTextColor,
                    fontSize: Dimensions.fontSizeDefault),
              ),
              Text(
                userEmail,
                style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget payslipVDateCard({required titleText, required dateText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customSpacerHeight(height: 12),
      Text(
        titleText,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.hintColor.withOpacity(0.7),
            fontSize: Dimensions.fontSizeDefault,
            fontWeight: FontWeight.w500),
      ),
      Text(
        dateText,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.normalTextColor.withOpacity(0.7),
            fontSize: Dimensions.fontSizeDefault,
            fontWeight: FontWeight.w500),
      ),
      customSpacerHeight(height: 16),
    ],
  );
}

Widget basicSalaryText() {
  return Text(AppString.text_beneficiary,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSizeDefault + 2));
}
Widget subTitleContainer({required leftText,required rightText}){
  return   Container(
    decoration: AppStyle.ContainerStyle.copyWith(
        color: AppColor.disableColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(
            Dimensions.radiusDefault - 6)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeDefault,
                fontWeight: FontWeight.w500),
          ),



          Text(
            rightText,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeDefault,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}


Widget subTextCard({required subLeftText,required subRightText, isPercentage}) {
  return Padding(
    padding:  EdgeInsets.only(bottom: AppLayout.getHeight(8),left: AppLayout.getWidth(2),right: AppLayout.getWidth(2),top: AppLayout.getHeight(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(
          children: [
            Text(
              subLeftText,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor
                      .withOpacity(0.9),
                  fontSize: Dimensions.fontSizeDefault,
                  fontWeight: FontWeight.w500),
            ),
            Text(isPercentage.toString() == "1" ? "%" : "tk"),

          ],
        ),


        Text(
          subRightText,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor
                  .withOpacity(0.9),
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w500),
        ),

      ],
    ),
  );
}

Widget summaryTextCard({required subLeftText,required subRightText}) {
  return Padding(
    padding:  EdgeInsets.only(bottom: AppLayout.getHeight(8),left: AppLayout.getWidth(8),right: AppLayout.getWidth(8),top: AppLayout.getHeight(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          subLeftText,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor
                  .withOpacity(0.9),
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w500),
        ),


        Text(
          subRightText,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor
                  .withOpacity(0.9),
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w500),
        ),

      ],
    ),
  );
}


Widget totalRowView({required amount}){
  return  Padding(
    padding: const EdgeInsets.all(6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.text_total,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault + 2,
              fontWeight: FontWeight.w700),
        ),

        Text(
          amount,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault + 2,
              fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}

Widget summaryText(){
  return   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.text_total_summary,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}