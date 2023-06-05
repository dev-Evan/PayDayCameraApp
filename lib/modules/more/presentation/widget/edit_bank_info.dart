import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_data_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class EditBankInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppLayout.getWidth(20), right: AppLayout.getWidth(20)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bottomSheetAppbar(
              context: context,
              appbarTitle: AppString.text_edit_bank_details,
            ),
            customSpacerHeight(height: 8),
            textFieldTitleText(titleText: AppString.text_bank_name),
            CustomTextFeild(
              hintText: AppString.text_enter_bank_name,
              controller:
              Get.find<CustomTextEditingController>().bankNameController,
            ),
            customSpacerHeight(height: 8),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_branch),
                      CustomTextFeild(
                        hintText:AppString.text_enter_branch,
                        controller: Get.find<CustomTextEditingController>()
                            .branchNameController,
                      ),
                    ],
                  ),
                ),
                customSpacerWidth(width: 18),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_bank_code),
                      CustomTextFeild(
                          hintText:AppString.text_enter_bank_code,
                          controller: Get.find<CustomTextEditingController>()
                              .bankCodeController),
                    ],
                  ),
                ),
              ],
            ),
            customSpacerHeight(height: 8),
            textFieldTitleText(titleText: AppString.text_account_holder),
            CustomTextFeild(
              hintText:  AppString.text_enter_name,
              controller: Get.find<CustomTextEditingController>()
                  .accountHolderNameController,
            ),
            customSpacerHeight(height: 8),
            textFieldTitleText(titleText: AppString.text_account_number),
            CustomTextFeild(
              hintText: AppString.text_enter_account_number,
              controller: Get.find<CustomTextEditingController>()
                  .accountNumberController,
            ),
            customSpacerHeight(height: 8),
            textFieldTitleText(titleText: AppString.text_account_title),
            CustomTextFeild(
              hintText: AppString.text_enter_title,
              controller: Get.find<CustomTextEditingController>()
                  .accountTitleController,
            ),
            customSpacerHeight(height: 8),
            textFieldTitleText(titleText: AppString.text_tax_payer_id),
            CustomTextFeild(
              hintText: AppString.text_enter_id,
              controller:
              Get.find<CustomTextEditingController>().taxPayerIdController,
            ),
            customSpacerHeight(height: 50),
            customDoubleButton(
                context: context,
                elevatedBtnText:
                '${AppString.text_save_changes}',
                textBtnText: AppString.text_cancel,
                textButtonAction: () => Get.back(),
                elevatedButtonAction: () {
                  Get.find<MoreDataController>().updateBankInfo(context: context);
                }),
            customSpacerHeight(height: 250)
          ],
        ),
      ),
    );
  }
}

Future clearData() async {
  Get.find<CustomTextEditingController>().bankNameController.clear();
  Get.find<CustomTextEditingController>().branchNameController.clear();
  Get.find<CustomTextEditingController>().bankCodeController.clear();
  Get.find<CustomTextEditingController>().accountHolderNameController.clear();
  Get.find<CustomTextEditingController>().accountNumberController.clear();
  Get.find<CustomTextEditingController>().accountTitleController.clear();
  Get.find<CustomTextEditingController>().taxPayerIdController.clear();
}
