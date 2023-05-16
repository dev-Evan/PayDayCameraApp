import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendace_log_overview.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget paySlipOverviewLayout(
    {required context, required total, required paid, required unpaid}) {
  List countTitleText = [
    AppString.text_paid,
    AppString.text_unpaid,
    AppString.text_total,
  ];

  List countNumber = [
    paid,
    unpaid,
    total,
  ];
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        logsText(AppString.text_this_year),
        SizedBox(
          height: AppLayout.getHeight(100),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _cardText(
                    countNumber: countNumber[index],
                    countText: countTitleText[index]);
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _cardText({countText, countNumber}) {
  return Card(
    elevation: 0,
    color: AppColor.cardColor.withOpacity(0.1),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
        side: BorderSide(width: 1, color: AppColor.cardColor.withOpacity(0.2))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                countNumber,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.fontSizeLarge - 3,
                    color: AppColor.cardColor.withOpacity(0.8)),
              ),
              Text(
                countText,
                style: AppStyle.normal_text,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
