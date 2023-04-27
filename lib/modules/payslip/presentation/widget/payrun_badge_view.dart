import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class PayRunBadgeView extends StatelessWidget {
  const PayRunBadgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _cardTitle(
              icon: Icons.description_outlined,
              titleText: AppString.text_payrun_details),
          Padding(
            padding: const EdgeInsets.only(left: 56.0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subTextLeft(subTitleText: AppString.text_period),
                    _subTextLeft(subTitleText: AppString.text_period),
                    _subTextLeft(subTitleText: AppString.text_period),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subTextRight(subTextRight: AppString.text_monthly),
                    _subTextRight(subTextRight: AppString.text_monthly),
                    _subTextRight(subTextRight: AppString.text_monthly),
                  ],
                ),
              ],
            ),
          ),
          _cardTitle(
              icon: Icons.more_time, titleText: AppString.text_allowances),
          Padding(
            padding: const EdgeInsets.only(left: 56.0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subTextLeft(subTitleText: AppString.text_period),
                    _subTextLeft(subTitleText: AppString.text_period),
                    _subTextLeft(subTitleText: AppString.text_period),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subTextRight(
                        subTextRight:
                            AppString.text_2 + AppString.text_percent),
                    _subTextRight(
                        subTextRight:
                            AppString.text_2 + AppString.text_percent),
                    _subTextRight(
                        subTextRight:
                            AppString.text_2 + AppString.text_percent),
                    _subTextRight(
                        subTextRight:
                            AppString.text_2 + AppString.text_percent),
                  ],
                ),
              ],
            ),
          ),
          _cardTitle(icon: Icons.timelapse, titleText: AppString.text_duration),
          Padding(
            padding: const EdgeInsets.only(left: 56.0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subTextLeft(subTitleText: AppString.text_period),
                    _subTextLeft(subTitleText: AppString.text_period),
                    _subTextLeft(subTitleText: AppString.text_period),
                    customSpacerHeight(height: 12),
                    _subTextLeft(subTitleText: AppString.text_tax),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subTextRight(subTextRight: AppString.text_monthly),
                    _subTextRight(subTextRight: AppString.text_monthly),
                    _subTextRight(subTextRight: AppString.text_monthly),
                    customSpacerHeight(height: 12),
                    _subTextRight(
                        subTextRight:
                            AppString.text_2 + AppString.text_percent),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _cardTitle({icon, titleText}) {
  return Row(
    children: [
      Card(
          elevation: 0,
          color: AppColor.primaryColor.withOpacity(0.1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Icon(
                icon,
                color: AppColor.primaryColor.withOpacity(0.8),
              ),
            ),
          )),
      SizedBox(
        width: AppLayout.getWidth(12),
      ),
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

Widget _subTextRight({subTextRight}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      subTextRight,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor.withOpacity(0.9),
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    ),
  );
}

Widget _subTextLeft({subTitleText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      AppString.text_period,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    ),
  );
}
