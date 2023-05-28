import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'address_details_widget.dart';

Widget customMoreAppbar({
  titleText,
  bgColor = AppColor.backgroundColor,
  textColor=AppColor.normalTextColor,
  Function ? onAction ,
}) {
  return AppBar(
    elevation: .5,
    leading: IconButton(
      onPressed: (){
        if(onAction !=null){
          onAction();
        }else{
          Get.back();
        }
      },
      icon: Icon(
        Icons.arrow_back,
        color: textColor,
      ),
    ),
    centerTitle: true,
    title: Text(
      titleText,
      style: AppStyle.title_text.copyWith(
          color: textColor,
          fontSize: Dimensions.fontSizeDefault + 1),
    ),
    backgroundColor: bgColor,
  );
}

Widget profileViewAppbar(
    {titleText, bgColor = AppColor.backgroundColor, rightBtnAction}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: ()=>Get.back(),
      icon: const Icon(
        Icons.arrow_back,
        color: AppColor.normalTextColor,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () => rightBtnAction(),
          icon:  editIcon(),

      )
    ],
    title: Text(
      titleText,
      style: AppStyle.title_text.copyWith(
          color: AppColor.normalTextColor,
          fontSize: Dimensions.fontSizeDefault + 1),
    ),
    backgroundColor: bgColor,
  );
}
