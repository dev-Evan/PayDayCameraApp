import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/pick_image_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

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
      Container(
        height: AppLayout.getHeight(74),
        width: AppLayout.getWidth(74),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: ClipOval(
          child: FadeInImage(
            image: NetworkImage(userImage),


            placeholder: Get.find<PickImageController>().pickedImage.value ==null
  ? placeholderImages
      : Image.file(File(Get.find<PickImageController>().pickedImage.value!.path))
      .image,
            imageErrorBuilder: (context, error, stackTrace) {
              return   CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage: Get.find<PickImageController>().pickedImage.value ==null
                    ? placeholderImages
                    : Image.file(File(Get.find<PickImageController>().pickedImage.value!.path))
                    .image,
              );

            },
            fit: BoxFit.cover,
          ),
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
                      Get.find<PickImageController>().pickImage(ImageSource.gallery),
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 14,
                  ))))
    ],
  );
}

AssetImage get placeholderImages {
  return AssetImage(Images.user);
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
    child: Padding(
      padding:  EdgeInsets.only(left: AppLayout.getWidth(12)),
      child: Text(
        text,
        style: AppStyle.mid_large_text.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeMid + 1),
      ),
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


