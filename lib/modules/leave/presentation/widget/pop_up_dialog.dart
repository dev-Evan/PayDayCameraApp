
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';



Future popUpDialog({context, child}) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        insetPadding: EdgeInsets.zero,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0, 3),
                  )
                ]),
            margin: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 child
                ],
              ),
            )),
      );
    },
  );
}



