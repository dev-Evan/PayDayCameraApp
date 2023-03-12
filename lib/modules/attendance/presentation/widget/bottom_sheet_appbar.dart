import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../utils/app_layout.dart';

Widget bottomSheetAppbar({required BuildContext context, String? appbarTitle,}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: AppLayout.getWidth(Dimensions.paddingLarge),
        vertical: AppLayout.getHeight(Dimensions.paddingDefault)),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0, 3),
          )
        ]),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        appbarTitle ?? "Punch In",
        style: AppStyle.normal_text_black.copyWith(fontWeight: FontWeight.w600,fontSize: Dimensions.fontSizeDefault+4),
      ),
      actions: [
      IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.close,
            size: 24,color: AppColor.secondaryColor,
          ),
        ),
      ],
    ),
  );
}
