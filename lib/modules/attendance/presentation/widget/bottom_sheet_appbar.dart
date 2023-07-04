import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../utils/app_layout.dart';

Widget bottomSheetAppbar({required BuildContext context, String? appbarTitle,Function? onAction}) {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: AppLayout.getWidth(Dimensions.paddingDefault),
        vertical: AppLayout.getHeight(Dimensions.paddingDefault - 8)),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            offset: const Offset(0, 3),
          )
        ]),
    child: AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        appbarTitle ?? "Punch In",
        style: AppStyle.normal_text_black.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.fontSizeDefault + 2),
      ),
      actions: [
        IconButton(
          onPressed: () {
            if(onAction !=null){
              onAction();
              Navigator.of(context).pop();

            }else{
              Navigator.of(context).pop();
            }
          },
          icon: Icon(
            Icons.close,
            size: Dimensions.fontSizeLarge,
            color: AppColor.secondaryColor,
          ),
        ),
      ],
    ),
  );
}
