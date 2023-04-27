import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';

Widget avatarArrowIcon(){
  return  CircleAvatar(
      radius: 14,
      backgroundColor: AppColor.hintColor.withOpacity(0.1),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
        color: AppColor.primaryColor.withOpacity(0.8),
      ));
}
