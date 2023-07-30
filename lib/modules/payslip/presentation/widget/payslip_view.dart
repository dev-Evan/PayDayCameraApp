import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/no_data_found.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view_sub_widget.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/controller/downloader_helper.dart';
import '../controller/payslip_view_controller.dart';

class PaySlipView extends GetView<PayslipViewController> {
  final indexVal;

  const PaySlipView({super.key, this.indexVal});

  @override
  Widget build(BuildContext context) {
    controller.getPayslipViewData();
    return Container(
      decoration: _openModelRadius,
      child: Column(
        children: [
          _paySlipTopBar(context),
          controller.obx(
              (state) => Expanded(
                  child: controller.payslipViewModel.data != null
                      ? Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _userInfoLayout(),
                                customSpacerHeight(height: 8),
                                _payslipDateLayout(),
                                basicSalaryText(),
                                customSpacerHeight(height: 12),
                                subTitleContainer(
                                    leftText: AppString.text_allowances,
                                    rightText: AppString.text_total),
                                _allowanceLayout(),
                                const Divider(height: 1),
                                _totalAllowance(),
                                subTitleContainer(
                                    leftText: AppString.text_deductions,
                                    rightText: AppString.text_total),
                                _deductionLayout(),
                                const Divider(height: 1),
                                _totalDeduction(),
                                customSpacerHeight(height: 8),
                                summaryText(),
                                summaryTextCard(
                                  subLeftText: AppString.text_basic_salary,
                                  subRightText: controller.payslipViewModel.data
                                          ?.payslip?.basicSalary
                                          .toString() ??
                                      "",
                                ),
                                summaryTextCard(
                                  subLeftText: AppString.text_allowances,
                                  subRightText: controller.payslipViewModel.data
                                          ?.payslip?.totalAllowance
                                          .toString() ??
                                      "",
                                ),
                                summaryTextCard(
                                  subLeftText: AppString.text_deductions,
                                  subRightText: controller.payslipViewModel.data
                                          ?.payslip?.totalDeduction
                                          .toString() ??
                                      "",
                                ),
                                const Divider(height: 1),
                                _netPayable(),
                                _payslipButtonLayout(),
                              ],
                            ),
                          ),
                        )
                      : noDataFound()),
              onLoading:
                  const Expanded(child: Center(child: LoadingIndicator()))),
          customSpacerHeight(height: 26)
        ],
      ),
    );
  }

  _userInfoLayout() {
    return profileCard(
        nameText: Get.find<ProfileDataController>()
                .userProfile
                .data
                ?.fullName
                .toString() ??
            GetStorage().read(AppString.USER_NAME),
        userEmail: Get.find<ProfileDataController>()
                .userProfile
                .data
                ?.email
                .toString() ??
            GetStorage().read(AppString.STORE_CURRENT_EMAIL).toString(),
        payslipId:
            controller.payslipViewModel.data?.payslip?.payslipId.toString() ??
                "");
  }

  _payslipDateLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        payslipVDateCard(
          titleText: AppString.text_create_at,
          dateText:
              controller.payslipViewModel.data?.payslip?.createdAt.toString() ??
                  "",
        ),
        payslipVDateCard(
          titleText: AppString.text_payslip_for,
          dateText:
              '${controller.payslipViewModel.data?.payslip?.startDate ?? ""} - ${controller.payslipViewModel.data?.payslip?.endDate ?? ""}',
        ),
      ],
    );
  }

  _allowanceLayout() {
    return ListView.builder(
      itemCount: controller.payslipViewModel.data?.allowances?.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            subTextCard(
              subLeftText: controller
                      .payslipViewModel.data?.allowances?[index].name
                      .toString() ??
                  "",
              subRightText: controller
                      .payslipViewModel.data?.allowances?[index].amount
                      .toString() ??
                  "",
              isPercentage: controller
                      .payslipViewModel.data?.allowances?[index].isPercentage
                      .toString() ??
                  "",
              value: controller.payslipViewModel.data?.allowances?[index].value
                      .toString() ??
                  "",
            )
          ],
        );
      },
    );
  }

  _totalAllowance() {
    return totalRowView(
        text: "${AppString.text_total} ${AppString.text_allowance}",
        amount:
            " ${controller.payslipViewModel.data?.payslip?.totalAllowance.toString() ?? ""}");
  }

  _deductionLayout() {
    return ListView.builder(
      itemCount: controller.payslipViewModel.data?.deductions?.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            subTextCard(
              subLeftText: controller
                      .payslipViewModel.data?.deductions?[index].name
                      .toString() ??
                  "",
              subRightText: controller
                      .payslipViewModel.data?.deductions?[index].amount
                      .toString() ??
                  "",
              isPercentage: controller
                      .payslipViewModel.data?.deductions?[index].isPercentage
                      .toString() ??
                  "",
              value: controller.payslipViewModel.data?.deductions?[index].value
                      .toString() ??
                  "",
            )
          ],
        );
      },
    );
  }

  _totalDeduction() {
    return totalRowView(
        text: "${AppString.text_total} ${AppString.text_deductions}",
        amount:
            " ${controller.payslipViewModel.data?.payslip?.totalDeduction.toString() ?? ""}");
  }

  _netPayable() {
    return totalRowView(
        amount:
            " ${controller.payslipViewModel.data?.payslip?.netSalary.toString() ?? ""}",
        text: AppString.text_net_payable);
  }

  _payslipButtonLayout() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: _payslipDownloadBtn(
        payslipDateRange:
            '${controller.payslipViewModel.data?.payslip?.startDate ?? ""} - ${controller.payslipViewModel.data?.payslip?.endDate ?? ""}',
      ),
    );
  }

  _paySlipTopBar(context) {
    return bottomSheetAppbar(
        appbarTitle: AppString.text_payslip, context: context);
  }
}

_payslipDownloadBtn({required payslipDateRange}) {
  final box = GetStorage();
  var id = box.read(AppString.STORE_PAYSLIP_LIST_ID);
  var baseUrl = "${Api.BASE_URL}${Api.PAYSLIP_DOWNLOAD}$id?download=true";
  return Padding(
    padding: padding,
    child: CustomButton(AppString.text_download_payslip, () {
      showCustomSnackBar(message: "Download Stared");
      Get.find<DownloadHelper>().downloadFile(
          url: baseUrl, fileInfo: "Payslip for $payslipDateRange");
    }),
  );
}

EdgeInsets get padding {
  return EdgeInsets.only(
      left: AppLayout.getWidth(0),
      right: AppLayout.getWidth(0),
      top: AppLayout.getHeight(30),
      bottom: AppLayout.getHeight(12));
}

Decoration get _openModelRadius {
  return const BoxDecoration(
      color: AppColor.cardColor,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)));
}
