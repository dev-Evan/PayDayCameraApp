import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class CustomStatusButton extends StatelessWidget {
  final Color bgColor;
  final String text;

  const CustomStatusButton({super.key, required this.bgColor, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      //todo
      //change it to box decoration
      color: bgColor,
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getHeight(Dimensions.paddingDefault),
          vertical: AppLayout.getWidth(Dimensions.paddingSmall)),
      child: Text(text,style: AppStyle.small_text),
    );
  }
}
