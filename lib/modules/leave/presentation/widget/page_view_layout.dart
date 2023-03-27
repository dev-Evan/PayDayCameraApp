import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget PageViewLayout() {
  List title = [
    AppString.text_availability,
    AppString.text_taken,
  ];

  List viewCasual = [
    AppString.text_casual,
    AppString.text_casual,
  ];

  List viewSilck = [
    AppString.text_sick,
    AppString.text_sick,
  ];
  List paid = [
    AppString.text_paid,
    AppString.text_paid,
  ];
  List unpaid = [
    AppString.text_unpaid,
    AppString.text_unpaid,
  ];

  List paidUnpaidCount = [
    '08',
    '07',
  ];

  return Container(
    height: AppLayout.getHeight(146),
    width: AppLayout.getWidth(412),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: title.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18),
          child: Container(
            width: AppLayout.getWidth(252),
            decoration: AppStyle.ContainerStyle.copyWith(
                borderRadius:
                    BorderRadius.circular(Dimensions.radiusDefault + 2),
                color: AppColor.cardColor.withOpacity(0.1),
                border: Border.all(
                    width: 1, color: AppColor.cardColor.withOpacity(0.2))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title[index],
                    style: AppStyle.large_text.copyWith(
                      color: AppColor.backgroundColor,
                      fontSize: Dimensions.fontSizeMid - 6,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewCasual[index],
                              style: AppStyle.normal_text.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.backgroundColor,
                                  fontSize: Dimensions.fontSizeDefault - 1),
                            ),
                            SizedBox(
                              height: AppLayout.getHeight(4),
                            ),
                            Row(
                              children: [
                                Text(
                                  paidUnpaidCount[index],
                                  style: AppStyle.normal_text.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.backgroundColor,
                                      fontSize:
                                          Dimensions.fontSizeDefault - 1),
                                ),
                                SizedBox(
                                  width: AppLayout.getWidth(8),
                                ),
                                Text(
                                  paid[index],
                                  style: AppStyle.normal_text.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.backgroundColor,
                                      fontSize:
                                          Dimensions.fontSizeDefault - 1),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppLayout.getHeight(4),
                            ),
                            Row(
                              children: [
                                Text(
                                  paidUnpaidCount[index],
                                  style: AppStyle.normal_text.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.backgroundColor,
                                      fontSize:
                                          Dimensions.fontSizeDefault - 1),
                                ),
                                SizedBox(
                                  width: AppLayout.getWidth(8),
                                ),
                                Text(
                                  unpaid[index],
                                  style: AppStyle.normal_text.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.backgroundColor,
                                      fontSize:
                                          Dimensions.fontSizeDefault - 1),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewSilck[index],
                            style: AppStyle.normal_text.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColor.backgroundColor,
                                fontSize: Dimensions.fontSizeDefault - 1),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(6),
                          ),
                          Row(
                            children: [
                              Text(
                                paidUnpaidCount[index],
                                style: AppStyle.normal_text.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.backgroundColor,
                                    fontSize: Dimensions.fontSizeDefault - 1),
                              ),
                              SizedBox(
                                width: AppLayout.getWidth(8),
                              ),
                              Text(
                                paid[index],
                                style: AppStyle.normal_text.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.backgroundColor,
                                    fontSize: Dimensions.fontSizeDefault - 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(6),
                          ),
                          Row(
                            children: [
                              Text(
                                paidUnpaidCount[index],
                                style: AppStyle.normal_text.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.backgroundColor,
                                    fontSize: Dimensions.fontSizeDefault - 1),
                              ),
                              SizedBox(
                                width: AppLayout.getWidth(8),
                              ),
                              Text(
                                unpaid[index],
                                style: AppStyle.normal_text.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.backgroundColor,
                                    fontSize: Dimensions.fontSizeDefault - 1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
