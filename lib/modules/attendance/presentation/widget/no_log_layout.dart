import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../../../utils/app_layout.dart';
import '../../../../utils/dimensions.dart';

Widget noLogLayout(){
  return Center(
    child: Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(Dimensions.paddingLarge),
          horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
      child: Column(
        children: [
          Image.asset(Images.bg_no_log),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          Text(AppString.start_out_day,style: AppStyle.large_text_black,)
        ],
      ),
    ),
  );
}