import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/change_profile_img_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/user_status.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget profileCardLayOut(
    {context, userName, final userImage, userEmail, statusText}) {
  ImagePickerController imagePickerControlle =
      Get.put(ImagePickerController());
  return Expanded(
      flex: 3,
      child: Container(
        decoration: AppStyle.ContainerStyle.copyWith(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.radiusMid + 4),
                bottomRight: Radius.circular(Dimensions.radiusMid + 4))),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            Get.find<ImagePickerController>().pickedImage.value == null
                                ? userImage
                                : Image.file(File(Get.find<ImagePickerController>()
                                        .pickedImage.value!.path))
                                    .image,
                        radius: 28,
                      ),
                      customSpacerWidth(width: 16),
                      _userNameText(userName: userName, userEmail: userEmail)
                    ],
                  ),
                  userStatusView(statusText: statusText)
                ],
              ),
              const Spacer(),
              _moveProfileView(
                  onAction: () => CustomNavigator(
                      context: context, pageName: ViewProfile())),
            ],
          ),
        ),
      ));
}

Widget _userNameText({required userName, required userEmail}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        userName,
        style: AppStyle.mid_large_text
            .copyWith(fontWeight: FontWeight.w800, letterSpacing: 0.2),
      ),
      customSpacerHeight(height: 2),
      Text(
        userEmail,
        style: AppStyle.normal_text.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: Dimensions.fontSizeDefault - 1,
            letterSpacing: 0.2),
      ),
    ],
  );
}

Widget _moveProfileView({onAction}) {
  return Center(
    child: InkWell(
      onTap: () => onAction(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _viewProfileText(),
          customSpacerWidth(width: 8),
          Icon(
            Icons.arrow_forward,
            color: AppColor.cardColor,
            size: Dimensions.fontSizeDefault + 3,
          )
        ],
      ),
    ),
  );
}
Widget _viewProfileText(){
  return Text(
    AppString.text_view_profile,
    style: AppStyle.small_text
        .copyWith(fontSize: Dimensions.fontSizeDefault),
  );
}