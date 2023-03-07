import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/attendance/presentation/widget/am_pm_button.dart';
import '../modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import '../utils/app_color.dart';
import '../utils/app_layout.dart';
import '../utils/app_string.dart';
import '../utils/app_style.dart';
import '../utils/dimensions.dart';
import 'custom_app_button.dart';
import 'custom_wheel_picker_hrs.dart';
import 'custom_wheel_picker_mins.dart';

Future timePicker(BuildContext context) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      insetPadding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(16)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(0, 3),
              )
            ]),
        margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            bottomSheetAppbar(
              context: context,
              appbarTitle: AppString.text_select_time,
            ),
            _openClock(),
            SizedBox(
              height: AppLayout.getHeight(28),
            ),
            _saveButton(context),
            SizedBox(
              height: AppLayout.getHeight(20),
            ),
          ],
        ),
      ),
    ),
  );
}

_openClock() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _hrs(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(24)),
            child: Text(
              " : ",
              style: AppStyle.large_text_black.copyWith(
                  color: AppColor.primary_blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _mins(),
        ],
      ),
      SizedBox(height: AppLayout.getHeight(Dimensions.paddingLarge)),
      amPmToggleButton(),
    ],
  );
}

_hrs() {
  List<String> hrsList =
      List.generate(13, (element) => element < 10 ? "0$element" : "$element");
  return SizedBox(
    height: AppLayout.getHeight(150),
    width: AppLayout.getWidth(40),
    child: Center(
      child: CustomWheelPickerHrs(list: hrsList),
    ),
  );
}

_mins() {
  List<String> minList =
      List.generate(60, (element) => element < 10 ? "0$element" : "$element");
  return SizedBox(
    height: AppLayout.getHeight(150),
    width: AppLayout.getWidth(40),
    child: Center(
      child: CustomWheelPickerMins(list: minList),
    ),
  );
  // return Container();
}

_saveButton(BuildContext context) {
  return SizedBox(
    width: 140,
    child: AppButton(
      isButtonExpanded: false,
      buttonText: AppString.text_save,
      onPressed: () => Navigator.of(context).pop(),
      buttonColor: AppColor.primary_blue,
    ),
  );
}
