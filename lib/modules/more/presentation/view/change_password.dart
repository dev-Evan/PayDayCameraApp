import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/change_password_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_string.dart';


class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customMoreAppbar(titleText: AppString.text_change_password),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 8, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(titleText: AppString.text_old_password )

                  ),
                  CustomPasswordTextField(
                    hintText: AppString.text_enter_your_old_password,
                    inputType: TextInputType.text,
                    controller: Get.find<ChangePassController>().oldPassController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(titleText: AppString.text_new_password )

                  ),
                  CustomPasswordTextField(
                    hintText: AppString.text_enter_new_password,
                    inputType: TextInputType.text,
                    controller: Get.find<ChangePassController>().passwordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(titleText: AppString.text_confirm_password )
                  ),
                  CustomPasswordTextField(
                    hintText: AppString.text_confirm_your_new_password,
                    inputType: TextInputType.text,
                    controller: Get.find<ChangePassController>().confirmPasswordController,
                  ),
                ],
              ),
            ),
         
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(AppString.text_save, () {
                Get.find<ChangePassController>().changePassword();
              }),
            ),
            customSpacerHeight(height: 14),
          ],
        ),
      ),
    );
  }
}
