import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/salary_overview_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/dotted_view.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/custom_spacer.dart';
import '../../../../common/widget/no_data_found.dart';
import '../../../payslip/presentation/widget/logList_widget.dart';
import '../widget/more_widget.dart';

class SalaryOverView extends GetView<SalaryOverviewController> {
  const SalaryOverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<SettingController>().getCurrencyData();
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
                        customMoreAppbar(titleText: AppString.text_salary_overview),
                        controller.salaryOverView.data != null &&
                                controller.salaryOverView.data!.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: AppLayout.getWidth(20),
                                    right: AppLayout.getWidth(20),
                                    top: AppLayout.getHeight(15),
                                    bottom: AppLayout.getHeight(20)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      basicSalaryText,
                                      controller.salaryOverView.data!.first.basicSalary == true?
                                      Text("${Get.find<SettingController>().basicInfo?.data.currencySymbol ?? ""} ${controller.salaryOverView.data!.first.basicSalary == true ? controller.salaryOverView.data?.first.amount.toString() ?? "" : controller.salaryOverView.data!.last.basicSalary == true ? controller.salaryOverView.data?.last.amount.toString() ?? "" : ""}", style: basicSalaryStyle):controller.salaryOverView.data!.last.basicSalary == true?                                      Text("${Get.find<SettingController>().basicInfo?.data.currencySymbol ?? ""} ${controller.salaryOverView.data!.first.basicSalary == true ? controller.salaryOverView.data?.first.amount.toString() ?? "" : controller.salaryOverView.data!.last.basicSalary == true ? controller.salaryOverView.data?.last.amount.toString() ?? "" : ""}", style: basicSalaryStyle):Container(),
                                      customSpacerHeight(height: 30),

                                      _jobHisTitleView()
                                    ],
                                  ),
                                ),
                              )
                            :noDataFound(),
                      ],
                    ),
                  ),
            ),
            onLoading: const LoadingIndicator()));
  }

  Future<void> _refreshPage() async {
    controller.getSalaryOverview();
  }
}


Widget _jobHisTitleView() {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(8), bottom: AppLayout.getHeight(5)),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          Get.find<SalaryOverviewController>().salaryOverView.data?.length,
      itemBuilder: (context, index) {
        Color itemColor = AppColor.disableColor; // Default color
        if (index == 0) itemColor = AppColor.primaryColor;

        return Stack(
          alignment: Alignment.center,
          children: [
            dottedSalaryView(
                height: (Get.find<SalaryOverviewController>()
                                .salaryOverView
                                .data?[index]
                                .message !=
                            null &&
                        Get.find<SalaryOverviewController>()
                            .salaryOverView
                            .data![index]
                            .message!
                            .isNotEmpty)
                    ? 200
                    : 90),
            Positioned(
                top: 0,
                left: AppLayout.getWidth(23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _salaryCardTitleView(
                            titleText: Get.find<SalaryOverviewController>()
                                    .salaryOverView
                                    .data?[index]
                                    .level ??
                                "",
                            dotIconColor: (Get.find<SalaryOverviewController>()
                                            .salaryOverView
                                            .data
                                            ?.first
                                            .level !=
                                        null &&
                                    Get.find<SalaryOverviewController>()
                                        .salaryOverView
                                        .data!
                                        .first
                                        .level!
                                        .isNotEmpty)
                                ? AppColor.primaryColor
                                : AppColor.disableColor,
                            firstIndex: itemColor),

                        customSpacerHeight(height: 6),
                        _salaryRow(
                            salaryText: Get.find<SalaryOverviewController>()
                                    .salaryOverView
                                    .data?[index]
                                    .amount
                                    .toString() ??
                                ""),

                        (Get.find<SalaryOverviewController>().salaryOverView.data?[index].message != null &&
                                Get.find<SalaryOverviewController>()
                                    .salaryOverView
                                    .data![index]
                                    .message!
                                    .isNotEmpty)
                            ? _salaryCardView(
                                effectiveDate: Get.find<SalaryOverviewController>()
                                        .salaryOverView
                                        .data?[index]
                                        .effectiveDate
                                        .toString() ??
                                    "",
                                drcText: Get.find<SalaryOverviewController>()
                                        .salaryOverView
                                        .data?[index]
                                        .message
                                        .toString() ??
                                    "",
                                createdDate: Get.find<SalaryOverviewController>()
                                        .salaryOverView
                                        .data?[index]
                                        .createdDate
                                        .toString() ??
                                    "",
                                currentSalary:
                                    Get.find<SalaryOverviewController>()
                                            .salaryOverView
                                            .data?[index]
                                            .currentSalary
                                            .toString() ??
                                        "",
                                previousSalary:
                                    Get.find<SalaryOverviewController>().salaryOverView.data?[index].previousSalary.toString() ?? "",
                                addedBy: Get.find<SalaryOverviewController>().salaryOverView.data?[index].addedBy.toString() ?? "",
                                symbol: Get.find<SettingController>().basicInfo?.data.currencySymbol ?? "")
                            : Container(),
                      ],
                    ),
                  ],
                )),
          ],
        );
      },
    ),
  );
}

