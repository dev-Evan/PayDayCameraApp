import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_list_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_std_drop_dawon_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/drop_dawon_seleted_date.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/logList_widget.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_widget.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/summary_layout.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class PaySlip extends GetView<PayslipListController> {
  PaySlip({Key? key}) : super(key: key);
  final List<String> _selectedValue = [
    AppString.text_this_month,
    AppString.text_this_year,
    AppString.text_last_month,
    AppString.text_last_year
  ];

  @override
  Widget build(BuildContext context) {
    controller.getPayslipListData(value: thisYarKey());
    controller.getSummaryData();
    return controller.obx(
        (state) => Scaffold(
              body: RefreshIndicator(
                onRefresh: _refreshPage,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      summaryLayout(
                          sent: controller.summaryModel.data?.summary?.sent
                                  .toString() ??
                              "",
                          conflicted: controller
                                  .summaryModel.data?.summary?.conflicted
                                  .toString() ??
                              "",
                          total: controller.summaryModel.data?.summary?.total
                                  .toString() ??
                              ""),
                      vertical(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => dropDawnBtnCard(
                                  child: DropdownButton<String>(
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                                isDense: true,
                                isExpanded: false,
                                underline: const SizedBox.shrink(),
                                icon: const Icon(Icons.expand_more),
                                iconEnabledColor: AppColor.normalTextColor,
                                hint: dropDawHintText(),
                                value: Get.find<DropdownBtnStdController>()
                                    .dropdownValue
                                    .value,
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                                items: _selectedValue
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: calTitleRow(titleText: value),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  Get.find<DropdownBtnStdController>()
                                      .onValueChanged(newValue);
                                },
                              ))),
                          viewDate(
                              dateText: Get.find<DropdownBtnStdController>()
                                  .sltDate
                                  .toString()),
                          customSpacerHeight(height: 12),
                          (controller.payslipListModel.data?.payslips != null &&
                                  controller.payslipListModel.data!.payslips!
                                      .isNotEmpty)
                              ? ListView.builder(
                                  itemCount: controller
                                      .payslipListModel.data?.payslips?.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return logsList(
                                        titleMonth: controller.payslipListModel
                                                .data?.payslips?[index].month ??
                                            "",
                                        titleDate: controller
                                                .payslipListModel
                                                .data
                                                ?.payslips?[index]
                                                .dateInNumber ??
                                            "",
                                        basicSalary: controller
                                                .payslipListModel
                                                .data
                                                ?.payslips?[index]
                                                .netSalary ??
                                            "",
                                        statusText: controller
                                                .payslipListModel
                                                .data
                                                ?.payslips?[index]
                                                .statusName ??
                                            "",
                                        startDate: controller
                                                .payslipListModel
                                                .data
                                                ?.payslips?[index]
                                                .startDate ??
                                            "",
                                        endDate: controller.payslipListModel.data?.payslips?[index].endDate ?? "",
                                        monthly: controller.payslipListModel.data?.payslips?[index].period ?? "",
                                        indexId: controller.payslipListModel.data?.payslips?[index].id.toString() ?? "");
                                  },
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      customSpacerHeight(height: 100),
                                      svgIcon(
                                        height: 150,
                                        width: 150,
                                        url: Images.no_data_found,
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  Future<void> _refreshPage() async {
    controller.getPayslipListData(value: thisYarKey());
    controller.getSummaryData();
  }
}
