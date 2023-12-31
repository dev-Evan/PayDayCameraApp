import 'package:flutter/cupertino.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

import '../../utils/images.dart';
import 'custom_appbar.dart';
import 'custom_spacer.dart';

Widget  noDataFound({double height=158,double svgHeight =160,double svgWidth=160}){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customSpacerHeight(height: height),
        Align(
          alignment: Alignment.center,
          child: svgIcon(
            height: AppLayout.getHeight(svgHeight),
            width: AppLayout.getWidth(svgWidth),
            url: Images.no_data_found,
          ),
        ),
      ],
    ),
  );
}