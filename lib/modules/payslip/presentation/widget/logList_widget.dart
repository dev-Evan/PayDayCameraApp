import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/arrow_style.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget logsList(
    {required titleDate,
    required titleMonth,
    required basicSalary,
    required statusText,
    required startDate,
    required endDate,
    required monthly,
    required indexId}) {
  final box = GetStorage();

  return Padding(
    padding: EdgeInsets.only(
      left: AppLayout.getWidth(12),
      right: AppLayout.getWidth(12),
      bottom: AppLayout.getHeight(12),
      top: AppLayout.getHeight(12),
    ),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            box.write(AppString.STORE_PAYSLIP_LSIT_ID, indexId);
            customButtomSheet(
                context: Get.context,
                height: 0.9,
                child: PaySlipView(indexVal: indexId));
          },
          child: Card(
            elevation: 0,
            child: _logListRow(
                titleDate: titleDate,
                titleMonth: titleMonth,
                basicSalary: basicSalary,
                statusText: statusText,
                endDate: endDate,
                startDate: startDate,
                monthly: monthly),
          ),
        ),
        _divider(context: Get.context),
      ],
    ),
  );
}

Widget _logListRow(
    {required titleDate,
    required titleMonth,
    required basicSalary,
    required statusText,
    required startDate,
    required endDate,
    required monthly}) {
  final _box = GetStorage();
  var currency = _box.read(AppString.STORE_CURRENCY) ?? "\$";
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _dateTitle(dateText: titleDate, monthText: titleMonth),
      CustomDiveider(25, 0.5),
      _cardMidText(
          amountText: currency + " " + basicSalary.toString(),
          startDate: startDate,
          endDate: endDate,
          monthly: monthly,
          statusText: statusText.toString()),
      avatarArrowIcon(),
    ],
  );
}

Widget _divider({context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: CustomDiveider(
        AppLayout.getHeight(0.6), MediaQuery.of(context).size.width),
  );
}

Widget _dateTitle({dateText, monthText}) {
  return Column(
    children: [
      Text(
        dateText,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeExtraLarge,
            fontWeight: FontWeight.w900),
      ),
      Text(
        monthText,
        style: AppStyle.small_text.copyWith(
            color: AppColor.hintColor, fontSize: Dimensions.fontSizeSmall),
      ),
    ],
  );
}

Widget _cardMidText(
    {required amountText,
    required startDate,
    required endDate,
    required statusText,
    required monthly}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        amountText.toString(),
        style: AppStyle.mid_large_text.copyWith(
          color: AppColor.secondaryColor,
          fontSize: Dimensions.fontSizeDefault + 2,
        ),
      ),
      customSpacerHeight(height: 8),
      _midTextRow(startDate: startDate, endDate: endDate, monthly: monthly),
      customSpacerHeight(height: 6),
      CustomStatusButton(
        bgColor: AppColor.successColor.withOpacity(0.2),
        text: statusText,
        textColor: AppColor.successColor,
      )
    ],
  );
}

Widget _midTextRow({required startDate, required endDate, required monthly}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        startDate,
        style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
      ),
      customSpacerWidth(width: 8),
      Text(
        "-",
        style: AppStyle.small_text_black.copyWith(color: AppColor.hintColor),
      ),
      customSpacerWidth(width: 8),
      Row(
        children: [
          Text(
            endDate,
            style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
          ),
          customSpacerWidth(width: 8),
          Icon(
            Icons.circle,
            size: Dimensions.fontSizeSmall - 5,
            color: AppColor.hintColor,
          ),
          customSpacerWidth(width: 8),
          Text(
            monthly,
            style: AppStyle.small_text.copyWith(color: AppColor.hintColor),
          ),
        ],
      ),
    ],
  );
}
