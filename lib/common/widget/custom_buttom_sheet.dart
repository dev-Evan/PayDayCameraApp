import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Future customButtonSheet({context, height, child}) {
  return

    showModalBottomSheet(

    context: context,
    isScrollControlled: true,
    backgroundColor: AppColor.backgroundColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              Dimensions.radiusMid,
            ),
            topLeft: Radius.circular(Dimensions.fontSizeMid))),
    builder: (
      context,
    ) {
      return FractionallySizedBox(
        heightFactor: AppLayout.getHeight(height),
        child: child,
      );
    },
  );
}
