import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payrun_badge.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_overview_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget summaryLayout({required paid, required unpaid,required total}){
  return   SizedBox(
    height: AppLayout.getHeight(194),
    child: Container(
      height: AppLayout.getHeight(222),
      decoration: AppStyle.ContainerStyle.copyWith(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft:
              Radius.circular(Dimensions.radiusMid),
              bottomRight:
              Radius.circular(Dimensions.radiusMid))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            customSpacerHeight(height: 14),
            paySlipOverviewLayout(
                context: Get.context,
                paid: paid,
                unpaid:unpaid,
                total:total),
            attendanceLogText(
                context: Get.context,
                text: AppString.text_payrun_badge,
                onAction: () => CustomNavigator(
                    context:  Get.context,
                    pageName:  PayRunBadge())),
          ],
        ),
      ),
    ),
  );
}