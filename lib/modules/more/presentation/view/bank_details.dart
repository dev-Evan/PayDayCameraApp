import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
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
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../controller/bank_info_controller.dart';

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
                                    titleText:
                                    controller
                                        .bankInfoModel.data?.name !=null?

                                    AppString.text_bank_details:""



                                ),
                                _bankTitleRow(
                                    bankTitleText: controller
                                            .bankInfoModel.data?.name
                                            ?.toString() ??
                                        "",
                                    context: context),
                                _bankUserInfo(
                                    infoTitleText:
                                    controller
                                        .bankInfoModel.data?.branchName !=null?


                                    AppString.text_branch:"",
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.branchName
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText: controller
                                        .bankInfoModel.data?.code !=null?


                                    AppString.text_bank_code:"",
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.code
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText:controller
                                        .bankInfoModel.data?.accountHolderName !=null?
                                        AppString.text_account_holder:"",
                                    infoDetailsText: controller.bankInfoModel
                                            .data?.accountHolderName
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText:controller
                                        .bankInfoModel.data?.accountNumber !=null?
                                        AppString.text_account_number:"",
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.accountNumber
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText:
                                    controller
                                        .bankInfoModel.data?.accountTitle !=null?

                                    AppString.text_account_title:"",
                                    infoDetailsText: controller
                                            .bankInfoModel.data?.accountTitle
                                            ?.toString() ??
                                        ""),
                                _bankUserInfo(
                                    infoTitleText:
                                    controller
                                        .bankInfoModel.data?.taxPayerId !=null?

                                    AppString.text_tax_payer_id:"",
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
                                  children: [
                                    customSpacerHeight(height: 230),
                                    svgIcon(
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
            onAction: () => _deletedAlert(
                  context: context,
                  onAction: () =>
                      Get.find<MoreDataController>().deletedBankInfoApi(),
                ),
            editAction: () {
              customButtonSheet(
                context: context,
                height: 0.9,
                child: EditBankInfo(),
              );
              Get.find<InputTextFieldController>().bankNameController.text =
                  Get.find<MoreDataController>()
                          .bankInfoModel
                          .data
                          ?.name
                          ?.toString() ??
                      "";
              Get.find<InputTextFieldController>()
                  .branchNameController
                  .text = Get.find<MoreDataController>()
                      .bankInfoModel
                      .data
                      ?.branchName
                      ?.toString() ??
                  "";

              Get.find<InputTextFieldController>().bankCodeController.text =
                  Get.find<MoreDataController>()
                          .bankInfoModel
                          .data
                          ?.code
                          ?.toString() ??
                      "";
              Get.find<InputTextFieldController>()
                  .accountHolderNameController
                  .text = Get.find<MoreDataController>()
                      .bankInfoModel
                      .data
                      ?.accountHolderName
                      ?.toString() ??
                  "";

              Get.find<InputTextFieldController>()
                  .accountNumberController
                  .text = Get.find<MoreDataController>()
                      .bankInfoModel
                      .data
                      ?.accountNumber
                      ?.toString() ??
                  "";

              Get.find<InputTextFieldController>()
                  .accountTitleController
                  .text = Get.find<MoreDataController>()
                      .bankInfoModel
                      .data
                      ?.accountTitle
                      ?.toString() ??
                  "";
              Get.find<InputTextFieldController>()
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

Future _deletedAlert({required context, onAction}) {
  return CustomAlertDialog(
      context: context,
      icon: CupertinoIcons.delete,
      backAction: () {
        if (Get.find<MoreDataController>().newValue.toString().isNotEmpty) {
          Navigator.pop(context);
        } else {
           Navigator.pop(context);
        }
      },
      iconBgColor: Colors.orange.shade50,
      yesAction: () => onAction());
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
