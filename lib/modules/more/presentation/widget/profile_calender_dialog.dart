import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Future profileCalenderDialog({context, child,dobSaveAction,double?  height,double?  width}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMid - 4),
        ),
        titlePadding: const EdgeInsets.only(top: 0, left: 0, right: 0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: bottomSheetAppbar(
            context: context, appbarTitle: AppString.text_select_date),
        content: SizedBox(
          height: height=MediaQuery.of(context).size.height / 2,
          width: width=AppLayout.getWidth(420),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: child,
            ),
          ),
        ),
        actions: [
          Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 12),
                child: CustomSmallButton(AppString.text_save, ()=>dobSaveAction()),
              )),
        ],
      );
    },
  );
}

Future DocumentDialog({context, child,}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMid - 4),
        ),
        titlePadding: const EdgeInsets.only(top: 0, left: 0, right: 0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 0),
        content: SizedBox(
          height: AppLayout.getHeight(40),
          width: AppLayout.getWidth(40),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: child,
            ),
          ),
        ),
        actions: [],
      );
    },
  );
}

