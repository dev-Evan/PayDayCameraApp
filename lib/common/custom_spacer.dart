import 'package:flutter/cupertino.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

Widget customSpacerHeight({required double height}){
  return  SizedBox(
      height: AppLayout.getHeight(
        height,
      ));
}


Widget customSpacerWidth({required double width}) {
  return SizedBox(
      width: AppLayout.getWidth(
        width,
      ));
}
