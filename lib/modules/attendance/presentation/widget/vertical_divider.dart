import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';


Widget verticalDivider({Color? dividerColor}) {
  return Container(
    height: AppLayout.getHeight(30),
    padding: const EdgeInsets.all(1),
    color: dividerColor ?? Colors.white,
  );
}
