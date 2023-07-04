import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/images.dart';

Widget avatarArrowIcon() {
  return CircleAvatar(
    radius: 15,
    backgroundColor: AppColor.hintColor.withOpacity(0.1),
    child: SvgPicture.asset(
      Images.right_arrow,
      width: AppLayout.getWidth(22),
      height: AppLayout.getWidth(22),
      color: AppColor.primaryColor.withOpacity(0.8),
    ),
  );
}
