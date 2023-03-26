import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class PayRunBadgeView extends StatelessWidget {
  const PayRunBadgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Card(
                elevation: 0,
                color: AppColor.primaryColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: Icon(
                      Icons.description_outlined,
                      color: AppColor.primaryColor.withOpacity(0.8),
                    ),
                  ),
                )),
            SizedBox(
              width: AppLayout.getWidth(12),
            ),
            Text(
              AppString.text_payrun_details,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.fontSizeDefault + 1,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 56.0, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_period,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                  Text(
                    AppString.text_consider_type,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                  Text(
                    AppString.text_overtime,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_monthly,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.9),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                  Text(
                    AppString.text_hour,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.9),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                  Text(
                    AppString.text_included,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.9),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Card(
                elevation: 0,
                color: AppColor.primaryColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: Icon(
                      Icons.more_time,
                      color: AppColor.primaryColor.withOpacity(0.8),
                    ),
                  ),
                )),
            SizedBox(
              width: AppLayout.getWidth(12),
            ),
            Text(
              AppString.text_allowances,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.fontSizeDefault + 1,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 56.0, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_bonus,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                  Text(
                    AppString.text_medical,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                  Text(
                    AppString.text_food_,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                  Text(
                    AppString.text_transport,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_2 + AppString.text_percent,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.9),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                  Text(
                    AppString.text_2 + AppString.text_percent,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.9),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                  Text(
                    AppString.text_2 + AppString.text_percent,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.9),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                  Text(
                    AppString.text_2 + AppString.text_percent,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.9),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Card(
                elevation: 0,
                color: AppColor.primaryColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: Icon(
                      Icons.timelapse,
                      color: AppColor.primaryColor.withOpacity(0.8),
                    ),
                  ),
                )),
            SizedBox(
              width: AppLayout.getWidth(12),
            ),
            Text(
              AppString.text_allowances,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor,
                  fontSize: Dimensions.fontSizeDefault + 1,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 56.0, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_tax,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_2 + AppString.text_percent,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor.withOpacity(0.9),
                        fontSize: Dimensions.fontSizeDefault,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
