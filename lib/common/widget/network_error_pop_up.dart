import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../utils/app_layout.dart';
import '../../utils/dimensions.dart';
import 'custom_spacer.dart';

Future networkErrorAlertPopup() {
  return showDialog(
    barrierDismissible: false,
    context: Get.context!,
    builder: (context) {
      return WillPopScope(child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: SizedBox.expand(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Images.network_error),
                customSpacerHeight(height: 20),
                Text(
                  AppString.no_internet_title_text,
                  style: AppStyle.extra_large_text_black
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                customSpacerHeight(height: 20),
                Text(
                  AppString.no_internet_subtitle_text,
                  style: AppStyle.normal_text_black,
                  textAlign: TextAlign.center,
                ),
                customSpacerHeight(height: 40),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.primaryBlue,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(8)),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: AppLayout.getWidth(16),
                    ),
                    customSpacerWidth(width: 4),
                    Text(AppString.text_retry, style: AppStyle.normal_text),
                  ]),
                )
              ],
            ),
          ),
        ),
      ), onWillPop: () async=> false,);
    },
  );
}
