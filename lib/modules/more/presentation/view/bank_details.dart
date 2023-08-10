import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/no_data_found.dart';
import 'package:pay_day_mobile/common/widget/success_message.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_bank_info.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/address_details_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_bank_info.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/custom_dialog_layout.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../controller/bank_info_controller.dart';

class BankDetails extends GetView<BankInfoController> {
  const BankDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx(
          (state) => RefreshIndicator(
                onRefresh: _refreshPage,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _bankInfoAppbarLayout(),
                      (controller.bankInfoModel.data?.accountTitle != null &&
                              controller
                                  .bankInfoModel.data!.accountTitle!.isNotEmpty)
                          ? _bankInfoLayout(context)
                          : _noAddedBankInfo(context),
                    ],
                  ),
                ),
              ),
          onLoading: const LoadingIndicator()),
    );
  }


  _accountHolderLayout() {
    return _bankUserInfo(
        infoTitleText: AppString.text_account_holder,
        infoDetailsText:
            controller.bankInfoModel.data?.accountHolderName?.toString() ?? "");
  }

  _accountNumberLayout() {
    return _bankUserInfo(
        infoTitleText: AppString.text_account_number,
        infoDetailsText:
            controller.bankInfoModel.data?.accountNumber?.toString() ?? "");
  }

  _accountTitleLayout() {
    return _bankUserInfo(
        infoTitleText: AppString.text_account_title,
        infoDetailsText:
            controller.bankInfoModel.data?.accountTitle?.toString() ?? "");
  }

  _branchNameLayout() {
    return _bankUserInfo(
        infoTitleText: AppString.text_branch,
        infoDetailsText:
            controller.bankInfoModel.data?.branchName?.toString() ?? "");
  }

  _bankCodeLayout() {
    return _bankUserInfo(
        infoTitleText: controller.bankInfoModel.data?.code != null
            ? AppString.text_bank_code
            : "",
        infoDetailsText: controller.bankInfoModel.data?.code?.toString() ?? "");
  }

  _taxPayerIdLayout() {
    return _bankUserInfo(
        infoTitleText: AppString.text_tax_payer_id,
        infoDetailsText:
            controller.bankInfoModel.data?.taxPayerId?.toString() ?? "");
  }

  _bankInfoLayout(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _bankTitleRow(
            bankTitleText:
                controller.bankInfoModel.data?.name?.toString() ?? "",
            context: context),
        controller.bankInfoModel.data?.accountHolderName != null
            ? _accountHolderLayout()
            : Container(),
        controller.bankInfoModel.data?.accountNumber != null
            ? _accountNumberLayout()
            : Container(),
        controller.bankInfoModel.data?.accountTitle != null
            ? _accountTitleLayout()
            : Container(),
        controller.bankInfoModel.data?.branchName != null
            ? _branchNameLayout()
            : Container(),
        controller.bankInfoModel.data?.code != null
            ? _bankCodeLayout()
            : Container(),
        controller.bankInfoModel.data?.taxPayerId != null
            ? _taxPayerIdLayout()
            : Container()
      ],
    );
  }
  Future<void> _refreshPage() async {
    controller.getBankInformation();
  }

  _noAddedBankInfo(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          noDataFound(height: 136),
          const Spacer(),
          _addBankInfo(onAction: () {
            customButtonSheet(context: context, height: 0.9, child: AddBankInfo());
          }),
          customSpacerHeight(height: 172),
        ],
      ),
    );
  }

  _bankInfoAppbarLayout() {
    return customMoreAppbar(
        titleText: controller.bankInfoModel.data?.name != null
            ? AppString.text_bank_details
            : "");
  }
}

Widget _bankTitleRow({required bankTitleText, required context}) {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(20),
        right: AppLayout.getWidth(20),
        top: AppLayout.getHeight(20),
        bottom: AppLayout.getHeight(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _bankTitleText(bankText: bankTitleText)),
        _editDeleteBtn(
            onAction: ()=>_bankInfoDialog(),
            editAction: () {
             _routeForEditBankInfo(context);
              Get.find<InputTextFieldController>().bankNameController.text =
                  Get.find<BankInfoController>()
                          .bankInfoModel
                          .data
                          ?.name
                          ?.toString() ??
                      "";
              Get.find<InputTextFieldController>().branchNameController.text =
                  Get.find<BankInfoController>()
                          .bankInfoModel
                          .data
                          ?.branchName
                          ?.toString() ??
                      "";

              Get.find<InputTextFieldController>().bankCodeController.text =
                  Get.find<BankInfoController>()
                          .bankInfoModel
                          .data
                          ?.code
                          ?.toString() ??
                      "";
              Get.find<InputTextFieldController>()
                  .accountHolderNameController
                  .text = Get.find<BankInfoController>()
                      .bankInfoModel
                      .data
                      ?.accountHolderName
                      ?.toString() ??
                  "";

              Get.find<InputTextFieldController>()
                  .accountNumberController
                  .text = Get.find<BankInfoController>()
                      .bankInfoModel
                      .data
                      ?.accountNumber
                      ?.toString() ??
                  "";

              Get.find<InputTextFieldController>().accountTitleController.text =
                  Get.find<BankInfoController>()
                          .bankInfoModel
                          .data
                          ?.accountTitle
                          ?.toString() ??
                      "";
              Get.find<InputTextFieldController>().taxPayerIdController.text =
                  Get.find<BankInfoController>()
                          .bankInfoModel
                          .data
                          ?.taxPayerId
                          ?.toString() ??
                      "";
            },
            context: context),
      ],
    ),
  );
}

 _routeForEditBankInfo(context) {
  return  customButtonSheet(
    context: context,
    height: 0.9,
    child: EditBankInfo(),
  );
}

_bankInfoDialog() {
  return   customDialogLayout(
      controller: Get.find<BankInfoController>(),
      onAction: () {
        Get.find<BankInfoController>()
            .deletedBankInformation()
            .then((value) {
          Get.back(canPop: false);
          Get.find<BankInfoController>().getBankInformation();
          showSuccessMessage(
              message:
              AppString.text_bank_details_deleted_successfully);
        });
      });
}

Widget _editDeleteBtn({required context, onAction, required editAction}) {
  return Row(
    children: [
      InkWell(onTap: () => editAction(), child: editIcon()),
      customSpacerWidth(width: 28),
      InkWell(
        onTap: () => onAction(),
        child: const Icon(
          CupertinoIcons.delete,
          color: AppColor.hintColor,
          size: 20,
        ),
      ),
    ],
  );
}

Widget _bankTitleText({required bankText}) {
  return Padding(
    padding: EdgeInsets.only(right: AppLayout.getWidth(16)),
    child: Text(
      bankText,
      style: AppStyle.title_text.copyWith(
          color: AppColor.normalTextColor,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSizeMid),
    ),
  );
}

Widget _addBankInfo({onAction}) {
  return Padding(
    padding: const EdgeInsets.only(left: 14.0, right: 14),
    child: CustomButton(AppString.text_add_bank_details, onAction),
  );
}

Widget _bankUserInfo({required infoTitleText, infoDetailsText}) {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(20),
        right: AppLayout.getWidth(20),
        top: AppLayout.getHeight(12),
        bottom: AppLayout.getHeight(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textTitle(titleText: infoTitleText),
        textSubTitle(subTitleText: infoDetailsText),
      ],
    ),
  );
}
