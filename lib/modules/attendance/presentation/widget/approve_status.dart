import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/color_picker_helper.dart';

Widget approveStatus({required String status}) => Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(8), vertical: AppLayout.getHeight(4)),
      decoration: BoxDecoration(
        color: Util.getChipBgColor(status: status),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(Util.getChipText(status),
          style: AppStyle.small_text
              .copyWith(color: Util.getChipTextColor(status: status))),
    );
