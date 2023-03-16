import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
Widget holyDayTitle({AllHolidayAction}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.text_this_month,
          style: AppStyle.small_text_black.copyWith(
              color: AppColor.hintColor,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeDefault+2),
        ),
        InkWell(
          onTap: ()=>AllHolidayAction(),
          child: Row(
            children: [
              Text(AppString.text_this_all_holiday,style: AppStyle.small_text_black.copyWith(color: AppColor.primaryColor,fontWeight: FontWeight.w600,fontSize: Dimensions.fontSizeDefault),),
              const SizedBox(width: 4,),
              Icon(Icons.arrow_forward,color: AppColor.primaryColor,size: Dimensions.fontSizeMid,)
            ],
          ),
        ),
      ],
    ),
  );
}