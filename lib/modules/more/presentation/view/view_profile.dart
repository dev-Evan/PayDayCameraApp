import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/change_password.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/edit_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/view_profile_widget.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/images.dart';

class ViewProfile extends GetView<ProfileDataController> {
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
                rightBtnAction: () =>
                    CustomNavigator(context: context, pageName: EditProfile())),
            customSpacerHeight(height: 10),
            Obx(
              () => circleAvatarStyle(
                userImage: controller.userProfile.data?.profilePictureUrl ==
                        null
                    ? AssetImage(Images.user)
                    : NetworkImage(
                        controller.userProfile.data?.profilePictureUrl ?? ""),
              ),
            ),
            customSpacerHeight(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userName(
                    text:
                        controller.userProfile.data?.fullName.toString() ?? ""),
                designationText(
                    desText: controller.userProfile.data?.designationName
                            .toString() ??
                        "",
                    status: controller.userProfile.data?.employmentStatus
                            .toString() ??
                        ""),
                customSpacerHeight(height: 20),
                moveChangePassword(
                    context: context,
                    onAction: () => CustomNavigator(
                        context: context, pageName: ChangePassword())),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customSpacerHeight(height: 8),
                      controller.userProfile.data?.aboutMe !=null?

                      controller.userProfile.data!.aboutMe!.isEmpty
                          ? Container()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textFieldTitleText(
                                    titleText: AppString.text_about_me),
                                aboutText(
                                    text: controller.userProfile.data?.aboutMe
                                            .toString() ??
                                        ""),
                              ],
                            ):Container(),
                      customSpacerHeight(height: 14),
                      textFieldTitleText(titleText: AppString.text_general),
                      controller.userProfile.data!.departmentName!.isEmpty
                          ? Container()
                          : cardView(
                              dynamicText: controller
                                      .userProfile.data?.departmentName
                                      .toString() ??
                                  "",
                              titleText: AppString.text_department,
                              icon: Icons.work_outline_outlined),
                      controller.userProfile.data!.workingShiftType!.isEmpty
                          ? Container()
                          : cardView(
                              titleText: AppString.text_shift,
                              dynamicText: controller
                                      .userProfile.data?.workingShiftType
                                      .toString() ??
                                  "",
                              icon: Icons.access_time_outlined),
                      controller.userProfile.data!.email!.isEmpty
                          ? Container()
                          : cardView(
                              dynamicText: controller.userProfile.data?.email
                                      .toString() ??
                                  "",
                              titleText: AppString.text_email,
                              icon: CupertinoIcons.mail),
                      controller.userProfile.data!.contact!.isEmpty
                          ? Container()
                          : cardView(
                              dynamicText: controller.userProfile.data?.contact
                                      .toString() ??
                                  "",
                              titleText: AppString.text_phone,
                              icon: CupertinoIcons.phone),
                      customSpacerHeight(height: 14),
                      textFieldTitleText(titleText: AppString.text_personal),
                      controller.userProfile.data!.address!.isEmpty
                          ? Container()
                          : cardView(
                              dynamicText: controller.userProfile.data?.address
                                      .toString() ??
                                  "",
                              titleText: AppString.text_address,
                              icon: CupertinoIcons.home),
                      controller.userProfile.data!.dateOfBirth!.isEmpty
                          ? Container()
                          : cardView(
                              dynamicText: controller
                                      .userProfile.data?.dateOfBirth
                                      .toString() ??
                                  "",
                              titleText: AppString.text_birthday,
                              icon: Icons.card_giftcard),
                      controller.userProfile.data!.gender!.isEmpty
                          ? Container()
                          : cardView(
                              dynamicText: controller.userProfile.data?.gender
                                      .toString() ??
                                  "",
                              titleText: AppString.text_gender,
                              icon: CupertinoIcons.person),
                    ],
                  ),
                ),
                customSpacerHeight(height: 40)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
