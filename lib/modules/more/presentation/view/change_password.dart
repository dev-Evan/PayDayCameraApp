import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../controller/change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
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
                  child: Text(
                    AppString.text_old_password,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
                ),
                CustomPasswordTextField(
                  hintText: 'Enter your old password',
                  inputType: TextInputType.text,
                  controller: _oldPasswordController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    AppString.text_new_password,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
                ),
                CustomPasswordTextField(
                  hintText: 'New password',
                  inputType: TextInputType.text,
                  controller: _newPasswordController,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    AppString.text_confirm_password,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
                ),
                CustomPasswordTextField(
                  hintText: 'Confirm your new password',
                  inputType: TextInputType.text,
                  controller: _confirmPasswordController,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton('Save', () {
              final oldPassword=_oldPasswordController.text.toString();
              final newPassword=_newPasswordController.text.toString();
              final confirmPassword=_confirmPasswordController.text.toString();

              AuthController().signUp(oldPassword, newPassword, confirmPassword);
              print(oldPassword);
              print(newPassword);
              print(confirmPassword);
              CustomSuccessAlertDialog(
                titleText: 'Success',
                context: context,
                icon: Icons.published_with_changes,
                iconBgColor: AppColor.successColor.withOpacity(0.2),
                iconColor: AppColor.successColor,
                contentText: 'Password changed successfully',
              );

              // Future.delayed(
              //   const Duration(seconds: 1),
              //   () => CustomNavigator(
              //       context: context, pageName:  ViewProfile()),
              // );
            }),
          ),
          SizedBox(
            height: AppLayout.getHeight(14),
          ),
        ],
      ),
    );
  }
}
