import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payrun_badge_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class PayRunBadgeView extends StatelessWidget {
  PayRunBadgeView({Key? key}) : super(key: key);

  PayrunBadgeController payrunBadgeController =
      Get.put(PayrunBadgeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _cardTitle(
              icon: Icons.description_outlined,
              titleText: AppString.text_payrun_details),
          Padding(
            padding: const EdgeInsets.only(left: 56.0, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subTextLeft(subTitleText: AppString.text_period),
                    _subTextLeft(subTitleText: AppString.text_consider_type),
                    _subTextLeft(subTitleText: AppString.text_overtime),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subTextRight(
                        subTextRight: payrunBadgeController.payrunBadgeModel
                                ?.data?.defaultPayrun?.setting?.payrunPeriod
                                .toString() ??
                            ""),
                    _subTextRight(
                        subTextRight: payrunBadgeController.payrunBadgeModel
                                ?.data?.defaultPayrun?.setting?.considerType
                                .toString() ??
                            ""),
                    _subTextRight(
                        subTextRight: payrunBadgeController
                                    .payrunBadgeModel
                                    ?.data
                                    ?.defaultPayrun
                                    ?.setting
                                    ?.considerOvertime
                                    .toString() ==
                                "0"
                            ? AppString.text_no_included
                            : AppString.text_included)
                  ],
                ),
              ],
            ),
          ),

          _cardTitle(
              icon: Icons.more_time, titleText: AppString.text_allowances),


          _getCurrentDate()


          //_getCurrentDate()


      // ListView.builder(
          //   itemCount: payrunBadgeController
          //       .payrunBadgeModel
          //       ?.data
          //       ?.defaultPayrun
          //       ?.beneficiaries?.length,
          //   physics: const NeverScrollableScrollPhysics(),
          //   primary: false,
          //   shrinkWrap: true,
          //
          //   itemBuilder: (context, index) {
          //     return
          //       Column(
          //       children: [
          //
          //         // Padding(
          //         //   padding: const EdgeInsets.only(left: 56.0, top: 8),
          //         //   child: Row(
          //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         //     children: [
          //         //       Column(
          //         //         crossAxisAlignment: CrossAxisAlignment.start,
          //         //         children: [
          //         //           _subTextLeft(subTitleText: payrunBadgeController
          //         //               .payrunBadgeModel
          //         //               ?.data
          //         //               ?.defaultPayrun
          //         //               ?.beneficiaries?[index].beneficiary?.name ??""
          //         //
          //         //           ),
          //         //
          //         //         ],
          //         //       ),
          //         //       Column(
          //         //         crossAxisAlignment: CrossAxisAlignment.start,
          //         //         children: [
          //         //           _subTextRight(
          //         //               subTextRight:
          //         //               payrunBadgeController
          //         //                   .payrunBadgeModel
          //         //                   ?.data
          //         //                   ?.defaultPayrun
          //         //                   ?.beneficiaries?[index].amount .toString()    ??""),
          //         //         ],
          //         //       ),
          //         //     ],
          //         //   ),
          //         // ),
          //
          //         // payrunBadgeController
          //         //     .payrunBadgeModel
          //         //     ?.data
          //         //     ?.defaultPayrun
          //         //     ?.beneficiaries?[index].beneficiary?.type =="allowance"?
          //         //
          //         //
          //         //     Text("a"):Text("dfg"),
          //
          //       ],
          //     );
          //
          //
          //   },
          //
          //
          // ),


          // _cardTitle(
          //     icon: Icons.more_time, titleText: AppString.text_allowances),
          // Padding(
          //   padding: const EdgeInsets.only(left: 56.0, top: 8),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           _subTextLeft(subTitleText: AppString.text_period),
          //           _subTextLeft(subTitleText: AppString.text_period),
          //           _subTextLeft(subTitleText: AppString.text_period),
          //         ],
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           _subTextRight(
          //               subTextRight:
          //                   AppString.text_2 + AppString.text_percent),
          //           _subTextRight(
          //               subTextRight:
          //                   AppString.text_2 + AppString.text_percent),
          //           _subTextRight(
          //               subTextRight:
          //                   AppString.text_2 + AppString.text_percent),
          //           _subTextRight(
          //               subTextRight:
          //                   AppString.text_2 + AppString.text_percent),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // _cardTitle(icon: Icons.timelapse, titleText: AppString.text_duration),
          // Padding(
          //   padding: const EdgeInsets.only(left: 56.0, top: 8),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           _subTextLeft(subTitleText: AppString.text_period),
          //           _subTextLeft(subTitleText: AppString.text_period),
          //           _subTextLeft(subTitleText: AppString.text_period),
          //           customSpacerHeight(height: 12),
          //           _subTextLeft(subTitleText: AppString.text_tax),
          //         ],
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           _subTextRight(subTextRight: AppString.text_monthly),
          //           _subTextRight(subTextRight: AppString.text_monthly),
          //           _subTextRight(subTextRight: AppString.text_monthly),
          //           customSpacerHeight(height: 12),
          //           _subTextRight(
          //               subTextRight:
          //                   AppString.text_2 + AppString.text_percent),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

_getCurrentDate() {
  return Text(
    DateFormat.MMMMd().format(DateTime.now()),
    style: AppStyle.normal_text.copyWith(color: AppColor.normalTextColor),
  );
}


Widget _cardTitle({icon, titleText}) {
  return Row(
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
      customSpacerWidth(width: 12),
      Text(
        titleText,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.normalTextColor,
            fontSize: Dimensions.fontSizeDefault + 1,
            fontWeight: FontWeight.w700),
      )
    ],
  );
}

Widget _subTextRight({subTextRight}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      subTextRight,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor.withOpacity(0.9),
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    ),
  );
}

Widget _subTextLeft({subTitleText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Text(
      subTitleText,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    ),
  );
}
