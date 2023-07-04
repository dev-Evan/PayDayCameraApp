import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../utils/app_layout.dart';
import '../../utils/dimensions.dart';

Future errorAlertPopup(Function onReloadClicked) {
  return showDialog(
    barrierDismissible: true,
    context: Get.context!,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        insetPadding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(0, 3),
                )
              ]),
          margin: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppLayout.getHeight(24),
              ),
              Image.asset(Images.error_alert_logo),
              Text(
                "Opps!!",
                style: AppStyle.extra_large_text
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              Text(
                AppString.error_text,
                textAlign: TextAlign.center,
                style: AppStyle.normal_text_grey,
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
              SizedBox(
                width: AppLayout.getWidth(150),
                child: TextButton.icon(
                  icon: const Icon(Icons.refresh,color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    onReloadClicked();
                    Get.back(canPop: false);
                  },
                  label: Text(AppString.text_reload,
                      style: AppStyle.normal_text.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(20),
              ),
            ],
          ),
        ),
      );
    },
  );
}
