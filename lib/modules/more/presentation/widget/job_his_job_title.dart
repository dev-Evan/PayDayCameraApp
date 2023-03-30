import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget jodTitle({jobTitleText}) {
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
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: AppColor.hintColor.withOpacity(0.6),
                            size: Dimensions.fontSizeDefault + 2,
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(3),
                          ),
                          Text(
                            AppString.text_11_jan_2023,
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.hintColor.withOpacity(0.7),
                                fontSize: Dimensions.fontSizeDefault + 2,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        height: AppLayout.getHeight(6),
      ),
    ],
  );
}