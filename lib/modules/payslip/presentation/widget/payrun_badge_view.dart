import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view_sub_widget.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../utils/utils.dart';
import '../controller/payslip_controller.dart';

class PayRunBadgeView extends GetView<PayslipController> {
  const PayRunBadgeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: controller.payrunBadgeModel.data != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _payRunDetails(),
                _payRunDetailsLayout(),
                controller.allowance.isNotEmpty
                    ? _allowanceIndexLayout()
                    : _defaultAllowanceIndexLayout(),
                controller.deduction.isNotEmpty
                    ? _deductionIndexLayout()
                    : _defaultDeductionIndexLayout()
              ],
            )
          : _emptyDataLayout(),
    );
  }

  _payRunDetails() {
    return _iconBoxInfo(
        icon: Images.file, titleText: AppString.text_payrun_details);
  }

  _payRunDetailsLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _detailsLayout(
            leftText: AppString.text_period,
            dynamicText: controller.payrunBadgeModel.data?.payrunSetting != null
                ? controller.payrunBadgeModel.data?.payrunSetting?.payrunPeriod
                        .toString() ??
                    ""
                : controller.payrunBadgeModel.data?.defaultPayrun?.setting
                        ?.payrunPeriod
                        .toString() ??
                    ""),
        _detailsLayout(
            leftText: AppString.text_consider_type,
            dynamicText: controller.payrunBadgeModel.data?.payrunSetting != null
                ? controller.payrunBadgeModel.data?.payrunSetting?.considerType
                        .toString() ??
                    ""
                : controller.payrunBadgeModel.data?.defaultPayrun?.setting
                        ?.considerType
                        .toString() ??
                    ""),
        _detailsLayout(
            leftText: AppString.text_overtime,
            dynamicText: controller.payrunBadgeModel.data?.payrunSetting != null
                ? controller.payrunBadgeModel.data?.payrunSetting
                            ?.considerOvertime
                            .toString() ==
                        "0"
                    ? AppString.text_excluded
                    : AppString.text_included
                : controller.payrunBadgeModel.data?.defaultPayrun?.setting
                            ?.considerOvertime
                            .toString() ==
                        "0"
                    ? AppString.text_excluded
                    : AppString.text_included),
      ],
    );
  }

  _allowanceIndexLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        controller.allowance.isNotEmpty
            ? _iconBoxInfo(
                icon: Images.allowance, titleText: AppString.text_allowances)
            : Container(),
        controller.allowance.isNotEmpty ? _allowanceIndexView() : Container(),
      ],
    );
  }

  _defaultAllowanceIndexLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        controller.defaultAllowance.isNotEmpty
            ? _iconBoxInfo(
                icon: Images.allowance, titleText: AppString.text_allowances)
            : Container(),
        controller.defaultAllowance.isNotEmpty
            ? _defaultAllowanceIndexView()
            : Container(),
      ],
    );
  }

  _deductionIndexLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        controller.deduction.isNotEmpty
            ? _iconBoxInfo(
                icon: Images.deduction, titleText: AppString.text_deductions)
            : Container(),
        controller.deduction.isNotEmpty ? _deductionIndexView() : Container()
      ],
    );
  }

  _defaultDeductionIndexLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        controller.defaultDeduction.isNotEmpty
            ? _iconBoxInfo(
                icon: Images.deduction, titleText: AppString.text_deductions)
            : Container(),
        controller.defaultDeduction.isNotEmpty
            ? _defaultDeductionIndexView()
            : Container(),
      ],
    );
  }

  _emptyDataLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customSpacerHeight(height: 158),
          svgIcon(
            height: 150,
            width: 150,
            url: Images.no_data_found,
          ),
        ],
      ),
    );
  }

  _allowanceIndexView() {
    return ListView.builder(
      itemCount: controller.allowance.length,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: columnEdgeInsets,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _beneficiaryIndexName(index),
                      _beneficiaryIndexAmount(index),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _defaultAllowanceIndexView() {
    return ListView.builder(
      itemCount: controller.defaultAllowance.length,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: columnEdgeInsets,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _defaultBeneficiaryIndexName(index),
                      _defaultBeneficiaryIndexAmount(index),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _beneficiaryIndexName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTextLeft(
            subTitleText:
                controller.allowance[index].beneficiary?.name.toString() ?? ""),
      ],
    );
  }

  _beneficiaryIndexAmount(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTextRightBtn(
            subTextRight: controller.allowance[index].amount.toString(),
            isPercentage: controller.allowance[index].isPercentage?.toInt()),
      ],
    );
  }

  _defaultBeneficiaryIndexName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTextLeft(
            subTitleText: controller.defaultAllowance[index].beneficiary?.name
                    .toString() ??
                ""),
      ],
    );
  }

  _defaultBeneficiaryIndexAmount(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTextRightBtn(
            subTextRight: controller.defaultAllowance[index].amount.toString(),
            isPercentage:
                controller.defaultAllowance[index].isPercentage?.toInt()),
      ],
    );
  }

  _deductionIndexView() {
    return ListView.builder(
      itemCount: controller.deduction.length,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: columnEdgeInsets,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _deductionBeneficiaryIndexName(index),
                      _deductionBeneficiaryIndexAmount(index),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _deductionBeneficiaryIndexName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTextLeft(
            subTitleText:
                controller.deduction[index].beneficiary?.name.toString() ?? ""),
      ],
    );
  }

  _deductionBeneficiaryIndexAmount(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTextRightBtn(
            subTextRight: controller.deduction[index].amount?.toString() ?? "",
            isPercentage: controller.deduction[index].isPercentage?.toInt()),
      ],
    );
  }

  _defaultDeductionIndexView() {
    return ListView.builder(
      itemCount: controller.defaultDeduction.length,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: columnEdgeInsets,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _defaultDeductionBeneficiaryIndexName(index),
                      _defaultDeductionBeneficiaryIndexAmount(index),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _defaultDeductionBeneficiaryIndexName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTextLeft(
            subTitleText: controller.defaultDeduction[index].beneficiary?.name
                    .toString() ??
                ""),
      ],
    );
  }

  _defaultDeductionBeneficiaryIndexAmount(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _subTextRightBtn(
            subTextRight:
                controller.defaultDeduction[index].amount?.toString() ?? "",
            isPercentage:
                controller.defaultDeduction[index].isPercentage?.toInt()),
      ],
    );
  }
}

