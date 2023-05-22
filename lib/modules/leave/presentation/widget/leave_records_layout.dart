import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_summary.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget leaveRecordsLayOut() {
  Data? data = Get.find<LeaveController>().leaveSummary.data;
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppLayout.getHeight(98),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3.9 / 2.7,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _leaveRecordCard(
                    title: AppString.text_taken, timeCount: data?.approved),
                _leaveRecordCard(
                    title: AppString.text_upcomming, timeCount: data?.upcoming),
                _leaveRecordCard(
                    title: AppString.text_pending, timeCount: data?.pending),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

_leaveRecordCard({required String title, String? timeCount}) => Card(
      elevation: 0,
      color: AppColor.cardColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
          side:
              BorderSide(width: 1, color: AppColor.cardColor.withOpacity(0.2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeCount ?? "",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: Dimensions.fontSizeLarge - 3,
                      color: AppColor.cardColor.withOpacity(0.8)),
                ),
                Text(
                  title,
                  style: AppStyle.normal_text
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
