import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/controller/payrun_badge_controller.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class PayRunBadgeView extends GetView<PayrunBadgeController> {
  PayRunBadgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardTitle(
              icon: Images.file, titleText: AppString.text_payrun_details),
          Padding(
            padding: EdgeInsets.only(
                left: AppLayout.getWidth(56), top: AppLayout.getHeight(8)),
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
                        subTextRight: controller
                                    .payrunBadgeModel.data?.payrunSetting !=
                                null
                            ? controller.payrunBadgeModel.data?.payrunSetting
                                    ?.payrunPeriod
                                    .toString() ??
                                ""
                            : controller.payrunBadgeModel.data?.defaultPayrun
                                    ?.setting?.payrunPeriod
                                    .toString() ??
                                ""),
                    _subTextRight(
                        subTextRight: controller
                                    .payrunBadgeModel.data?.payrunSetting !=
                                null
                            ? controller.payrunBadgeModel.data?.payrunSetting
                                    ?.considerType
                                    .toString() ??
                                ""
                            : controller.payrunBadgeModel.data?.defaultPayrun
                                    ?.setting?.considerType
                                    .toString() ??
                                ""),
                    _subTextRight(
                        subTextRight:
                            controller.payrunBadgeModel.data?.payrunSetting !=
                                    null
                                ? controller.payrunBadgeModel.data
                                            ?.payrunSetting?.considerOvertime
                                            .toString() ==
                                        "0"
                                    ? AppString.text_no_included
                                    : AppString.text_included
                                : controller
                                            .payrunBadgeModel
                                            .data
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
          controller.allowance.isNotEmpty
              ? _cardTitle(
                  icon: Images.allowance, titleText: AppString.text_allowances)
              : Container(),
          ListView.builder(
            itemCount: controller.allowance.length,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.allowance.isNotEmpty
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 56.0, top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _subTextLeft(
                                          subTitleText: controller
                                                  .payrunBadgeModel
                                                  .data
                                                  ?.defaultPayrun
                                                  ?.beneficiaries?[index]
                                                  .beneficiary
                                                  ?.name ??
                                              ""),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _subTextRightBtn(
                                          subTextRight: controller
                                                  .payrunBadgeModel
                                                  .data
                                                  ?.defaultPayrun
                                                  ?.beneficiaries?[index]
                                                  .amount
                                                  .toString() ??
                                              "",
                                          isPercentage: controller
                                              .payrunBadgeModel
                                              .data
                                              ?.defaultPayrun
                                              ?.beneficiaries?[index]
                                              .isPercentage
                                              ?.toInt()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            _cardTitle(
                                icon: Images.deduction,
                                titleText: AppString.text_deductions),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 56.0, top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _subTextLeft(
                                          subTitleText: controller
                                                  .payrunBadgeModel
                                                  .data
                                                  ?.defaultPayrun
                                                  ?.beneficiaries?[index]
                                                  .beneficiary
                                                  ?.name ??
                                              ""),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _subTextRightBtn(
                                          subTextRight: controller
                                                  .payrunBadgeModel
                                                  .data
                                                  ?.defaultPayrun
                                                  ?.beneficiaries?[index]
                                                  .amount
                                                  .toString() ??
                                              "",
                                          isPercentage: controller
                                              .payrunBadgeModel
                                              .data
                                              ?.defaultPayrun
                                              ?.beneficiaries?[index]
                                              .isPercentage
                                              ?.toInt()),
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
          controller.deduction.isNotEmpty
              ? _cardTitle(
                  icon: Images.deduction, titleText: AppString.text_deductions)
              : Container(),
          ListView.builder(
            itemCount: controller.deduction.length,
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 56.0, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _subTextLeft(
                                    subTitleText: controller
                                            .payrunBadgeModel
                                            .data
                                            ?.defaultPayrun
                                            ?.beneficiaries?[index]
                                            .beneficiary
                                            ?.name ??
                                        ""),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _subTextRightBtn(
                                    subTextRight: controller
                                            .payrunBadgeModel
                                            .data
                                            ?.defaultPayrun
                                            ?.beneficiaries?[index]
                                            .amount
                                            .toString() ??
                                        "",
                                    isPercentage: controller
                                        .payrunBadgeModel
                                        .data
                                        ?.defaultPayrun
                                        ?.beneficiaries?[index]
                                        .isPercentage
                                        ?.toInt()),
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SvgPicture.asset(
                icon.toString(),
                width: AppLayout.getWidth(20),
                height: AppLayout.getWidth(20),
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

Widget _subTextRight({required subTextRight}) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
    child: Text(
      subTextRight,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.normalTextColor.withOpacity(0.9),
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    ),
  );
}

Widget _subTextRightBtn({required subTextRight, required isPercentage}) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
    child: Row(
      children: [
        Text(
          isPercentage.toString() == "0"
              ? Get.find<SettingController>()
                      .basicInfo
                      ?.data
                      .currencySymbol
                      .toString() ??
                  ""
              : "",
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor.withOpacity(0.9),
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w500),
        ),
        customSpacerWidth(width: 4),
        Text(
          subTextRight,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.normalTextColor.withOpacity(0.9),
              fontSize: Dimensions.fontSizeDefault,
              fontWeight: FontWeight.w500),
        ),
        customSpacerWidth(width: 4),
        Text(isPercentage.toString() == "1" ? "%" : "",  style: AppStyle.mid_large_text.copyWith(
            color: AppColor.normalTextColor.withOpacity(0.9),
            fontSize: Dimensions.fontSizeDefault,
            fontWeight: FontWeight.w500)),
      ],
    ),
  );
}

Widget _subTextLeft({required subTitleText}) {
  return Padding(
    padding: EdgeInsets.only(bottom: AppLayout.getHeight(8)),
    child: Text(
      subTitleText,
      style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontSize: Dimensions.fontSizeDefault,
          fontWeight: FontWeight.w500),
    ),
  );
}
