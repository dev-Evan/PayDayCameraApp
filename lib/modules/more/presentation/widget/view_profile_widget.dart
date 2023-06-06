import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/change_profile_img_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget cardView({icon, dynamicText, titleText}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      children: [
        cardIconView(cardIcon: icon),
      customSpacerWidth(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dynamicText,
                style: AppStyle.small_text_black.copyWith(
                    fontSize: Dimensions.fontSizeSmall + 3,
                    color: AppColor.normalTextColor),
              ),
              Text(
                titleText,
                style: AppStyle.small_text.copyWith(
                  color: AppColor.hintColor,
                  fontSize: Dimensions.fontSizeDefault - 1,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget circleAvatarStyle({final userImage}) {

  return Stack(
    children: [

      CircleAvatar(
        radius: 34,
        backgroundColor: AppColor.primaryColor,
        child: CircleAvatar(
          radius: 34,
          backgroundColor: AppColor.primaryColor,
          backgroundImage: Get.find<ImagePickerController>().pickedImage.value == null
              ? userImage
              : Image.file(File(Get.find<ImagePickerController>().pickedImage.value!.path))
              .image,
        ),
      ),
      Positioned(
          right: 0,
          bottom: 0,
          child: CircleAvatar(
              radius: 12,
              backgroundColor: AppColor.primaryColor,
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () =>
                      Get.find<ImagePickerController>().pickImage(ImageSource.gallery),
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 14,
                  ))))
    ],
  );
}

Widget cardIconView({cardIcon}) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Icon(
            cardIcon,
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        ),
      ));
}

Widget moveChangePassword({
  context,
  onAction,
}) {
  return InkWell(
    onTap: () => onAction(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            AppString.text_change_password,
            style: AppStyle.small_text.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: Dimensions.fontSizeDefault + 1),
          ),
        ),
        SizedBox(
          width: AppLayout.getWidth(4),
        ),
        const Icon(
          Icons.arrow_forward,
          color: AppColor.primaryColor,
          size: 16,
        )
      ],
    ),
  );
}

Widget userName({required text}){
  return   Center(
    child: Text(
      text,
      style: AppStyle.mid_large_text.copyWith(
          fontWeight: FontWeight.w800,
          color: AppColor.normalTextColor,
          fontSize: Dimensions.fontSizeMid + 1),
    ),
  );
}

Widget designationText({required desText,required status}){
  return   Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          Text(
            desText,
            style: AppStyle.small_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeSmall + 1),
          ),
          customSpacerWidth(width: 8),
          const Icon(
            Icons.circle,
            size: 8,
            color: AppColor.hintColor,
          ),
        ],
      ),

      customSpacerWidth(width: 8),
      Text(
        status,
        style: AppStyle.small_text.copyWith(
            color: AppColor.hintColor,
            fontSize: Dimensions.fontSizeSmall + 1),
      ),
    ],
  );
}

Widget aboutText({required text}){
  return Text(
    text,
    style: AppStyle.small_text.copyWith(
        color: AppColor.normalTextColor,
        fontSize: Dimensions.fontSizeDefault),
  );
}