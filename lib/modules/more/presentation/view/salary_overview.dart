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
                          _salaryOvrDotted(),
                          Positioned(
                            left: 23,
                            top: -0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _salaryCardTitleView(
                                    titleText: AppString.text_salary_increment,
                                    dotIconColor: AppColor.primaryColor),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                _salaryCardView(
                                    icon: CupertinoIcons.money_dollar,
                                    salaryText: AppString.text_$30),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 23,
                            top: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _salaryCardTitleView(
                                  titleText: AppString.text_11_jan_2023,
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                _salaryCardView(
                                    icon: CupertinoIcons.money_dollar,
                                    salaryText: AppString.text_$30),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 23,
                            top: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _salaryCardTitleView(
                                  titleText: AppString.text_11_jan_2023,
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                _salaryCardView(
                                    icon: CupertinoIcons.money_dollar,
                                    salaryText: AppString.text_$30),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 23,
                            top: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _salaryCardTitleView(
                                  titleText: AppString.text_11_jan_2023,
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                _salaryCardView(
                                    icon: CupertinoIcons.money_dollar,
                                    salaryText: AppString.text_$30),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 23,
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _salaryCardTitleView(
                                  titleText: AppString.text_11_jan_2023,
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                                _salaryCardView(
                                    icon: CupertinoIcons.money_dollar,
                                    salaryText: AppString.text_$30),
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

Widget _salaryCardView({icon, salaryText}) {
  return Padding(
    padding: const EdgeInsets.only(left: 14.0),
    child: Row(
      children: [
        Card(
            elevation: 0,
            color: AppColor.primaryColor.withOpacity(0.1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Center(
                child: Icon(
                  icon,
                  color: AppColor.primaryColor.withOpacity(0.8),
                ),
              ),
            )),
        SizedBox(
          width: AppLayout.getWidth(3),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              salaryText,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.normalTextColor.withOpacity(0.7),
                  fontSize: Dimensions.fontSizeDefault + 2,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
        SizedBox(
          width: AppLayout.getWidth(12),
        ),
      ],
    ),
  );
}

Widget _salaryOvrDotted() {
  return Padding(
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
  );
}

Widget _salaryCardTitleView(
    {titleText, Color dotIconColor = AppColor.disableColor}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.circle,
        size: 10,
        color: dotIconColor,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleText(titleTextS: titleText)
          ],
        ),
      ),
    ],
  );
}

Widget _titleText({titleTextS}){
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titleTextS,
        style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontSize: Dimensions.fontSizeDefault + 2,
        ),
      ),
    ],
  );
}