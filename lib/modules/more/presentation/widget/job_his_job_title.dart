import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget jodTitle({required jobTitleText, subTitleText, subEndText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle,
            size: 10,
            color: AppColor.disableColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitleText,
                      style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor,
                        fontSize: Dimensions.fontSizeDefault + 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      customSpacerHeight(height: 6),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          customSpacerWidth(width: 20),
          Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                color: AppColor.hintColor.withOpacity(0.6),
                size: Dimensions.fontSizeDefault + 2,
              ),
              customSpacerWidth(width: 8),
              Row(
                children: [
                  Text('${subTitleText} - ${subEndText}',style: AppStyle.mid_large_text.copyWith(
                      color: AppColor.normalTextColor.withOpacity(0.5),
                      fontSize: Dimensions.fontSizeDefault+1,
                      fontWeight: FontWeight.w300))
                ],
              )

            ],
          ),
        ],
      )
    ],
  );
}

Widget jodTitleRole({
  required jobTitleText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle,
            size: 10,
            color: AppColor.disableColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitleText,
                      style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor,
                        fontSize: Dimensions.fontSizeDefault + 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      customSpacerHeight(height: 6),
    ],
  );
}
