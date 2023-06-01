import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/controller/downloader_helper.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_view_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view_sub_widget.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../controller/payslip_dawonload_controller.dart';

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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profileCard(
                          imgUrl: Get.find<ProfileDataController>()
                                      .userProfile
                                      .data
                                      ?.profilePictureUrl ==
                                  null
                              ? AssetImage(Images.user)
                              : NetworkImage(Get.find<ProfileDataController>()
                                      .userProfile
                                      .data
                                      ?.profilePictureUrl ??
                                  ""),
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
                              "",
                        ),
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
                                  '${controller.payslipViewModel.data?.payslip?.createdAt ?? ""} - ${controller.payslipViewModel.data?.payslip?.endDate ?? ""}',
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
                                    subLeftText:
                                        "${controller.payslipViewModel.data?.allowances?[index].name.toString() ?? ""} ${controller.payslipViewModel.data?.allowances?[index].value.toString() ?? ""}",
                                    subRightText:
                                        "${Get.find<SettingController>().basicInfo?.data.currencySymbol.toString() ?? ""} ${controller.payslipViewModel.data?.allowances?[index].amount.toString() ?? ""}",
                                    isPercentage: controller
                                            .payslipViewModel
                                            .data
                                            ?.allowances?[index]
                                            .isPercentage
                                            .toString() ??
                                        "")
                              ],
                            );
                          },
                        ),
                        const Divider(height: 1),
                        totalRowView(
                            amount:
                                "${Get.find<SettingController>().basicInfo?.data.currencySymbol.toString() ?? ""} ${controller.payslipViewModel.data?.payslip?.totalAllowance.toString() ?? ""}"),
                        subTitleContainer(
                            leftText: AppString.text_deductions,
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
                                    subLeftText:
                                        "${controller.payslipViewModel.data?.deductions?[index].name.toString() ?? ""} ${controller.payslipViewModel.data?.deductions?[index].value.toString() ?? ""}",
                                    subRightText:
                                        "${Get.find<SettingController>().basicInfo?.data.currencySymbol.toString() ?? ""} ${controller.payslipViewModel.data?.deductions?[index].amount.toString() ?? ""}",
                                    isPercentage: controller
                                            .payslipViewModel
                                            .data
                                            ?.allowances?[index]
                                            .isPercentage
                                            .toString() ??
                                        "")
                              ],
                            );
                          },
                        ),
                        const Divider(height: 1),
                        totalRowView(
                            amount:
                                "${Get.find<SettingController>().basicInfo?.data.currencySymbol.toString() ?? ""} ${controller.payslipViewModel.data?.payslip?.totalDeduction.toString() ?? ""}"),
                        customSpacerHeight(height: 8),
                        summaryText(),
                        summaryTextCard(
                          subLeftText: AppString.text_allowances,
                          subRightText:
                              "${Get.find<SettingController>().basicInfo?.data.currencySymbol.toString() ?? ""} ${controller.payslipViewModel.data?.payslip?.totalAllowance.toString() ?? ""}",
                        ),
                        summaryTextCard(
                          subLeftText: AppString.text_deductions,
                          subRightText:
                              "${Get.find<SettingController>().basicInfo?.data.currencySymbol.toString() ?? ""} ${controller.payslipViewModel.data?.payslip?.totalDeduction.toString() ?? ""}",
                        ),
                        summaryTextCard(
                          subLeftText: AppString.text_basic_salary,
                          subRightText:
                              "${Get.find<SettingController>().basicInfo?.data.currencySymbol.toString() ?? ""} ${controller.payslipViewModel.data?.payslip?.basicSalary.toString() ?? ""}",
                        ),
                        const Divider(height: 1),
                        totalRowView(
                            amount:
                                "${Get.find<SettingController>().basicInfo?.data.currencySymbol.toString() ?? ""} ${controller.payslipViewModel.data?.payslip?.netSalary.toString() ?? ""}"),
                      ],
                    ),
                  ),
                  _payslipDownloadBtn(
                    payslipDateRange:
                        '${controller.payslipViewModel.data?.payslip?.createdAt ?? ""} - ${controller.payslipViewModel.data?.payslip?.endDate ?? ""}',
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
  var id = box.read(AppString.STORE_PAYSLIP_LIST_ID);
  var token = box.read(AppString.ACCESS_TOKEN);
  var url = AppString.BASE_URL +"/payroll/payslip/pdf/1?download=true";
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(20),
        right: AppLayout.getWidth(20),
        top: AppLayout.getHeight(8),
        bottom: AppLayout.getHeight(12)),
    child: CustomButton(
        AppString.text_download_payslip,
        () =>
            Get.find<DownloadHelper>().downloadFile(url:url.toString() )

            // Get.find<PayslipDownlaodController>()
            // .payslipDownload(id: id, token: token, date: payslipDateRange)


    ),
  );
}
