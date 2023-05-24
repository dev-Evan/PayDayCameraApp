import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
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
          _logoView(logo: Images.no_data),
          SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
          Text(AppString.start_out_day,style: AppStyle.large_text_black,)
        ],
      ),
    ),
  );
}
Widget _logoView({required logo}){
  return  SvgPicture.asset(
    logo.toString(),
    width: AppLayout.getWidth(90),
    height: AppLayout.getWidth(90),
  );
}