import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_style.dart';

import '../../../../utils/app_layout.dart';

Widget bottomSheetAppbar({required BuildContext context, String? appbarTitle}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 4,
        ),
        Text(
          appbarTitle ?? "Punch In",
          style:
              AppStyle.normal_text_black.copyWith(fontWeight: FontWeight.w600),
        ),
        const Spacer(
          flex: 3,
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.close,
            size: 16,
          ),
        ),
      ],
    ),
  );
}
