import 'package:flutter/cupertino.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

Widget customSpacerH({double? height}){
  return  SizedBox(
      height: AppLayout.getHeight(
        height!,
      ));
}


Widget customSpacerW({ double? width}) {
  return SizedBox(
      width: AppLayout.getWidth(
        width!,
      ));
}
