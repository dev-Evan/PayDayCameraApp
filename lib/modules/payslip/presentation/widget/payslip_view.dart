import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class PaySlipView extends StatelessWidget {
  const PaySlipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bottomSheetAppbar(
              appbarTitle: AppString.text_payslip, context: context),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(Images.user),
                          radius: 28,
                        ),
                        SizedBox(
                          width: AppLayout.getWidth(16),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppString.text_user_name,
                              style: AppStyle.mid_large_text.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColor.normalTextColor,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            Text(
                              AppString.text_user_email,
                              style: AppStyle.small_text
                                  .copyWith(color: AppColor.hintColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppLayout.getHeight(12),
                        ),
                        Text(
                          AppString.text_create_at,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.hintColor.withOpacity(0.7),
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          AppString.text_01_jan_1998,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.normalTextColor.withOpacity(0.7),
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(16),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppLayout.getHeight(12),
                        ),
                        Text(
                          AppString.text_payslip_for,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.hintColor.withOpacity(0.7),
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          AppString.text_01_jan_1998 +
                              '-' +
                              AppString.text_01_jan_1998,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.normalTextColor.withOpacity(0.7),
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(16),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(AppString.text_basic_salary,
                    style: AppStyle.mid_large_text.copyWith(
                        color: AppColor.normalTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSizeDefault + 2)),
                SizedBox(
                  height: AppLayout.getHeight(12),
                ),
                Container(
                  decoration: AppStyle.ContainerStyle.copyWith(
                      color: AppColor.disableColor.withOpacity(0.6),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault - 6)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_allowances,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          AppString.text_total,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.text_bonus + AppString.text_percent,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                          Text(
                            AppString.text_medical + AppString.text_percent,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                          Text(
                            AppString.text_food_ + AppString.text_percent,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                          Text(
                            AppString.text_transport + AppString.text_percent,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(12),
                          ),
                          Text(
                            AppString.text_$30,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                          Text(
                            AppString.text_$30,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                          Text(
                            AppString.text_$30,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                          Text(
                            AppString.text_$30,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: AppStyle.ContainerStyle.copyWith(
                      color: AppColor.disableColor.withOpacity(0.6),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault - 6)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.text_deductions,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          AppString.text_total,
                          style: AppStyle.mid_large_text.copyWith(
                              color: AppColor.hintColor,
                              fontSize: Dimensions.fontSizeDefault,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.text_tax + AppString.text_percent,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(8),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '-' + AppString.text_$30,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                SizedBox(
                  height: AppLayout.getHeight(8),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.text_total,
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        AppString.text_$30,
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.text_total_summary,
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.text_basic_salary,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                          Text(
                            AppString.text_beneficiary,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.text_$30,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                          Text(
                            AppString.text_$30,
                            style: AppStyle.mid_large_text.copyWith(
                                color:
                                    AppColor.normalTextColor.withOpacity(0.9),
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.text_total,
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeDefault + 2,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        AppString.text_$30,
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeDefault + 2,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton(AppString.text_download_payslip, () {}),
          ),
          SizedBox(
            height: AppLayout.getHeight(20),
          )
        ],
      ),
    );
  }
}
