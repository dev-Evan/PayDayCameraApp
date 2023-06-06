import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/input_note.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/date_of_birth_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/edit_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/edit_profile_drop_dawon_cnt.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/defult_date_of_birth_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../widget/edit_address.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  final List<String> _locations = [AppString.text_male, AppString.text_female];
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    final _box = GetStorage();
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customMoreAppbar(titleText: AppString.text_edit_profile),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFieldTitleText(
                                titleText: AppString.text_first +
                                    " " +
                                    AppString.text_name),
                            CustomTextFeild(
                              hintText: Get.find<ProfileDataController>()
                                      .userProfile
                                      .data
                                      ?.firstName ??
                                  AppString.text_first +
                                      " " +
                                      AppString.text_name,
                              controller:
                                  Get.find<CustomTextEditingController>()
                                      .firstNameController,
                            ),
                          ],
                        ),
                      ),
                      customSpacerWidth(width: 12),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFieldTitleText(
                                titleText: AppString.text_last +
                                    " " +
                                    AppString.text_name),
                            CustomTextFeild(
                              hintText: Get.find<ProfileDataController>()
                                      .userProfile
                                      .data
                                      ?.lastName ??
                                  AppString.text_last +
                                      " " +
                                      AppString.text_name,
                              controller:
                                  Get.find<CustomTextEditingController>()
                                      .lastNameController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  textFieldTitleText(titleText: AppString.text_email),
                  CustomTextFeild(
                    hintText: Get.find<ProfileDataController>()
                            .userProfile
                            .data
                            ?.email ??
                        AppString.text_email,
                    controller:
                        Get.find<CustomTextEditingController>().emailController,
                  ),
                  textFieldTitleText(titleText: AppString.text_gender_text),
                  Obx(
                    () => Card(
                      color: AppColor.cardColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                          side: const BorderSide(
                              width: 1.0, color: AppColor.solidGray)),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: DropdownButton<String>(
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          isDense: true,
                          isExpanded: true,
                          underline: const SizedBox.shrink(),
                          icon: const Icon(Icons.expand_more),
                          iconEnabledColor: AppColor.normalTextColor,
                          hint: Text(
                            Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.gender ??
                                "",
                            style: AppStyle.normal_text
                                .copyWith(color: AppColor.normalTextColor),
                          ),
                          value: Get.find<DropdownBtnController>()
                              .dropdownValue
                              .value,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault),
                          items: _locations
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: AppStyle.normal_text.copyWith(
                                      color: AppColor.normalTextColor)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            Get.find<DropdownBtnController>()
                                .onValueChanged(newValue!);
                            print(newValue.toString());
                          },
                        ),
                      ),
                    ),
                  ),
                  textFieldTitleText(titleText: AppString.text_phone),
                  phoneAndCountyField(
                    hintText: Get.find<ProfileDataController>()
                            .userProfile
                            .data
                            ?.contact ??
                        "",
                    controller: Get.find<CustomTextEditingController>()
                        .contactController,
                  ),
                  textFieldTitleText(titleText: AppString.text_address_details),
                  InputNote(
                    hintText: Get.find<ProfileDataController>()
                            .userProfile
                            .data
                            ?.address ??
                        AppString.text_enter_your_address,
                    controller: Get.find<CustomTextEditingController>()
                        .addressController,
                  ),
                  textFieldTitleText(titleText: AppString.text_date_of_birth),
                  Obx(() => dateOfBirthField(context:context)),
                  textFieldTitleText(titleText: AppString.text_about_me),
                  InputNote(
                    hintText: Get.find<ProfileDataController>()
                            .userProfile
                            .data
                            ?.aboutMe ??
                        AppString.text_enter_your_about,
                    controller: Get.find<CustomTextEditingController>()
                        .aboutMeController,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomButton(AppString.text_save, () {
                Get.find<EditProfileDataController>().editProfileData(
                    selectedDate:
                        _box.read(AppString.STORE_DATE.toString() ?? ""));
              }),
            )
          ],
        ),
      ),
    );
  }
}


