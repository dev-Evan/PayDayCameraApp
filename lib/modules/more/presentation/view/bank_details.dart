import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_bank_info.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/address_details_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_bank_info.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../controller/more_data_controller.dart';

class BankDetails extends GetView<MoreDataController> {
  const BankDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx(
          (state) => Container(
                child: Stack(
                  children: [
                    (controller.bankInfoModel.data?.accountTitle != null &&
                            controller
                                .bankInfoModel.data!.accountTitle!.isNotEmpty)
                        ? SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customMoreAppbar(
                                    titleText: AppString.text_bank_details),
                                _bankTitleRow(
                                    bankTitleText: controller
                                            .bankInfoModel.data?.name
                                            ?.toString() ??
                                        "",
                                    context: context),
                                _bankUserInfo(
                                    infoTitleText: AppString.text_branch,
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.branchName
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText: AppString.text_bank_code,
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.code
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText: AppString.text_account_holder,
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.accountHolderName
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText: AppString.text_account_number,
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.accountNumber
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText: AppString.text_account_title,
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.accountTitle
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText: AppString.text_tax_payer_id,
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.taxPayerId
                                            ?.toString() ??
                                        "")
                              ],
                            ),
                        )
                        : Column(
                            children: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    customSpacerHeight(height: 158),
                                    logoView(
                                      height: 160,
                                      width: 160,
                                      url: Images.no_data_found,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              _addBankInfo(onAction: () {
                                customButtonSheet(
                                    context: context,
                                    height: 0.9,
                                    child: AddBankInfo());
                              }),
                              customSpacerHeight(height: 25)
                            ],
                          )
                  ],
                ),
              ),
          onLoading: LoadingIndicator()),
    );
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
        _bankTitleText(bankText: bankTitleText),
        _editDeleteBtn(
            onAction: () => Get.find<MoreDataController>().deletedBankInfoApi(),
            editAction: () {
              customButtonSheet(
                context: context,
                height: 0.9,
                child: EditBankInfo(),
              );
              Get.find<CustomTextEditingController>().bankNameController.text =
                  Get.find<MoreDataController>()
                          .bankInfoModel
                          .data
                          ?.name
                          ?.toString() ??
                      "";
              Get.find<CustomTextEditingController>()
                  .branchNameController
                  .text = Get.find<MoreDataController>()
                      .bankInfoModel
                      .data
                      ?.branchName
                      ?.toString() ??
                  "";

              Get.find<CustomTextEditingController>().bankCodeController.text =
                  Get.find<MoreDataController>()
                          .bankInfoModel
                          .data
                          ?.code
                          ?.toString() ??
                      "";
              Get.find<CustomTextEditingController>()
                  .accountHolderNameController
                  .text = Get.find<MoreDataController>()
                      .bankInfoModel
                      .data
                      ?.accountHolderName
                      ?.toString() ??
                  "";

              Get.find<CustomTextEditingController>()
                  .accountNumberController
                  .text = Get.find<MoreDataController>()
                      .bankInfoModel
                      .data
                      ?.accountNumber
                      ?.toString() ??
                  "";

              Get.find<CustomTextEditingController>()
                  .accountTitleController
                  .text = Get.find<MoreDataController>()
                      .bankInfoModel
                      .data
                      ?.accountTitle
                      ?.toString() ??
                  "";
              Get.find<CustomTextEditingController>()
                  .taxPayerIdController
                  .text = Get.find<MoreDataController>()
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
  return Text(
    bankText,
    style: AppStyle.title_text.copyWith(
        color: AppColor.normalTextColor,
        fontWeight: FontWeight.bold,
        fontSize: Dimensions.fontSizeMid),
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
