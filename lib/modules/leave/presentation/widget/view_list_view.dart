

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_details.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget viewListViewLayout(){

  return ListView.builder(
    itemCount: 222,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () => customButtomSheet(
                  context: context, Height: 0.9, Child: const LeaveDetails()),
              child: Card(
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "10",
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeExtraLarge,
                              fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Dec",
                          style: AppStyle.small_text.copyWith(
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeSmall),
                        ),
                      ],
                    ),
                    CustomDiveider(25, 0.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.text_paid +AppString.text_casual,
                          style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.fontSizeDefault + 1,
                          ),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(6),
                        ),

                        Row(
                          children: [
                            Text('2 days',style: AppStyle.small_text_black,),
                            SizedBox(width: AppLayout.getWidth(12),),

                            CustomStatusButton(
                              bgColor: AppColor.pendingBgColor.withOpacity(0.2),
                              text: AppString.text_pending,
                              textColor: AppColor.pendingTextColor,
                            ),
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                        backgroundColor: AppColor.disableColor.withOpacity(0.2),
                        radius: 14,
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.primaryColor,
                          size: 16,
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CustomDiveider(
                  AppLayout.getHeight(0.6), MediaQuery.of(context).size.width),
            )
          ],
        ),
      );
    },
  );
}
