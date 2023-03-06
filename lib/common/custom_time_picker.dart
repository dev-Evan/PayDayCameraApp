import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_app_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../utils/app_string.dart';

class CustomTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openTimePicker(context),
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getHeight(Dimensions.paddingDefaultExtra),
              vertical: AppLayout.getWidth(
                  AppLayout.getWidth(Dimensions.paddingDefault))),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
          child: Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("11.00 AM", style: AppStyle.normal_text_black),
                  const Icon(Icons.access_time)
                ]),
          )),
    );
  }
}

_openTimePicker(BuildContext context) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          bottomSheetAppbar(
            context: context,
            appbarTitle: AppString.text_select_time,
          ),
        ],
      ),
      actions: [
        Center(
          child: AppButton(
            buttonText: AppString.text_save,
            onPressed: () => Navigator.of(context).pop(),
            buttonColor: AppColor.primary_blue,
          ),
        ),
      ],
    ),
  );
}
