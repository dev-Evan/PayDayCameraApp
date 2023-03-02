import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

Widget customDiveider(double  height, double width){

  return Padding(
    padding: const EdgeInsets.only(left: 0.0,right: 0),
    child: Container(width: AppLayout.getWidth(width),height: AppLayout.getHeight(height),color: AppColor.disableColor,),
  );
}