import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/timer_picker.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getHeight(Dimensions.paddingDefaultExtra),
            vertical: AppLayout.getWidth(
                AppLayout.getWidth(Dimensions.paddingDefault))),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("11.00 AM", style: AppStyle.normal_text_black),
            const Icon(Icons.access_time)
          ],
        ),
      ),
      onTap: () => timePicker(context),
    );
  }
}
