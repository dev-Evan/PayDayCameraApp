import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/no_data_found.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view_sub_widget.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/controller/downloader_helper.dart';
import '../controller/payslip_view_controller.dart';

class PaySlipView extends GetView<PayslipViewController> {
  final indexVal;
  PaySlipView({this.indexVal});

  @override
  Widget build(BuildContext context) {
    controller.getPayslipViewData();
    final _box = GetStorage();
    return controller.obx(
        (state) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bottomSheetAppbar(
                      appbarTitle: AppString.text_payslip, context: context),
                  controller.payslipViewModel.data !=null?



                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profileCard(
                            nameText: Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.fullName
                                    .toString() ??
                                _box.read(AppString.USER_NAME),
                            userEmail: Get.find<ProfileDataController>()
                                    .userProfile
                                    .data
                                    ?.email
                                    .toString() ??
                                GetStorage()
                                    .read(AppString.STORE_CURRENT_EMAIL)
                                    .toString(),
                            payslipId: controller
                                    .payslipViewModel.data?.payslip?.payslipId
                                    .toString() ??
                                ""),
                        customSpacerHeight(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            payslipVDateCard(
                              titleText: AppString.text_create_at,
                              dateText: controller
                                      .payslipViewModel.data?.payslip?.createdAt
                                      .toString() ??
                                  "",
                            ),
                            payslipVDateCard(
                              titleText: AppString.text_payslip_for,
                              dateText:
                                  '${controller.payslipViewModel.data?.payslip?.startDate ?? ""} - ${controller.payslipViewModel.data?.payslip?.endDate ?? ""}',
                            ),
                          ],
                        ),
                        basicSalaryText(),
                        customSpacerHeight(height: 12),
                        subTitleContainer(
                            leftText: AppString.text_allowances,
                            rightText: AppString.text_total),
                        ListView.builder(
                          itemCount: controller
                              .payslipViewModel.data?.allowances?.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                subTextCard(
                                  subLeftText: controller.payslipViewModel.data
                                          ?.allowances?[index].name
                                          .toString() ??
                                      "",
                                  subRightText: controller.payslipViewModel.data
                                          ?.allowances?[index].amount
                                          .toString() ??
                                      "",
                                  isPercentage: controller.payslipViewModel.data
                                          ?.allowances?[index].isPercentage
                                          .toString() ??
                                      "",
                                  value: controller.payslipViewModel.data
                                          ?.allowances?[index].value
                                          .toString() ??
                                      "",
                                )
                              ],
                            );
                          },
                        ),
                        const Divider(height: 1),
                        totalRowView(
                            text:
                                "${AppString.text_total} ${AppString.text_allowance}",
                            amount:
                                " ${controller.payslipViewModel.data?.payslip?.totalAllowance.toString() ?? ""}"),
                        subTitleContainer(
                            leftText: AppString.text_deductions,
                            rightText: AppString.text_total),
                        ListView.builder(
                          itemCount: controller
                              .payslipViewModel.data?.deductions?.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                subTextCard(
                                  subLeftText: controller.payslipViewModel.data
                                          ?.deductions?[index].name
                                          .toString() ??
                                      "",
                                  subRightText: controller.payslipViewModel.data
                                          ?.deductions?[index].amount
                                          .toString() ??
                                      "",
                                  isPercentage: controller.payslipViewModel.data
                                          ?.deductions?[index].isPercentage
                                          .toString() ??
                                      "",
                                  value: controller.payslipViewModel.data
                                          ?.deductions?[index].value
                                          .toString() ??
                                      "",
                                )
                              ],
                            );
                          },
                        ),
                        const Divider(height: 1),
                        totalRowView(
                            text:
                                "${AppString.text_total} ${AppString.text_deductions}",
                            amount:
                                " ${controller.payslipViewModel.data?.payslip?.totalDeduction.toString() ?? ""}"),
                        customSpacerHeight(height: 8),
                        summaryText(),
                        summaryTextCard(
                          subLeftText: AppString.text_basic_salary,
                          subRightText: controller
                                  .payslipViewModel.data?.payslip?.basicSalary
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
                        totalRowView(
                            amount:
                                " ${controller.payslipViewModel.data?.payslip?.netSalary.toString() ?? ""}",
                            text: AppString.text_net_payable),
                      ],
                    ),
                  ):noDataFound(),
                  _payslipDownloadBtn(
                    payslipDateRange:
                        '${controller.payslipViewModel.data?.payslip?.startDate ?? ""} - ${controller.payslipViewModel.data?.payslip?.endDate ?? ""}',
                  ),
                  customSpacerHeight(height: 26)
                ],
              ),
            ),
        onLoading: const LoadingIndicator());
  }
}

Widget _payslipDownloadBtn({required payslipDateRange}) {
  final box = GetStorage();
  var ID = box.read(AppString.STORE_PAYSLIP_LIST_ID);
  var BASEURL = "${Api.BASE_URL}${Api.PAYSLIP_DOWNLOAD}$ID?download=true";
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(20),
        right: AppLayout.getWidth(20),
        top: AppLayout.getHeight(8),
        bottom: AppLayout.getHeight(12)),
    child: CustomButton(
      AppString.text_download_payslip,
      () => Get.find<DownloadHelper>()
          .downloadFile(url: BASEURL, fileInfo: "Payslip for $payslipDateRange"),
    ),
  );
}
