import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/date_of_birth_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/edit_profile_drop_dawon_cnt.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/edit_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/view_profile_widget.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class ViewProfile extends GetView<ProfileDataController> {
  const ViewProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustomAppbar(),
      body: controller.obx(
          (state) => RefreshIndicator(
                onRefresh: _refreshPage,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      profileViewAppbar(
                          titleText: AppString.text_my_profile,
                          rightBtnAction: () {
                            Get.find<InputTextFieldController>()
                                .firstNameController
                                .text = Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.firstName ??
                                "";
                            Get.find<InputTextFieldController>()
                                .lastNameController
                                .text = Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.lastName ??
                                "";
                            Get.find<InputTextFieldController>()
                                .emailController
                                .text = Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.email ??
                                "";
                            Get.find<InputTextFieldController>()
                                .contactController
                                .text = Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.contact ??
                                "";
                            Get.find<DropdownBtnController>()
                                .dropdownValue
                                .toString();
                            Get.find<InputTextFieldController>()
                                .aboutMeController
                                .text = Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.aboutMe ??
                                "";
                            Get.find<InputTextFieldController>()
                                .addressController
                                .text = Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.address ??
                                "";
                            Get.find<DatePickerController>()
                                .dobDateController
                                .value
                                .text = _dateFormat;
                            defaultNavigator(context: context,routeName: EditProfile());
                          }),
                      customSpacerHeight(height: 10),
                      Obx(() => circleAvatarStyle(
                            userImage: controller
                                    .userProfile.data?.profilePictureUrl
                                    .toString() ??
                                "",
                          )),
                      customSpacerHeight(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          userName(
                              text: controller.userProfile.data?.fullName
                                      .toString() ??
                                  AppString.text_not_added_yet),
                          designationText(
                              desText: controller
                                      .userProfile.data?.designationName
                                      .toString() ??
                                  "",
                              status: controller
                                      .userProfile.data?.employmentStatus
                                      .toString() ??
                                  ""),
                          customSpacerHeight(height: 20),
                          moveChangePassword(
                            context: context,
                            onAction: () => Get.toNamed(Routes.CHANGE_PASSWORD),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customSpacerHeight(height: 8),
                                controller.userProfile.data?.aboutMe != null
                                    ? controller
                                            .userProfile.data!.aboutMe!.isEmpty
                                        ? Container()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              textFieldTitleText(
                                                  titleText:
                                                      AppString.text_about_me),
                                              aboutText(
                                                  text: controller.userProfile
                                                          .data?.aboutMe
                                                          .toString() ??
                                                      ""),
                                            ],
                                          )
                                    : Container(),
                                customSpacerHeight(height: 14),
                                textFieldTitleText(
                                    titleText: AppString.text_general),
                                controller.userProfile.data?.departmentName !=
                                            null &&
                                        controller.userProfile.data!
                                            .departmentName!.isEmpty
                                    ? Container()
                                    : cardView(
                                        dynamicText: controller.userProfile.data
                                                ?.departmentName
                                                .toString() ??
                                            "",
                                        titleText: AppString.text_department,
                                        icon: Icons.work_outline_outlined),
                                controller.userProfile.data?.workingShiftType !=
                                            null &&
                                        controller.userProfile.data!
                                            .workingShiftType!.isEmpty
                                    ? Container()
                                    : cardView(
                                        titleText: AppString.text_workShift,
                                        dynamicText: controller.userProfile.data
                                                ?.workingShiftName
                                                .toString() ??
                                            "",
                                        icon: Icons.access_time_outlined),
                                controller.userProfile.data?.email != null &&
                                        controller
                                            .userProfile.data!.email!.isEmpty
                                    ? Container()
                                    : cardView(
                                        dynamicText: controller
                                                .userProfile.data?.email
                                                .toString() ??
                                            "",
                                        titleText: AppString.text_email,
                                        icon: CupertinoIcons.mail),
                                controller.userProfile.data?.contact != null &&
                                        controller
                                            .userProfile.data!.contact!.isEmpty
                                    ? Container()
                                    : cardView(
                                        dynamicText: controller
                                                .userProfile.data?.contact
                                                .toString() ??
                                            "",
                                        titleText: AppString.text_phone,
                                        icon: CupertinoIcons.phone),
                                controller.userProfile.data?.employyeId !=
                                            null &&
                                        controller.userProfile.data!.employyeId!
                                            .isEmpty
                                    ? Container()
                                    : cardView(
                                        dynamicText: controller
                                                .userProfile.data?.employyeId
                                                .toString() ??
                                            "",
                                        titleText: AppString.text_employee_id,
                                        icon: CupertinoIcons.person),
                                customSpacerHeight(height: 14),
                                controller.userProfile.data?.address != null &&
                                        controller
                                            .userProfile.data!.address!.isEmpty
                                    ? controller.userProfile.data?.address ==
                                            null
                                        ? controller.userProfile.data?.gender ==
                                                null
                                            ? controller.userProfile.data
                                                        ?.dateOfBirth ==
                                                    null
                                                ? Container()
                                                : Container()
                                            : Container()
                                        : Container()
                                    : textFieldTitleText(
                                        titleText: AppString.text_personal),
                                controller.userProfile.data?.address != null &&
                                        controller
                                            .userProfile.data!.address!.isEmpty
                                    ? Container()
                                    : cardView(
                                        dynamicText: controller
                                                .userProfile.data?.address
                                                .toString() ??
                                            "",
                                        titleText: AppString.text_address,
                                        icon: CupertinoIcons.home),
                                controller.userProfile.data?.dateOfBirth !=
                                            null &&
                                        controller.userProfile.data!
                                            .dateOfBirth!.isEmpty
                                    ? Container()
                                    : cardView(
                                        dynamicText: controller
                                                .userProfile.data?.dateOfBirth
                                                .toString() ??
                                            "",
                                        titleText: AppString.text_birthday,
                                        icon: Icons.card_giftcard),
                                controller.userProfile.data?.gender != null &&
                                        controller
                                            .userProfile.data!.gender!.isEmpty
                                    ? Container()
                                    : cardView(
                                        dynamicText: controller
                                                .userProfile.data?.gender
                                                .toString() ??
                                            "",
                                        titleText: AppString.text_gender,
                                        icon: Icons.male),
                              ],
                            ),
                          ),
                          customSpacerHeight(height: 40)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          onLoading: const LoadingIndicator()),
    );
  }

  Future<void> _refreshPage() async {
    await controller.getProfileData();
  }
}

String get _dateFormat {
  var dynamicDate =
      (Get.find<ProfileDataController>().userProfile.data?.dateOfBirth ?? "");
  var date = '';
  if (dynamicDate.isNotEmpty && dynamicDate != "") {
    var formatDate = DateFormat("d MMM yyyy", 'en_US').parse(dynamicDate);
    date = DateFormat("yyyy-MM-dd").format(formatDate);
  } else {
    Get.find<DatePickerController>().dobDateController.value.text = "";
  }
  return date;
}
