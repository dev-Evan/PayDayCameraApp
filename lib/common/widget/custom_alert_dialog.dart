import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import 'custom_spacer.dart';

Future CustomAlertDialog({
  context,
  yesAction,
  IconData? icon,
  IconData? decIcon,
  String? titleText = AppString.text_are_you_sure,
  String? contentText = AppString.text_dialog_dec,
  String? yesText = AppString.text_yes,
  Color? buttonColor = Colors.orange,
  Color? iconBgColor = AppColor.alertDgIconBgColor,
  Color? iconColor = Colors.orange,
  backAction
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titleText!,style: AppStyle.large_text.copyWith(fontSize: Dimensions.fontSizeLarge-1,color: AppColor.normalTextColor,fontWeight: FontWeight.w600),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusMid - 2),
        ),
        icon: Center(
          child: Container(
              width: AppLayout.getWidth(50),
              height: AppLayout.getHeight(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                color: iconBgColor,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: Dimensions.fontSizeDoubleLarge+2,
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

            customSpacerWidth(width: 4),
            Flexible(
              child: Text(
                contentText!,
                style: AppStyle.mid_large_text.copyWith(
                    color: AppColor.hintColor,
                    fontSize: Dimensions.fontSizeDefault-1),
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: AppLayout.getHeight(40),
                    child: TextButton(
                        onPressed: (){
                          if(backAction !=null){
                            backAction();
                          }else{
                      Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: AppColor.backgroundColor,
                            elevation: 0,
                            side: const BorderSide(
                                width: 1, color: AppColor.normalTextColor)),
                        child: Text(
                          AppString.text_no,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeMid-2),
                        )),
                  ),
                ),

                customSpacerWidth(width: 12),
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    height: AppLayout.getHeight(40),
                    child: ElevatedButton(
                        onPressed: () => yesAction(),
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
                            fontSize: Dimensions.fontSizeMid-3,
                            fontWeight: FontWeight.w600
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

Future exitDialog({
  context,
  yesAction,}) {
  return showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AlertDialog(
          title: Text(AppString.text_are_you_sure,style: AppStyle.mid_large_text.copyWith(color: AppColor.normalTextColor,fontWeight: FontWeight.w800),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusMid - 2),
          ),
          icon: Center(
            child: Container(
                width: AppLayout.getWidth(50),
                height: AppLayout.getHeight(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                  color: Colors.orange.shade50,
                ),
                child: Icon(
                  Icons.logout,
                  color: AppColor.pendingTextColor,
                  size: Dimensions.fontSizeDoubleLarge+2,
                )),
          ),
          content: Text(
            AppString.text_are_you_sure_want_to_exit_from_app,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor, fontSize: Dimensions.fontSizeDefault-1),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 8),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: AppLayout.getHeight(40),
                      child: TextButton(
                          onPressed: ()=>Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: Colors.transparent,
                              elevation: 0,
                              side: const BorderSide(
                                  width: 1, color: AppColor.normalTextColor)),
                          child: Text(
                            AppString.text_no,
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.normalTextColor,
                                fontSize: Dimensions.fontSizeMid-2),
                          )),
                    ),
                  ),

                  customSpacerWidth(width: 12),
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      height: AppLayout.getHeight(40),
                      child: ElevatedButton(
                          onPressed: () => yesAction(),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: Colors.orange,
                              elevation: 0),
                          child: Text(
                            AppString.text_yes,
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.cardColor,
                                fontSize: Dimensions.fontSizeMid-3,
                                fontWeight: FontWeight.w600
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),          ],
        ),
      );
    },
  );
}


