import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_std_drop_dawon_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/drop_dawon_seleted_date.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/logList_widget.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_widget.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/summary_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/no_data_found.dart';
import '../../../setting/presentation/controller/setting_controller.dart';

class PaySlip extends GetView<PayslipController> {
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
    Get.find<SettingController>().getCurrencyData();
    return controller.obx(
        (state) => Scaffold(
              body: RefreshIndicator(
                onRefresh: _refreshPage,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _summaryLayout(context),
                      _payslipIndexLayout(context),
                    ],
                  ),
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  _summaryLayout(context) {
    return summaryLayout(
        sentDynamic:
            controller.summaryModel.data?.summary?.sent.toString() ?? "",
        conflictedDynamic:
            controller.summaryModel.data?.summary?.conflicted.toString() ?? "",
        totalDynamic:
            controller.summaryModel.data?.summary?.total.toString() ?? "",
        total: AppString.text_total,
        sent: AppString.text_sent,
        conflicted: AppString.text_conflicted,
        topTextValue: AppString.text_total,
        context: context);
  }

  _payslipIndexLayout(context) {
    return vertical(
        layoutHeight: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => _selectedIndividualIndex(context)),
            _selectedDateForPayslip(),
            customSpacerHeight(height: 12),
            _payslipListView(context),
            customSpacerHeight(height: 12),
          ],
        ));
  }

  _selectedIndividualIndex(context) {
    return dropDawnBtnCard(
        child: DropdownButton<String>(
      style: const TextStyle(fontWeight: FontWeight.w500),
      isDense: true,
      isExpanded: false,
      underline: const SizedBox.shrink(),
      icon: const Icon(Icons.expand_more),
      iconEnabledColor: AppColor.normalTextColor,
      hint: dropDawHintText(),
      value: Get.find<DropdownBtnStdController>().dropdownValue.value,
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      items: _selectedValue.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: calTitleRow(titleText: value),
        );
      }).toList(),
      onChanged: (newValue) {
        Get.find<DropdownBtnStdController>().onValueChanged(newValue);
      },
    ));
  }

  _payslipListView(context) {
    return (controller.payslipListModel.data?.payslips != null &&
            controller.payslipListModel.data!.payslips!.isNotEmpty)
        ? ListView.builder(
            itemCount: controller.payslipListModel.data?.payslips?.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return logsList(
                  titleMonth:
                      controller.payslipListModel.data?.payslips?[index].month ??
                          "",
                  titleDate: controller.payslipListModel.data?.payslips?[index]
                          .dateInNumber ??
                      "",
                  basicSalary: controller
                          .payslipListModel.data?.payslips?[index].netSalary ??
                      "",
                  statusText: controller
                          .payslipListModel.data?.payslips?[index].statusName ??
                      "",
                  startDate: controller
                          .payslipListModel.data?.payslips?[index].startDate ??
                      "",
                  conflicted: controller
                          .payslipListModel.data?.payslips?[index].conflicted ??
                      "",
                  endDate:
                      controller.payslipListModel.data?.payslips?[index].endDate ?? "",
                  monthly: controller.payslipListModel.data?.payslips?[index].period ?? "",
                  indexId: controller.payslipListModel.data?.payslips?[index].id.toString() ?? "");
            },
          )
        : _emptyDataLayout(context);
  }

  _emptyDataLayout(context) {
    return noDataFound(
        svgWidth: 130,
        svgHeight: 130,
        height: MediaQuery.of(context).size.height / 12);
  }

  _selectedDateForPayslip() {
    return viewDate(
        dateText: Get.find<DropdownBtnStdController>().sltDate.toString());
  }

  Future<void> _refreshPage() async {
    controller.getPayslipListData(value: thisYarKey());
    controller.getSummaryData();
    Get.find<SettingController>().getCurrencyData();
  }
}
