import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/bank_info_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class EditBankInfo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
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
              CustomTextField(
                hintText: AppString.text_enter_bank_name,
                controller:
                Get.find<InputTextFieldController>().bankNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppString.fieldIsRequired;
                  }
                  return null;
                },
              ),
              customSpacerHeight(height: 8),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldTitleText(titleText: AppString.text_branch),
                        CustomTextField(
                          hintText:AppString.text_enter_branch,
                          controller: Get.find<InputTextFieldController>()
                              .branchNameController,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppString.fieldIsRequired;
                            }
                            return null;
                          },
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
                        CustomTextField(
                            hintText:AppString.text_enter_bank_code,
                            controller: Get.find<InputTextFieldController>()
                                .bankCodeController,


                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppString.fieldIsRequired;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              customSpacerHeight(height: 8),
              textFieldTitleText(titleText: AppString.text_account_holder),
              CustomTextField(
                hintText:  AppString.text_enter_name,
                controller: Get.find<InputTextFieldController>()
                    .accountHolderNameController,

                validator: (value) {
                  if (value!.isEmpty) {
                    return AppString.fieldIsRequired;
                  }
                  return null;
                },
              ),
              customSpacerHeight(height: 8),
              textFieldTitleText(titleText: AppString.text_account_number),
              CustomTextField(
                hintText: AppString.text_enter_account_number,
                controller: Get.find<InputTextFieldController>()
                    .accountNumberController,

                validator: (value) {
                  if (value!.isEmpty) {
                    return AppString.fieldIsRequired;
                  }
                  return null;
                },
              ),
              customSpacerHeight(height: 8),
              textFieldTitleText(titleText: AppString.text_account_title),
              CustomTextField(
                hintText: AppString.text_enter_title,
                controller: Get.find<InputTextFieldController>()
                    .accountTitleController,

                validator: (value) {
                  if (value!.isEmpty) {
                    return AppString.fieldIsRequired;
                  }
                  return null;
                },
              ),
              customSpacerHeight(height: 8),
              textFieldTitleText(titleText: AppString.text_tax_payer_id),
              CustomTextField(
                hintText: AppString.text_enter_id,
                controller:
                Get.find<InputTextFieldController>().taxPayerIdController,


              ),
              customSpacerHeight(height: 50),
              customDoubleButton(
                  context: context,
                  elevatedBtnText:
                  '${AppString.text_save_changes}',
                  textBtnText: AppString.text_cancel,
                  textButtonAction: () => Get.back(),
                  elevatedButtonAction: () {

    if (_formKey.currentState!.validate()) {
      Get.find<MoreDataController>().updateBankInfo(context: context);

    }

                  }),
              customSpacerHeight(height: 250)
            ],
          ),
        ),
      ),
    );
  }
}

Future clearData() async {
  Get.find<InputTextFieldController>().bankNameController.clear();
  Get.find<InputTextFieldController>().branchNameController.clear();
  Get.find<InputTextFieldController>().bankCodeController.clear();
  Get.find<InputTextFieldController>().accountHolderNameController.clear();
  Get.find<InputTextFieldController>().accountNumberController.clear();
  Get.find<InputTextFieldController>().accountTitleController.clear();
  Get.find<InputTextFieldController>().taxPayerIdController.clear();
}
