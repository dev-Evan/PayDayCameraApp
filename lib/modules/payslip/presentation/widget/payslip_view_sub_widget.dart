import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/logList_widget.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../setting/presentation/controller/setting_controller.dart';

Widget profileCard({required nameText, required userEmail, required payslipId}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        nameText,
        style: AppStyle.mid_large_text.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeDefault),
      ),
      customSpacerHeight(height: 4),
      Text(
        GetStorage().read(AppString.STORE_CURRENT_EMAIL).toString(),
        style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
      ),
      customSpacerHeight(height: 4),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${AppString.text_payslip_id} : ",
            style:
                AppStyle.small_text.copyWith(color: AppColor.normalTextColor),
          ),
          Text(
            "$payslipId",
            style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
          ),
        ],
      ),
    ],
  );
}

Widget payslipVDateCard({required titleText, required dateText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customSpacerHeight(height: 12),
      Text(
        titleText,
        style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          letterSpacing: 0.4,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        dateText,
        style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500,
        ),
      ),
      customSpacerHeight(height: 16),
    ],
  );
}

Widget basicSalaryText() {
  return Text(AppString.text_beneficiary,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSizeDefault + 2));
}

Widget subTitleContainer({required leftText, required rightText}) {
  return Container(
    decoration: AppStyle.ContainerStyle.copyWith(
        color: AppColor.disableColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault - 6)),
    child: Padding(
      padding: _padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeDefault,
                fontWeight: FontWeight.w500),
          ),
          Text(
            rightText,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeDefault,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}

EdgeInsets get _padding {
  return EdgeInsets.only(
      top: AppLayout.getHeight(8),
      bottom: AppLayout.getHeight(8),
      left: AppLayout.getWidth(6),
      right: AppLayout.getWidth(6));
}

Widget subTextCard({required subLeftText, required subRightText, isPercentage, required value}) {
  return Padding(
    padding: _subTextLayoutPadding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "$subLeftText",
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor.withOpacity(0.9),
                  fontSize: Dimensions.fontSizeDefault,
                  fontWeight: FontWeight.w500),
            ),
            customSpacerWidth(width: 5),
            Text(("( $value${isPercentage.toString() == "1" ? "%" : ""} )")),
          ],
        ),
        Row(
          children: [
            currencySymbolSmall,
            Text(
              subRightText,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor.withOpacity(0.9),
                  fontSize: Dimensions.fontSizeDefault,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    ),
  );
}

EdgeInsets get _subTextLayoutPadding {
  return EdgeInsets.only(
      bottom: AppLayout.getHeight(8),
      left: AppLayout.getWidth(2),
      right: AppLayout.getWidth(2),
      top: AppLayout.getHeight(8));
}

Container get currencySymbolSmall {
  return Container(
    margin: EdgeInsets.only(right: AppLayout.getHeight(4)),
    child: Text(
        Get.find<SettingController>().basicInfo?.data.currencySymbol ?? "",
        style: currencySymbolSmallStyle),
  );
}

TextStyle get currencySymbolSmallStyle {
  return TextStyle(
      color: AppColor.normalTextColor.withOpacity(0.9),
      fontSize: Dimensions.fontSizeDefault + 1,
      fontWeight: FontWeight.w400);
}

Widget summaryTextCard({required subLeftText, required subRightText}) {
  return Padding(
    padding: EdgeInsets.only(
        bottom: AppLayout.getHeight(8),
        left: AppLayout.getWidth(0),
        right: AppLayout.getWidth(0),
        top: AppLayout.getHeight(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _subTextLeft(subLeftText: subLeftText),
        _subTextRight(subRightText: subRightText)
      ],
    ),
  );
}

Widget _subTextLeft({required subLeftText}) {
  return Text(
    subLeftText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor.withOpacity(0.9),
        fontSize: Dimensions.fontSizeDefault,
        fontWeight: FontWeight.w500),
  );
}

Widget _subTextRight({required subRightText}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      currencySymbolSmall,
      Text(
        subRightText,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.normalTextColor.withOpacity(0.9),
            fontSize: Dimensions.fontSizeDefault,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget totalRowView({required amount, required text}) {
  return Padding(
    padding: EdgeInsets.only(
        top: AppLayout.getHeight(6), bottom: AppLayout.getHeight(6)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault + 2,
              fontWeight: FontWeight.w700),
        ),
        Row(
          children: [
            currencySymbol,
            Text(
              amount,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.fontSizeDefault + 2,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget summaryText() {
  return Padding(
    padding: EdgeInsets.only(
        top: AppLayout.getHeight(8), bottom: AppLayout.getHeight(8)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString.text_total_summary,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor,
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
