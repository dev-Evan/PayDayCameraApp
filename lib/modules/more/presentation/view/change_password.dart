import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../controller/change_password_controller.dart';
import '../widget/text_title_text.dart';

class ChangePassword extends StatelessWidget {

  ChangePassController changePasswordController =Get.put(ChangePassController());

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
                    controller: changePasswordController.oldPassController.value,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(titleText: AppString.text_new_password )

                  ),
                  CustomPasswordTextField(
                    hintText: AppString.text_enter_new_password,
                    inputType: TextInputType.text,
                    controller: changePasswordController.passwordController.value,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(titleText: AppString.text_confirm_password )
                  ),
                  CustomPasswordTextField(
                    hintText: AppString.text_confirm_your_new_password,
                    inputType: TextInputType.text,
                    controller: changePasswordController.confirmPasswordController.value,
                  ),
                ],
              ),
            ),
         
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(AppString.text_save, () {
                changePasswordController.changePassword();
              }),
            ),
            SizedBox(
              height: AppLayout.getHeight(14),
            ),
          ],
        ),
      ),
    );
  }
}