Widget _salaryRow({salaryText}) {
  return Padding(
    padding: EdgeInsets.only(left: AppLayout.getWidth(16)),
    child: Row(
      children: [
        cardShape(icon: Images.credit_card),
        customSpacerWidth(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                currencySymbol,
                Text(
                  salaryText,
                  style: AppStyle.mid_large_text.copyWith(
                      color: AppColor.normalTextColor,
                      fontSize: Dimensions.fontSizeDefault + 2,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _salaryCardTitleView(
    {titleText,
    Color dotIconColor = AppColor.disableColor,
    required firstIndex}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.circle,
        size: 10,
        color: firstIndex,
      ),
      Padding(
        padding: EdgeInsets.only(left: AppLayout.getWidth(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_titleText(titleTextS: titleText)],
        ),
      ),
    ],
  );
}

Widget _titleText({titleTextS}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titleTextS,
        style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontSize: Dimensions.fontSizeExtraDefault,
        ),
      ),
    ],
  );
}

Widget _salaryCardView(
    {required effectiveDate,
    required drcText,
    required previousSalary,
    required createdDate,
    required currentSalary,
    required addedBy,
    required symbol}) {
  return Container(
    margin: const EdgeInsets.only(left: 20, top: 4),
    width: AppLayout.getWidth(280),
    decoration: AppStyle.ContainerStyle.copyWith(
        color: AppColor.primaryColor.withOpacity(0.1),
        borderRadius: borderRadius),
    child: Container(
      margin: EdgeInsets.only(
          left: AppLayout.getWidth(12),
          right: AppLayout.getWidth(12),
          top: AppLayout.getHeight(12),
          bottom: AppLayout.getHeight(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${AppString.text_will_be_effective_form} $effectiveDate ",
            style: cardTitleStyle,
          ),
          customSpacerHeight(height: 8),
          textSpan(
              drcText: drcText,
              addedBy: addedBy,
              previousSalary: previousSalary,
              createdDate: createdDate,
              currentSalary: currentSalary,
              symbol: symbol)
        ],
      ),
    ),
  );
}

RichText textSpan(
    {required drcText,
    required previousSalary,
    required currentSalary,
    required createdDate,
    required addedBy,
    required symbol}) {
  return RichText(
    overflow: TextOverflow.clip,
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(text: "$addedBy", style: cardDynamicTextStyle),
        TextSpan(text: " $drcText", style: cardSubTextStyle),
        TextSpan(text: "$symbol $previousSalary", style: cardDynamicTextStyle),
        TextSpan(text: " ${AppString.text_to} ", style: cardSubTextStyle),
        TextSpan(text: "$symbol $currentSalary", style: cardDynamicTextStyle),
        TextSpan(
            text: " ${AppString.text_on} $createdDate",
            style: cardSubTextStyle),
      ],
    ),
  );
}

TextStyle get cardTitleStyle {
  return AppStyle.small_text_grey.copyWith(
      color: AppColor.successColor.withOpacity(0.7),
      letterSpacing: 1,
      fontWeight: FontWeight.w500);
}

TextStyle get cardSubTextStyle {
  return AppStyle.small_text_grey
      .copyWith(color: AppColor.hintColor, fontWeight: FontWeight.w100);
}

TextStyle get cardDynamicTextStyle {
  return TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.w500,    fontSize: AppLayout.getWidth(12));
}

BorderRadius get borderRadius {
  return BorderRadius.circular(Dimensions.radiusDefault - 1);
}

TextStyle get currencyStyle {
  return TextStyle(
      color: AppColor.normalTextColor,
      fontSize: Dimensions.fontSizeDefault + 2,
      fontWeight: FontWeight.w400);
}

TextStyle get basicSalaryStyle {
  return TextStyle(color: AppColor.normalTextColor.withOpacity(0.5),fontWeight: FontWeight.w500,    fontSize: Dimensions.fontSizeMid - 4);
}

Text get basicSalaryText {
  return Text(
    AppString.text_basic_salary,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor,
        fontSize: Dimensions.fontSizeMid,
        fontWeight: FontWeight.w700),
  );
}
