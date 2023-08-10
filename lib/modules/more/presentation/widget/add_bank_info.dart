import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/success_message.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/bank_info_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

class AddBankInfo extends GetView<BankInfoController> {
  final _formKey = GlobalKey<FormState>();

  AddBankInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppLayout.getWidth(20),
                    right: AppLayout.getWidth(20)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _addBankInfoAppbar(context),
                      customSpacerHeight(height: 8),
                      textFieldTitleText(titleText: AppString.text_bank_name),
                      //add bank name text field here
                      _addBankNameLayout(),

                      customSpacerHeight(height: 8),
                      //add bank branch text field here
                      _addBankBranchAndCode(),

                      customSpacerHeight(height: 8),
                      textFieldTitleText(
                          titleText: AppString.text_account_holder),
                      //add bank account holder text field here
                      _addBankAccountHolderLayout(),

                      customSpacerHeight(height: 8),
                      textFieldTitleText(
                          titleText: AppString.text_account_number),
                      //add bank user account text field here
                      _addBankUserAccountLayout(),

                      customSpacerHeight(height: 8),
                      textFieldTitleText(
                          titleText: AppString.text_account_title),
                      //add bank account title text field here
                      _addBankAccountTitleLayout(),

                      customSpacerHeight(height: 8),
                      textFieldTitleText(
                          titleText: AppString.text_tax_payer_id),
                      //add bank tex id text field here
                      _addBankTaxIdLayout(),

                      customSpacerHeight(height: 50),

                      Obx(() => _buttonLayout(context)),

                      customSpacerHeight(height: 250)
                    ],
                  ),
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  _buttonLayout(context) {
    return Get.find<BankInfoController>().isLoading.isTrue
        ? loadingIndicatorLayout()
        : customDoubleButton(
            context: context,
            elevatedBtnText: '${AppString.text_add}${AppString.text_details}',
            textBtnText: AppString.text_cancel,
            textButtonAction: () => Get.back(),
            elevatedButtonAction: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (_formKey.currentState!.validate()) {
                Get.find<BankInfoController>()
                    .addBankInformation(context: context)
                    .then((value) {
                  if (value == true) {
                    Get.back(canPop: false);
                    Get.find<BankInfoController>().getBankInformation();
                    showSuccessMessage(
                        message:
                            AppString.text_bank_details_added_successfully);
                  }
                });
              }
            });
  }

  _addBankInfoAppbar(context) {
    return bottomSheetAppbar(
      context: context,
      appbarTitle: AppString.text_add_bank_details,
    );
  }

  _addBankNameLayout() {
    return CustomTextField(
      hintText: AppString.text_enter_bank_name,
      controller: Get.find<InputTextFieldController>().bankNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return AppString.fieldIsRequired;
        }
        return null;
      },
    );
  }

  _addBankBranchAndCode() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldTitleText(titleText: AppString.text_branch),
              CustomTextField(
                hintText: AppString.text_enter_branch,
                controller:
                    Get.find<InputTextFieldController>().branchNameController,
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
                hintText: AppString.text_enter_bank_code,
                controller:
                    Get.find<InputTextFieldController>().bankCodeController,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _addBankAccountHolderLayout() {
    return CustomTextField(
      hintText: AppString.text_enter_name,
      controller:
          Get.find<InputTextFieldController>().accountHolderNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return AppString.fieldIsRequired;
        }
        return null;
      },
    );
  }

  _addBankUserAccountLayout() {
    return CustomTextField(
      hintText: AppString.text_enter_account_number,
      controller: Get.find<InputTextFieldController>().accountNumberController,
      validator: (value) {
        if (value!.isEmpty) {
          return AppString.fieldIsRequired;
        }
        return null;
      },
    );
  }

  _addBankAccountTitleLayout() {
    return CustomTextField(
      hintText: AppString.text_enter_title,
      controller: Get.find<InputTextFieldController>().accountTitleController,
      validator: (value) {
        if (value!.isEmpty) {
          return AppString.fieldIsRequired;
        }
        return null;
      },
    );
  }

  _addBankTaxIdLayout() {
    return CustomTextField(
      hintText: AppString.text_enter_id,
      controller: Get.find<InputTextFieldController>().taxPayerIdController,
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
