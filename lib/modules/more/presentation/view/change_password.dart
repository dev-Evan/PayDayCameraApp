import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../controller/user_profile_controller.dart';

class ChangePassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customMoreAppbar(
                  titleText: AppString.text_change_password,
                  onAction: () {
                    Get.back();
                    cleanPassData();
                  }),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12.0, bottom: 8, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: textFieldTitleText(
                            titleText: AppString.text_old_password)),
                    CustomPasswordTextField(
                      hintText: AppString.text_enter_your_old_password,
                      inputType: TextInputType.text,
                      controller: Get.find<InputTextFieldController>()
                          .oldPassController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.the_old_password_field_is_required;
                        } else if (value.length < 6) {
                          return AppString
                              .the_old_password_must_be_at_least_6_character;
                        } else if (value !=
                            GetStorage()
                                .read(AppString.STORE_CURRENT_PASSWORD)) {
                          return AppString.old_password_incorrect;
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: textFieldTitleText(
                            titleText: AppString.text_new_password)),
                    CustomPasswordTextField(
                      hintText: AppString.text_enter_new_password,
                      inputType: TextInputType.text,
                      controller: Get.find<InputTextFieldController>()
                          .newPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.the_new_password_field_is_required;
                        } else if (value.length < 8) {
                          return AppString
                              .the_password_must_be_at_least_8_character;
                        } else if (value.isEmpty ||
                            !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*\W)")
                                .hasMatch(value)) {
                          errorSnackBar(
                              errorMessage: AppString
                                  .password_must_contains_number_and_etc);
                          return AppString
                              .cant_not_be_correct_please_follow_this;
                        } else {
                          return null;
                        }
                      },
                    ),
                    alertBox(context: context,alertText: AppString.text_password_alert_text),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: textFieldTitleText(
                            titleText: AppString.text_confirm_password)),
                    CustomPasswordTextField(
                      hintText: AppString.text_confirm_your_new_password,
                      inputType: TextInputType.text,
                      controller: Get.find<InputTextFieldController>()
                          .confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString
                              .the_confirm_password_field_is_required;
                        } else if (value.length < 8) {
                          return AppString
                              .the_password_must_be_at_least_8_character;
                        } else if (value !=
                            Get.find<InputTextFieldController>()
                                .newPasswordController
                                .text) {
                          return AppString
                              .the_password_confirmation_does_not_match;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(AppString.text_save, () {
                  if (_formKey.currentState!.validate()) {
                    Get.find<ProfileDataController>().changePassword(
                        oldPassword: Get.find<InputTextFieldController>()
                            .oldPassController
                            .text,
                        newPassword: Get.find<InputTextFieldController>()
                            .newPasswordController
                            .text,
                        confirmPass: Get.find<InputTextFieldController>()
                            .confirmPasswordController
                            .text);
                  }
                }),
              ),
              customSpacerHeight(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}

cleanPassData() {
  Get.find<InputTextFieldController>().oldPassController.clear();
  Get.find<InputTextFieldController>().newPasswordController.clear();
  Get.find<InputTextFieldController>().confirmPasswordController.clear();
}

Widget alertBox({required context,required  alertText}) {
  return Container(
    margin:
        EdgeInsets.only(top: AppLayout.getHeight(Dimensions.fontSizeDefault)),
    width: MediaQuery.of(context).size.width,
    decoration: _boxDecoration,
    child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(
                top: AppLayout.getHeight(Dimensions.fontSizeDefault),
                left: AppLayout.getWidth(Dimensions.fontSizeDefault),
                right: AppLayout.getWidth(Dimensions.fontSizeDefault - 6),
                bottom: AppLayout.getHeight(Dimensions.fontSizeDefault)),
            child: Text(
              alertText,
              style: alertTextStyle,
            ))
      ],
    ),
  );
}

Decoration get _boxDecoration {
  return AppStyle.ContainerStyle.copyWith(
      color: AppColor.alertBgColor, borderRadius: borderRadius);
}

BorderRadius get borderRadius {
  return BorderRadius.circular(Dimensions.radiusDefault);
}

TextStyle get alertTextStyle {
  return GoogleFonts.poppins(
      color: AppColor.normalTextColor.withOpacity(0.6),
      fontWeight: FontWeight.w300,
      fontSize: Dimensions.fontSizeDefault,fontStyle: FontStyle.italic);
}
