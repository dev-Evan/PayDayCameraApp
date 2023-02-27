import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../utils/app_layout.dart';
import '../../../../utils/app_style.dart';

Widget punchButton(Function onPressed) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1,color: Colors.white.withOpacity(.33)),
        color: Colors.white.withOpacity(.18),
        borderRadius: BorderRadius.circular(
          Dimensions.radiusDefault,
        )),
    width: double.maxFinite,
    height: AppLayout.getHeight(48),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.logout,color: Colors.white),
        Text("Punch In", style: AppStyle.normal_text),
      ],
    ),
  );
}
