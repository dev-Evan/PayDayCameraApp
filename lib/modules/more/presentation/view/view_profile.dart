import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/modules/more/data/profile_img_change_rep.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/change_password.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/edit_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../controller/change_profile_img_controller.dart';

class ViewProfile extends StatefulWidget {
  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  ProfileDataController profileDataController =
      Get.put(ProfileDataController());
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  ImagePickerController changeProfileImgController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileViewAppbar(
                titleText: AppString.text_my_profile,
                rightBtnAction: () => CustomNavigator(
                    context: context, pageName: const EditProfile())),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            Obx(
              () => _circleAvatarStyle(
                userImage: profileDataController
                    .userProfile?.data?.profilePictureUrl ==null
                    ? AssetImage(Images.user )
                    : NetworkImage(profileDataController
                    .userProfile?.data?.profilePictureUrl ?? ""),
              ),
            ),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    profileDataController.userProfile?.data?.fullName
                            .toString() ??
                        "Demo",
                    style: AppStyle.mid_large_text.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColor.normalTextColor),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          profileDataController
                                  .userProfile?.data?.designationName
                                  .toString() ??
                              "Demo",
                          style: AppStyle.small_text
                              .copyWith(color: AppColor.hintColor),
                        ),
                        SizedBox(
                          width: AppLayout.getWidth(8),
                        ),
                        const Icon(
                          Icons.circle,
                          size: 8,
                          color: AppColor.hintColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(8),
                    ),
                    Text(
                      profileDataController.userProfile?.data?.employmentStatus
                              .toString() ??
                          "Demo",
                      style: AppStyle.small_text
                          .copyWith(color: AppColor.hintColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                _moveChangePassword(
                    context: context,
                    onAction: () => CustomNavigator(
                        context: context, pageName: ChangePassword())),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_about_me),
                      SizedBox(
                        height: AppLayout.getHeight(8),
                      ),
                      Text(
                        profileDataController.userProfile?.data?.aboutMe
                                .toString() ??
                            "Demo",
                        style: AppStyle.small_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeDefault - 1),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(14),
                      ),
                      textFieldTitleText(titleText: AppString.text_general),
                      _cardView(
                          dynamicText: profileDataController
                                  .userProfile?.data?.departmentName
                                  .toString() ??
                              "Demo",
                          titleText: AppString.text_department,
                          icon: Icons.work_outline_outlined),
                      _cardView(
                          dynamicText: profileDataController
                                  .userProfile?.data?.workingShiftType
                                  .toString() ??
                              "Demo",
                          titleText: AppString.text_shift,
                          icon: Icons.access_time_outlined),
                      _cardView(
                          dynamicText: profileDataController
                                  .userProfile?.data?.email
                                  .toString() ??
                              "Demo",
                          titleText: AppString.text_email,
                          icon: CupertinoIcons.mail),
                      _cardView(
                          dynamicText: profileDataController
                                  .userProfile?.data?.contact
                                  .toString() ??
                              "Demo",
                          titleText: AppString.text_phone,
                          icon: CupertinoIcons.phone),
                      SizedBox(
                        height: AppLayout.getHeight(14),
                      ),
                      textFieldTitleText(titleText: AppString.text_personal),
                      _cardView(
                          dynamicText: profileDataController
                                  .userProfile?.data?.address
                                  .toString() ??
                              "Demo",
                          titleText: AppString.text_address,
                          icon: CupertinoIcons.home),
                      _cardView(
                          dynamicText: profileDataController
                                  .userProfile?.data?.dateOfBirth
                                  .toString() ??
                              "Demo",
                          titleText: AppString.text_birthday,
                          icon: Icons.card_giftcard),
                      _cardView(
                          dynamicText: profileDataController
                                  .userProfile?.data?.gender
                                  .toString() ??
                              "Demo",
                          titleText: AppString.text_gender,
                          icon: CupertinoIcons.person),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _cardView({icon, dynamicText, titleText}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      children: [
        _cardIconView(cardIcon: icon),
        SizedBox(
          width: AppLayout.getWidth(8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dynamicText,
              style: AppStyle.small_text_black.copyWith(
                  fontSize: Dimensions.fontSizeSmall + 2,
                  color: AppColor.normalTextColor),
            ),
            Text(
              titleText,
              style: AppStyle.small_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeDefault - 2,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _circleAvatarStyle({final userImage}) {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  return Stack(
    children: [
      CircleAvatar(
        radius: 34,
        backgroundColor: AppColor.primaryColor,
        child: CircleAvatar(
          radius: 34,
          backgroundColor: AppColor.primaryColor,
          backgroundImage: imagePickerController.pickedImage.value == null
              ? userImage
              : Image.file(File(imagePickerController.pickedImage.value!.path))
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
                      imagePickerController.pickImage(ImageSource.gallery),
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 14,
                  ))))
    ],
  );
}

Widget _cardIconView({cardIcon}) {
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

Widget _moveChangePassword({
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
                fontSize: Dimensions.fontSizeDefault),
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
