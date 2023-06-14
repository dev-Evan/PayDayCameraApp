import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/change_password_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

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
                  onAction: (){
                    Get.back();
                    _cleanData();
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
                      controller: Get.find<CustomTextEditingController>()
                          .oldPassController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.the_old_password_field_is_required;
                        } else if (value.length < 6) {
                          return AppString.the_old_password_must_be_at_least_6_character;
                        }else if(value !=GetStorage().read(AppString.STORE_CURRENT_PASSWORD)){
                          return AppString.old_password_incorrect;

                        }
                        else{
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
                      controller: Get.find<CustomTextEditingController>()
                          .newPasswordController,
                      validator: (value) {

                        if (value!.isEmpty) {
                          return AppString.the_new_password_field_is_required;
                        } else if (value.length < 8) {
                          return AppString.the_password_must_be_at_least_8_character;
                        }else if (value.isEmpty || !RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*\W)")
                            .hasMatch(value)) {
                          errorSnackBar(errorMessage:AppString.password_must_contains_number_and_etc );
                          return AppString.cant_not_be_correct_please_follow_this;
                        }else{
                          return null;
                        }

                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: textFieldTitleText(
                            titleText: AppString.text_confirm_password)),
                    CustomPasswordTextField(
                      hintText: AppString.text_confirm_your_new_password,
                      inputType: TextInputType.text,
                      controller: Get.find<CustomTextEditingController>()
                          .confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.the_confirm_password_field_is_required;
                        } else if (value.length < 8) {
                          return AppString.the_password_must_be_at_least_8_character;
                        } else if (value != Get.find<CustomTextEditingController>().newPasswordController.text) {
                          return AppString.the_password_confirmation_does_not_match;
                        }else{
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
                    Get.find<ChangePassController>().changePassword();
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

_cleanData() {
  Get.find<CustomTextEditingController>().oldPassController.clear();
  Get.find<CustomTextEditingController>().newPasswordController.clear();
  Get.find<CustomTextEditingController>().confirmPasswordController.clear();
}
