import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payrun_badge_controller.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_overview_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../routes/app_pages.dart';


Widget summaryLayout({required total, required sent, required conflicted}) {
  return SizedBox(
    height: AppLayout.getHeight(194),
    child: Container(
      height: AppLayout.getHeight(222),
      decoration: AppStyle.ContainerStyle.copyWith(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.radiusMid),
              bottomRight: Radius.circular(Dimensions.radiusMid))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            customSpacerHeight(height: 14),
            paySlipOverviewLayout(
                context: Get.context, paid: total, unpaid: sent, total: conflicted),
            attendanceLogText(
                context: Get.context,
                text: AppString.text_payrun_badge,
                onAction: () async {
                  Get.toNamed(Routes.PAYRAN_BAGE);
                  await Get.find<PayrunBadgeController>().getPayrunBadgeData();

                }),
          ],
        ),
      ),
    ),
  );
}
