import 'package:flutter/cupertino.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

import '../../utils/images.dart';
import 'custom_appbar.dart';
import 'custom_spacer.dart';

Center  noDataFound({double height=158,double svgHeight =160,double svgWidth=160}){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customSpacerHeight(height: height),
        svgIcon(
          height: AppLayout.getHeight(svgHeight),
          width: AppLayout.getWidth(svgWidth),
          url: Images.no_data_found,
        ),
      ],
    ),
  );
}