Widget _iconBoxInfo({icon, titleText}) {
  return Row(
    children: [
      Card(
          elevation: 0,
          color: AppColor.primaryColor.withOpacity(0.1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SvgPicture.asset(
                icon.toString(),
                width: AppLayout.getWidth(20),
                height: AppLayout.getWidth(20),
                // ignore: deprecated_member_use
                color: AppColor.primaryColor.withOpacity(0.8),
              ),
            ),
          )),
      customSpacerWidth(width: 12),
      Text(
        titleText,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeDefault + 1,
            fontWeight: FontWeight.w700),
      )
    ],
  );
}

Widget _subTextRight({required subTextRight}) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
    child: Text(
      subTextRight.replaceAll("_", " "),
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    ),
  );
}

Widget _subTextRightBtn({required subTextRight, required isPercentage}) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
    child: Row(
      children: [
        Text(
          isPercentage.toString() == "0"
              ? Get.find<SettingController>()
                      .basicInfo
                      ?.data
                      .currencySymbol
                      .toString() ??
                  ""
              : "",
          style: currencySymbolSmallStyle,
        ),
        customSpacerWidth(width: 4),
        Text(
          subTextRight,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w500),
        ),
        customSpacerWidth(width: 4),
        Text(isPercentage.toString() == "1" ? "%" : "",
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.normalTextColor,
                fontSize: Dimensions.fontSizeDefault,
                fontWeight: FontWeight.w500)),
      ],
    ),
  );
}

Widget _subTextLeft({required subTitleText}) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
    child: Text(
      subTitleText,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    ),
  );
}

Widget _detailsLayout({required leftText, required dynamicText}) {
  return Container(
    margin: edgeInsets,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _subTextLeft(subTitleText: leftText),
        _subTextRight(subTextRight: capitalize(dynamicText)),
      ],
    ),
  );
}

EdgeInsets get edgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(56), top: AppLayout.getHeight(8));
}

EdgeInsets get columnEdgeInsets {
  return const EdgeInsets.only(left: 56.0, top: 8);
}
