import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Future CustomAlertDialog({
  context,
  yesAction,
  IconData? icon,
  IconData? decIcon,
  String? titleText = AppString.text_are_you_sure,
  String? contentText = AppString.text_dialog_dec,
  String? yesText = AppString.text_yes,
  Color? buttonColor = Colors.orange,
  Color? iconBgColor = Colors.orange,
  Color? iconColor = Colors.orange,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titleText!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMid - 2),
        ),
        icon: Center(
          child: Container(
              width: AppLayout.getWidth(40),
              height: AppLayout.getHeight(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: iconBgColor,
              ),
              child: Icon(
                icon,
                color: iconColor,
              )),
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              decIcon,
              size: Dimensions.fontSizeDefault + 4,
              color: AppColor.hintColor,
            ),
            SizedBox(
              width: AppLayout.getWidth(4),
            ),
            Flexible(
              child: Text(
                contentText!,
                style: AppStyle.mid_large_text.copyWith(
                    color: AppColor.hintColor,
                    fontSize: Dimensions.fontSizeDefault + 2),
              ),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 8),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: AppLayout.getHeight(40),
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: AppColor.backgroundColor,
                            elevation: 0,
                            side: BorderSide(
                                width: 1, color: AppColor.normalTextColor)),
                        child: Text(
                          AppString.text_no,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeMid),
                        )),
                  ),
                ),
                SizedBox(
                  width: AppLayout.getWidth(12),
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    // width: MediaQuery.of(context).size.width / 1,
                    height: AppLayout.getHeight(40),
                    child: ElevatedButton(
                        onPressed: () => yesAction,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: buttonColor,
                            elevation: 0),
                        child: Text(
                          yesText!,
                          style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.cardColor,
                            fontSize: Dimensions.fontSizeMid,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
