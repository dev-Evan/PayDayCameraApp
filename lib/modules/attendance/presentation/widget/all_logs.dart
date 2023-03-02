
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class allLogsScreen extends StatelessWidget {
  const allLogsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: AppLayout.getHeight(12),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(AppString.textCustom,style: AppStyle.mid_large_text.copyWith(color: AppColor.secondaryColor,fontWeight: FontWeight.w700),),
                      SizedBox(
                        width: AppLayout.getWidth(12),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.hintColor,
                      )
                    ],
                  ),
                  Text(
                    '14 Dec 2022 - 30 Dec 2022',
                    style: AppStyle.small_text_black
                        .copyWith(color: AppColor.hintColor),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.filter_alt, color: AppColor.hintColor),
                          SizedBox(
                            width: AppLayout.getWidth(24),
                          ),
                          Icon(
                            Icons.file_upload_outlined,
                            color: AppColor.hintColor,
                          )
                        ],
                      ),
                      Positioned(
                          left: 28,
                          top: -1,
                          child: Icon(
                            Icons.circle,
                            size: 8,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppLayout.getHeight(12),),
          Expanded(child: logsList())
        ],
      ),
    ));
  }
}

Widget logsList() {
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return Card(
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
            customDiveider(25, 1),
            Column(
              children: [
                Text(
                  "11.00 am - 8.00 pm",
                  style: AppStyle.mid_large_text
                      .copyWith(color: AppColor.secondaryColor),
                ),
                Row(

                  children: [
                    Icon(
                      Icons.lock_clock,
                      color: AppColor.hintColor.withOpacity(0.6),
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(3),
                    ),
                    Text(
                      "9h",
                      style: AppStyle.small_text.copyWith(
                          color: AppColor.hintColor.withOpacity(0.7),
                          fontSize: Dimensions.fontSizeDefault+2),
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(12),
                    ),
                    Icon(
                      Icons.sticky_note_2_outlined,
                      color: AppColor.hintColor.withOpacity(0.6),
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(3),
                    ),
                    Text(
                      "0",
                      style: AppStyle.small_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeDefault+3),
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(12),
                    ),
                    // Card(
                    //   elevation: 0,
                    //   color: AppColor.pendingBgColor.withOpacity(0.1),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 8.0,right:8,top: 4,bottom: 4),
                    //     child: Text(
                    //       "Pending",
                    //       style: AppStyle.small_text.copyWith(
                    //           color: AppColor.pendingColor,
                    //           fontWeight: FontWeight.w600),
                    //     ),
                    //   ),
                    // ),
                    CustomStatusButton(bgColor: AppColor.pendingBgColor.withOpacity(0.4),text: AppString.text_pending,textColor: AppColor.pendingTextColor,)

                  ],
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: AppColor.disableColor.withOpacity(0.3),
                radius: 14,
                child: Icon(Icons.arrow_forward_ios_rounded,color: AppColor.primaryColor,size: 16,))

          ],
        ),
      );
    },
  );
}
