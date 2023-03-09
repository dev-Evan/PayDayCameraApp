import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

Future customButtomSheet(context,Height,Child) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (
        context,
        ) {
      return FractionallySizedBox(
        heightFactor: AppLayout.getHeight(Height),
        child:Child ,
      );
    },
  );
}