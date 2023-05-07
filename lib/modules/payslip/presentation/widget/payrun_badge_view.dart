import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
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





          ListView.builder(
            itemCount: payrunBadgeController
                .payrunBadgeModel
                ?.data
                ?.defaultPayrun
                ?.beneficiaries?.length,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,

            itemBuilder: (context, index) {
              return
                Column(
                  children: [


                    payrunBadgeController
                        .payrunBadgeModel
                        ?.data
                        ?.defaultPayrun
                        ?.beneficiaries?[index].beneficiary?.type=="allowance"?Column(
                      children: [
                        _cardTitle(
                            icon: Icons.more_time, titleText: AppString.text_allowances),
                        Padding(
                          padding: const EdgeInsets.only(left: 56.0, top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _subTextLeft(subTitleText: payrunBadgeController
                                      .payrunBadgeModel
                                      ?.data
                                      ?.defaultPayrun
                                      ?.beneficiaries?[index].beneficiary?.name ??""

                                  ),

                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _subTextRightBtn(
                                      subTextRight:
                                      payrunBadgeController
                                          .payrunBadgeModel
                                          ?.data
                                          ?.defaultPayrun
                                          ?.beneficiaries?[index].amount .toString()    ??"",

                                      isPercentage: payrunBadgeController
                                          .payrunBadgeModel
                                          ?.data
                                          ?.defaultPayrun
                                          ?.beneficiaries?[index].isPercentage?.toInt()

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),





                      ],
                    )



                        :Column(
                      children: [
                        _cardTitle(icon: Icons.timelapse, titleText: AppString.text_deductions),
                        Padding(
                          padding: const EdgeInsets.only(left: 56.0, top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _subTextLeft(subTitleText: payrunBadgeController
                                      .payrunBadgeModel
                                      ?.data
                                      ?.defaultPayrun
                                      ?.beneficiaries?[index].beneficiary?.name ??""

                                  ),

                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _subTextRightBtn(
                                      subTextRight:
                                      payrunBadgeController
                                          .payrunBadgeModel
                                          ?.data
                                          ?.defaultPayrun
                                          ?.beneficiaries?[index].amount .toString()    ??"",


                                  isPercentage: payrunBadgeController
                                      .payrunBadgeModel
                                      ?.data
                                      ?.defaultPayrun
                                      ?.beneficiaries?[index].isPercentage?.toInt()


                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),



                  ],
                );


            },


          ),






        ],
      ),
    );
  }
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
Widget _subTextRightBtn({subTextRight,required isPercentage}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [

        Text(
          subTextRight,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor.withOpacity(0.9),
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w500),
        ),
        customSpacerWidth(width: 4),

        Text(isPercentage.toString() =="1"?"%":"tk"),

      ],
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
