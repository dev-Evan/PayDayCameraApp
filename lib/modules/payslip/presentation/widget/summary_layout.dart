import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payslip_controller.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payrun_badge.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../attendance/presentation/widget/attendance_log_text.dart';


Widget summaryLayout({required total, required sent, required conflicted,required totalDynamic, required sentDynamic, required conflictedDynamic,topTextValue, int layoutHeight=8,required context}) {
  return Container(
    decoration: AppStyle.ContainerStyle.copyWith(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimensions.radiusMid),
            bottomRight: Radius.circular(Dimensions.radiusMid))),
    child: layout(totalDynamic:totalDynamic,sentDynamic:sentDynamic,conflictedDynamic:conflictedDynamic,total: total,sent: sent,conflicted: conflicted,topTextValue: topTextValue,context: context,layoutHeight: layoutHeight.toInt()),
  );
}

Widget layout({required totalDynamic, required sentDynamic, required conflictedDynamic,required total, required sent, required conflicted,String ?topTextValue,required context, required int layoutHeight}) {
  return Padding(
    padding: boxPadding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topTextValue!.isEmpty) customSpacerHeight(height: 0)else customSpacerHeight(height: Dimensions.fontSizeDefault-10),
        if (topTextValue.isEmpty) Container() else layoutTopText(text: AppString.text_this_year),
        if (topTextValue.isEmpty) customSpacerHeight(height: 0)else customSpacerHeight(height: Dimensions.fontSizeMid),
        Row(
          children: [
            Expanded(child: container(dynamicInt: "$totalDynamic",countText: total)),
            customSpacerWidth(width: 12),
            Expanded(child: container(dynamicInt: "$sentDynamic",countText:sent)),
            customSpacerWidth(width: 12),
            Expanded(child: container(dynamicInt: "$conflictedDynamic",countText: conflicted)),
          ],
        ),
        customSpacerHeight(height: layoutHeight.toDouble()),
        if (topTextValue.isEmpty) Container() else  attendanceLogText(
            context: Get.context,
            text: AppString.text_payrun_badge,
            onAction: () async {
              defaultNavigator(context:context,routeName: const PayRunBadge() );
              await Get.find<PayslipController>().getPayrunBadgeData();
            }),

      ],
    ),
  );
}


Container container({required  dynamicInt,countText}) {
  return Container(
    decoration: decoration,
    child:  Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dynamicInt,
            style:dynamicTextStyle
          ),
          Text(
            countText,
            style: countTextStyle
          ),
        ],
      ),
    ),
  );
}
TextStyle get dynamicTextStyle{
  return  GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: Dimensions.fontSizeLarge - 3,
      color: AppColor.cardColor);
}
TextStyle get countTextStyle{
  return AppStyle.normal_text.copyWith(color: AppColor.cardColor.withOpacity(0.9));
}

Decoration get decoration {
  return AppStyle.ContainerStyle.copyWith(
      color: AppColor.cardColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
    border: Border.all(width: 1, color: AppColor.cardColor.withOpacity(0.2))
  );
}
EdgeInsets  get padding{
  return  EdgeInsets.only(top: AppLayout.getHeight(12),bottom: AppLayout.getHeight(12),left: AppLayout.getWidth(0),right: AppLayout.getWidth(0));

}
EdgeInsets  get boxPadding{return  EdgeInsets.only(top: AppLayout.getHeight(Dimensions.fontSizeMid),bottom: AppLayout.getHeight(0),left: AppLayout.getWidth(18),right: AppLayout.getWidth(18));}

Widget layoutTopText({required text}) {
  return Text(
    text,
    style: AppStyle.large_text.copyWith(fontSize: Dimensions.fontSizeMid),
  );
}
