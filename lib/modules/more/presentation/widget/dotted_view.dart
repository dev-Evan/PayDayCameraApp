import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

Widget dottedSalaryView(){
  return  Padding(
    padding: const EdgeInsets.only(left: 28.0),
    child: DottedBorder(
      customPath: (p0) => Path()..lineTo(0, 250),
      color: AppColor.hintColor.withOpacity(0.6),
      dashPattern: const [6, 4],
      strokeWidth: 1.2,
      child: Row(
        children: [
          Divider(
            height: AppLayout.getHeight(215),
            color: AppColor.noColor,
          ),
        ],
      ),
    ),
  );
}


Widget dottedView(){
  return  Padding(
    padding: const EdgeInsets.only(left: 28.0),
    child: DottedBorder(
      customPath: (p0) => Path()..lineTo(0, 100),
      color: AppColor.hintColor.withOpacity(0.6),
      dashPattern: const [6, 4],
      strokeWidth: 1,
      child: Row(
        children: [
          Divider(
            height: AppLayout.getHeight(90),
            color: AppColor.noColor,
          ),
        ],
      ),
    ),
  );
}

