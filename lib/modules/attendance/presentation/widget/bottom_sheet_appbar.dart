import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_style.dart';

import '../../../../utils/app_layout.dart';

Widget bottomSheetAppbar( BuildContext context ,text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 4,
        ),
        Text(text,),
        const Spacer(
          flex: 3,
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.close,
            size: 16,
          ),
        ),
      ],
    ),
  );
}