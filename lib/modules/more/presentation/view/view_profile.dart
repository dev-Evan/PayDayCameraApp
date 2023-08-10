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
                      // user default appbar here
                      _userProfileAppbar(context),
                      customSpacerHeight(height: 10),
                      // profile view image here
                      Obx(() => _profileImageLayout()),
                      customSpacerHeight(height: 10),
                      // user others information layout here
                      _userInfoLayout(context),
                    ],
                  ),
                ),
              ),
          onLoading: const LoadingIndicator()),
    );
  }

  _profileImageLayout() {
    return circleAvatarStyle(
      userImage:
          controller.userProfile.data?.profilePictureUrl.toString() ?? "",
    );
  }

  _changePasswordLayout(context) {
    return changePassword(
      context: context,
      onAction: () => Get.toNamed(Routes.CHANGE_PASSWORD),
    );
  }

  _userInfoLayout(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _userNameText(),
        _userDesignationText(),
        customSpacerHeight(height: 20),
        _changePasswordLayout(context),
        _userInformationView(),
        customSpacerHeight(height: 40)
      ],
    );
  }

  _userInformationView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSpacerHeight(height: 8),
          controller.userProfile.data?.aboutMe != null
              ? controller.userProfile.data!.aboutMe!.isEmpty
                  ? Container()
                  : _userAboutText()
              : Container(),
          customSpacerHeight(height: 14),
          textFieldTitleText(titleText: AppString.text_general),
          controller.userProfile.data?.departmentName != null &&
                  controller.userProfile.data!.departmentName!.isEmpty
              ? Container()
              : _departmentText(),
          controller.userProfile.data?.workingShiftType != null &&
                  controller.userProfile.data!.workingShiftType!.isEmpty
              ? Container()
              : _userWorkShiftText(),
          controller.userProfile.data?.email != null &&
                  controller.userProfile.data!.email!.isEmpty
              ? Container()
              : _userEmailText(),
          controller.userProfile.data?.contact != null &&
                  controller.userProfile.data!.contact!.isEmpty
              ? Container()
              : _userContactText(),
          controller.userProfile.data?.employyeId != null &&
                  controller.userProfile.data!.employyeId!.isEmpty
              ? Container()
              : _userIdText(),
          customSpacerHeight(height: 14),
          controller.userProfile.data?.address != null &&
                  controller.userProfile.data!.address!.isEmpty &&
                  controller.userProfile.data!.dateOfBirth!.isEmpty &&
                  controller.userProfile.data!.gender!.isEmpty
              ? Container()
              : textFieldTitleText(titleText: AppString.text_personal),
          controller.userProfile.data?.address != null &&
                  controller.userProfile.data!.address!.isEmpty
              ? Container()
              : _userAddressText(),
          controller.userProfile.data?.dateOfBirth != null &&
                  controller.userProfile.data!.dateOfBirth!.isEmpty
              ? Container()
              : _userBirthDayText(),
          controller.userProfile.data?.gender != null &&
                  controller.userProfile.data!.gender!.isEmpty
              ? Container()
              : _userGenderText(),
        ],
      ),
    );
  }

  _userNameText() {
    return userName(
        text: controller.userProfile.data?.fullName.toString() ??
            AppString.text_not_added_yet);
  }

  _userDesignationText() {
    return designationText(
        desText: controller.userProfile.data?.designationName.toString() ?? "",
        status: controller.userProfile.data?.employmentStatus.toString() ?? "");
  }

  _userAboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFieldTitleText(titleText: AppString.text_about_me),
        aboutText(text: controller.userProfile.data?.aboutMe.toString() ?? ""),
      ],
    );
  }

  _departmentText() {
    return cardView(
        dynamicText:
            controller.userProfile.data?.departmentName.toString() ?? "",
        titleText: AppString.text_department,
        icon: Icons.work_outline_outlined);
  }

  _userWorkShiftText() {
    return cardView(
        titleText: AppString.text_workShift,
        dynamicText:
            controller.userProfile.data?.workingShiftName.toString() ?? "",
        icon: Icons.access_time_outlined);
  }

  _userEmailText() {
    return cardView(
        dynamicText: controller.userProfile.data?.email.toString() ?? "",
        titleText: AppString.text_email,
        icon: CupertinoIcons.mail);
  }

  _userContactText() {
    return cardView(
        dynamicText: controller.userProfile.data?.contact.toString() ?? "",
        titleText: AppString.text_phone,
        icon: CupertinoIcons.phone);
  }

  _userIdText() {
    return cardView(
        dynamicText: controller.userProfile.data?.employyeId.toString() ?? "",
        titleText: AppString.text_employee_id,
        icon: CupertinoIcons.person);
  }

  _userAddressText() {
    return cardView(
        dynamicText: controller.userProfile.data?.address.toString() ?? "",
        titleText: AppString.text_address,
        icon: CupertinoIcons.home);
  }

  _userBirthDayText() {
    return cardView(
        dynamicText: controller.userProfile.data?.dateOfBirth.toString() ?? "",
        titleText: AppString.text_birthday,
        icon: Icons.card_giftcard);
  }

  _userGenderText() {
    return cardView(
        dynamicText: controller.userProfile.data?.gender.toString() ?? "",
        titleText: AppString.text_gender,
        icon: Icons.male);
  }

  _userProfileAppbar(context) {
    final controller = Get.find<InputTextFieldController>();
    final profileController = Get.find<ProfileDataController>();
    return profileViewAppbar(
        titleText: AppString.text_my_profile,
        rightBtnAction: () {
          controller.firstNameController.text = profileController.userProfile.data?.firstName ?? "";
          controller.lastNameController.text =
              profileController.userProfile.data?.lastName ?? "";
          controller.emailController.text =
              profileController.userProfile.data?.email ?? "";
          controller.contactController.text =
              profileController.userProfile.data?.contact ?? "";
          Get.find<DropdownBtnController>().dropdownValue.toString();
          controller.aboutMeController.text =
              profileController.userProfile.data?.aboutMe ?? "";
          controller.addressController.text =
              profileController.userProfile.data?.address ?? "";
          Get.find<DatePickerController>().dobDateController.value.text =
              _dateFormat;
          defaultNavigator(context: context, routeName: EditProfile());
        });
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
