import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class SalaryOverView extends StatelessWidget {
  const SalaryOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customMoreAppbar(titleText: AppString.text_salary_overview),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.text_joining_date,
                      style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.normalTextColor,
                          fontSize: Dimensions.fontSizeMid,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      AppString.text_01_jan_1998,
                      style: AppStyle.small_text_black
                          .copyWith(color: AppColor.hintColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 38),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: DottedBorder(
                              customPath: (p0) => Path()..lineTo(0, 480),
                              color: AppColor.disableColor,
                              dashPattern: [6, 4],
                              strokeWidth: 1,
                              child: Divider(
                                height: AppLayout.getHeight(480),
                                color: AppColor.noColor,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 23,
                            top: -0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: AppColor.primaryColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppString.text_salary_increment,
                                                style: AppStyle.mid_large_text
                                                    .copyWith(
                                                  color: AppColor.hintColor,
                                                  fontSize:
                                                      Dimensions.fontSizeDefault +
                                                          2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Row(
                                    children: [
                                      Card(
                                          elevation: 0,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.radiusDefault)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.money_dollar,
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: AppLayout.getWidth(3),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppString.text_$30,
                                            style: AppStyle.mid_large_text
                                                .copyWith(
                                                    color: AppColor
                                                        .normalTextColor
                                                        .withOpacity(0.7),
                                                    fontSize: Dimensions
                                                            .fontSizeDefault +
                                                        2,
                                                    fontWeight: FontWeight.w800),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppString
                                                    .text_will_be_effective_from,
                                                style: AppStyle.mid_large_text
                                                    .copyWith(
                                                        color: AppColor.hintColor
                                                            .withOpacity(0.7),
                                                        fontSize: Dimensions
                                                                .fontSizeDefault -
                                                            2,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              Text(
                                                AppString.text_11_jan_2023,
                                                style: AppStyle.mid_large_text
                                                    .copyWith(
                                                        color: AppColor
                                                            .normalTextColor
                                                            .withOpacity(0.7),
                                                        fontSize: Dimensions
                                                                .fontSizeDefault -
                                                            2,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppLayout.getWidth(12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 23,
                            top: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: AppColor.disableColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppString.text_11_jan_2023,
                                                style: AppStyle.mid_large_text
                                                    .copyWith(
                                                  color: AppColor.hintColor,
                                                  fontSize:
                                                      Dimensions.fontSizeDefault +
                                                          2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Row(
                                    children: [
                                      Card(
                                          elevation: 0,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.radiusDefault)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.money_dollar,
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: AppLayout.getWidth(3),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppString.text_$30,
                                            style: AppStyle.mid_large_text
                                                .copyWith(
                                                    color: AppColor
                                                        .normalTextColor
                                                        .withOpacity(0.7),
                                                    fontSize: Dimensions
                                                            .fontSizeDefault +
                                                        2,
                                                    fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppLayout.getWidth(12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 23,
                            top: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: AppColor.disableColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppString.text_11_jan_2023,
                                                style: AppStyle.mid_large_text
                                                    .copyWith(
                                                  color: AppColor.hintColor,
                                                  fontSize:
                                                      Dimensions.fontSizeDefault +
                                                          2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Row(
                                    children: [
                                      Card(
                                          elevation: 0,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.radiusDefault)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.money_dollar,
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: AppLayout.getWidth(3),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppString.text_$30,
                                            style: AppStyle.mid_large_text
                                                .copyWith(
                                                    color: AppColor
                                                        .normalTextColor
                                                        .withOpacity(0.7),
                                                    fontSize: Dimensions
                                                            .fontSizeDefault +
                                                        2,
                                                    fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppLayout.getWidth(12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 23,
                            top: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: AppColor.disableColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppString.text_11_jan_2023,
                                                style: AppStyle.mid_large_text
                                                    .copyWith(
                                                  color: AppColor.hintColor,
                                                  fontSize:
                                                      Dimensions.fontSizeDefault +
                                                          2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Row(
                                    children: [
                                      Card(
                                          elevation: 0,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.radiusDefault)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.money_dollar,
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: AppLayout.getWidth(3),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppString.text_$30,
                                            style: AppStyle.mid_large_text
                                                .copyWith(
                                                    color: AppColor
                                                        .normalTextColor
                                                        .withOpacity(0.7),
                                                    fontSize: Dimensions
                                                            .fontSizeDefault +
                                                        2,
                                                    fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppLayout.getWidth(12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 23,
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: AppColor.disableColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppString.text_11_jan_2023,
                                                style: AppStyle.mid_large_text
                                                    .copyWith(
                                                  color: AppColor.hintColor,
                                                  fontSize:
                                                      Dimensions.fontSizeDefault +
                                                          2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Row(
                                    children: [
                                      Card(
                                          elevation: 0,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  Dimensions.radiusDefault)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.money_dollar,
                                                color: AppColor.primaryColor
                                                    .withOpacity(0.8),
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        width: AppLayout.getWidth(3),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppString.text_$30,
                                            style: AppStyle.mid_large_text
                                                .copyWith(
                                                    color: AppColor
                                                        .normalTextColor
                                                        .withOpacity(0.7),
                                                    fontSize: Dimensions
                                                            .fontSizeDefault +
                                                        2,
                                                    fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: AppLayout.getWidth(12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
