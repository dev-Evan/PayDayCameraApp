import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_app_button.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/bank_info_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/dimensions.dart';
import 'custom_alert_dialog.dart';

Future customDialogLayout({required controller, required onAction}) {
  return showDialog(
    barrierDismissible: true,
    context: Get.context!,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customSpacerHeight(height: 20),
                _iconBox(
                    iconColor: AppColor.iconBoxColor,
                    icon:  Icon(CupertinoIcons.delete, color: AppColor.errorColor.withOpacity(0.5),
                        size: Dimensions.fontSizeDoubleLarge + 5),
                    iconBgColor: AppColor.iconBoxColor.withOpacity(0.2)
                ),
                customSpacerHeight(height: 20),
                _titleText(titleText: AppString.text_are_you_sure),
                customSpacerHeight(height: 15),
                _contentText(),
                customSpacerHeight(height: 36),


                 Obx(() => controller.isLoading.value==true
                     ? _loadingButtonLayout()
                     : _buttonLayout(context: context,onAction: onAction),),

                customSpacerHeight(height: 20)
              ],
            )),
      );
    },
  );
}

_iconBox({required Color iconColor, required Widget icon, required Color iconBgColor}) {
  return Center(
    child: Container(
      width: AppLayout.getWidth(56),
      height: AppLayout.getHeight(56),
      decoration: boxDecoration(iconBgColor: iconBgColor),
      child: icon,

    ),
  );
}

_titleText({required String titleText}) {
  return Text(
    titleText,
    style: _titleTextStyle,
  );
}

_contentText() {
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Text(AppString.text_dialog_dec,
            textAlign: TextAlign.center,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.hintColor,
                fontSize: Dimensions.fontSizeDefault)),
      ),
    ],
  );
}

_loadingButtonLayout() => SizedBox(
  height: AppLayout.getHeight(50),
  child: const LoadingIndicator(),
);

TextStyle get _titleTextStyle {
  return AppStyle.large_text.copyWith(
      fontSize: Dimensions.fontSizeLarge+1,
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w600);
}

_buttonLayout({ required context,required onAction}) {
  return  Padding(
    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
    child: Row(
      children: [
        AppButton(
          buttonText: AppString.text_no,
          onPressed: () {
            Get.back();
          },
          buttonColor: Colors.transparent,
          textColor: Colors.black,
          borderColor: Colors.black,
        ),
        customSpacerWidth(width: 10),
        AppButton(
            buttonText: AppString.text_yes,
            onPressed: ()=>onAction(),
            hasOutline: false,
            buttonColor: AppColor.iconBoxColor),
      ],
    ),
  );
}
