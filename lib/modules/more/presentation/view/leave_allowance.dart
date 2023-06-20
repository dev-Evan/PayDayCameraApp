import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/more_widget.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/dimensions.dart';

class LeaveAllowanceScreen extends StatelessWidget {
  const LeaveAllowanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _subAppbar(),
            Container(
                margin: edgeInsets, child: _titleText(text: AppString.text_paid)),
            ListView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _cardBox(context: context);
                }),
            Container(
                margin: edgeInsets, child: _titleText(text: AppString.text_unpaid)),
            ListView.builder(
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _cardBox(context: context);
                }),
          ],
        ),
      ),
    );
  }
}

Widget _cardBox({required context}) {
  return Container(
    margin: cardEdgeInsets,
    height: AppLayout.getHeight(180),
    width: MediaQuery.of(context).size.width,
    decoration: boxDecoration,
    child: Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _subTitleText(text: AppString.text_casual_leave),
          _subInnerText()
        ],
      ),
    ),
  );
}

Widget _subTitleText({required text}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
    child: Text(
      text,
      style: subTitleTextStyle,
    ),
  );
}

Widget _subInnerText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _subInnerRow(leftText: AppString.text_earning_rate,dynamicText: "1.00/month"),
      _subInnerRow(leftText: AppString.text_allowance,dynamicText: "5.50"),
      _subInnerRow(leftText: AppString.text_earned,dynamicText: "8.50"),
      _subInnerRow(leftText: AppString.text_taken,dynamicText: "9.50"),
      _subInnerRow(leftText: AppString.text_availability,dynamicText: "4.50"),

    ],
  );
}

Widget _subInnerRow({required leftText, required dynamicText}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(4)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: subInnerTextStyle,
        ),
        Text(
          dynamicText,
          style: subInnerDynamicTextStyle,
        ),
      ],
    ),
  );
}

Decoration get boxDecoration {
  return BoxDecoration(
      color: AppColor.allowanceCardColor,
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault.toDouble()));
}

Widget _subAppbar() {
  return customMoreAppbar(titleText: AppString.text_leave_allowance);
}

EdgeInsets get edgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(20),
      right: AppLayout.getWidth(20),
      top: AppLayout.getHeight(0),
      bottom: AppLayout.getHeight(0));
}

EdgeInsets get cardEdgeInsets {
  return EdgeInsets.only(
      left: AppLayout.getWidth(20),
      right: AppLayout.getWidth(20),
      top: AppLayout.getHeight(0),
      bottom: AppLayout.getHeight(12));
}

Widget _titleText({required text}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(12)),
    child: Text(
      text,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor,
          fontWeight: FontWeight.w500,
          fontSize: Dimensions.fontSizeDefault + 3),
    ),
  );
}

TextStyle get subTitleTextStyle {
  return AppStyle.mid_large_text.copyWith(
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeDefault );
}

TextStyle get subInnerTextStyle {
  return AppStyle.mid_large_text.copyWith(
      color: AppColor.normalTextColor.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeDefault );
}

TextStyle get subInnerDynamicTextStyle {
  return AppStyle.mid_large_text.copyWith(
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeDefault );
}
