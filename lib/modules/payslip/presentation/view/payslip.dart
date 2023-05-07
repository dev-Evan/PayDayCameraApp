import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_list_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_std_drop_dawon_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/logList_widget.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/summary_layout.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class PaySlip extends GetView<PayslipListController> {
  PaySlip({Key? key}) : super(key: key);

  final SettingController settingController = Get.put(SettingController());
  final DropdownBtnStdController dropdownBtnStdController =
      Get.put(DropdownBtnStdController());

  final List<String> _selectedValue = [
    AppString.text_this_month,
    AppString.text_this_year,
    AppString.text_last_month,
    AppString.text_total
  ];

  @override
  Widget build(BuildContext context) {
    controller.getPayslipListData(value: "thisYear");
    controller.getSummaryData();

    return controller.obx(
        (state) => Scaffold(
              body: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    summaryLayout(
                        paid: controller.summaryModel.data?.summary?.paid
                                .toString() ??
                            "",
                        unpaid: controller.summaryModel.data?.summary?.unpaid
                                .toString() ??
                            "",
                        total: controller.summaryModel.data?.summary?.total
                                .toString() ??
                            ""),
                    _vertical(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => _dropDawnBtnCard(
                                child: DropdownButton<String>(
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                              isDense: true,
                              isExpanded: false,
                              underline: const SizedBox.shrink(),
                              icon: const Icon(Icons.expand_more),
                              iconEnabledColor: AppColor.normalTextColor,
                              hint: _dropDawHintText(),
                              value:
                                  dropdownBtnStdController.dropdownValue.value,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusDefault),
                              items: _selectedValue
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: _calTitleRow(titleText: value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                dropdownBtnStdController
                                    .onValueChanged(newValue);
                              },
                            ))),
                        _viewDate(
                            dateText:
                                dropdownBtnStdController.sltDate.toString()),
                        controller.payslipListModel.data?.payslips != null
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
                                              .basicSalary ??
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
                                      monthly: controller.payslipListModel.data?.payslips?[index].period ?? "");
                                },
                              )
                            : Center(child: Text(AppString.text_no_data_found))
                      ],
                    ))
                  ],
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }
}

Widget _dropDawHintText() {
  return Text(
    AppString.text_this_month,
    style: AppStyle.normal_text.copyWith(color: AppColor.normalTextColor),
  );
}

Widget _viewDate({required dateText}) {
  return Padding(
    padding: EdgeInsets.only(left: AppLayout.getWidth(18)),
    child: Text(
      dateText,
      style: AppStyle.normal_text_grey,
    ),
  );
}

Widget _vertical({required child}) {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(8),
        right: AppLayout.getWidth(8),
        top: AppLayout.getHeight(8)),
    child: child,
  );
}

Widget _dropDawnBtnCard({required child}) {
  return Padding(
    padding: EdgeInsets.only(top: AppLayout.getHeight(8)),
    child: Card(
      color: AppColor.cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          side: const BorderSide(width: 0.0, color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    ),
  );
}

Widget _calTitleRow({required titleText}) {
  return Row(
    children: [
      Text(
        titleText,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.secondaryColor, fontWeight: FontWeight.w700),
      ),
    ],
  );
}
