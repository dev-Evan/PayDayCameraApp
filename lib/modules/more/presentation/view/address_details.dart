import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/deleted_address_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_%20current_address.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/address_details_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_address.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class AddressDetails extends GetView<AddressDetailsController> {
  AddressDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx(
          (state) => SingleChildScrollView(
                child: Column(
                  children: [
                    customMoreAppbar(titleText: AppString.text_address_details),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              perTitleText(),


                              (controller.addressDetailsModel.data != null &&
                                      controller
                                          .addressDetailsModel.data!.isNotEmpty)
                                  ? controller.addressDetailsModel.data?.first
                                                  .key ==
                                              AppString
                                                  .text_permanent_address ||
                                          controller.addressDetailsModel.data
                                                  ?.last.key ==
                                              AppString.text_permanent_address
                                      ? editDetBtn(
                                          context: context,
                                          onAction: () =>
                                              Get.find<DeletedAddController>()
                                                  .deletedAddressApi(
                                                      addressType: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key),
                                          editAction: EditAddress(
                                              AppString.text_permanent_address),
                                        )
                                      : addButton(onAction: () {
                                          customButtomSheet(
                                              context: context,
                                              height: 0.9,
                                              child: EditAddress(AppString
                                                  .text_permanent_address));
                                        })
                                  : addButton(onAction: () {
                                      customButtomSheet(
                                          context: context,
                                          height: 0.9,
                                          child: EditAddress(AppString
                                              .text_permanent_address));
                                    }),
                            ],
                          ),
                          (controller.addressDetailsModel.data != null &&
                                  controller
                                      .addressDetailsModel.data!.isNotEmpty)
                              ? controller.addressDetailsModel.data?.first
                                              .key ==
                                          AppString.text_permanent_address ||
                                      controller.addressDetailsModel.data?.last
                                              .key ==
                                          AppString.text_permanent_address
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customSpacerHeight(height: 20),
                                        Text(
                                          AppString.text_details,
                                          style: AppStyle.mid_large_text
                                              .copyWith(
                                                  color: AppColor.hintColor
                                                      .withOpacity(0.9),
                                                  fontSize: Dimensions
                                                          .fontSizeDefault +
                                                      2,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        customSpacerHeight(height: 8),
                                        Text(
                                          controller.addressDetailsModel.data
                                                  ?.first.value?.details
                                                  .toString() ??
                                              "",
                                          style: AppStyle.mid_large_text
                                              .copyWith(
                                                  color: AppColor
                                                      .normalTextColor
                                                      ,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        customSpacerHeight(height: 12),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    customSpacerHeight(
                                                        height: 12),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_area),
                                                    textSubTitle(
                                                      subTitleText: controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.first
                                                              .value
                                                              ?.area ??
                                                          "",
                                                    ),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_state),
                                                    textSubTitle(
                                                      subTitleText: controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.first
                                                              .value
                                                              ?.state ??
                                                          "",
                                                    ),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_county),
                                                    textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.first
                                                                .value
                                                                ?.country ??
                                                            ""),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    customSpacerHeight(
                                                        height: 12),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_city),
                                                    textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.first
                                                                .value
                                                                ?.city ??
                                                            ""),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_zip_code),
                                                    textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.first
                                                                .value
                                                                ?.zipCode ??
                                                            ""),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_phone),
                                                    textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.first
                                                                .value
                                                                ?.phoneNumber ??
                                                            "")
                                                  ],
                                                ),
                                              ],
                                            ),
                                            customSpacerHeight(height: 24),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Container()
                              : Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              currTitleText(),
                              (controller.addressDetailsModel.data != null &&
                                      controller
                                          .addressDetailsModel.data!.isNotEmpty)
                                  ? controller.addressDetailsModel.data?.last
                                                  .key ==
                                              AppString.text_present_address ||
                                          controller.addressDetailsModel.data
                                                  ?.first.key ==
                                              AppString.text_present_address
                                      ? editDetBtn(
                                          context: context,
                                          onAction: () => Get.find<
                                                  DeletedAddController>()
                                              .deletedAddressApi(
                                                  addressType: AppString
                                                      .text_present_address),
                                          editAction: AddCurrentAddress(
                                              typeKey: AppString
                                                  .text_present_address),
                                        )
                                      : addButton(onAction: () {
                                          customButtomSheet(
                                              context: context,
                                              height: 0.9,
                                              child: AddCurrentAddress(
                                                  typeKey: AppString
                                                      .text_present_address));
                                        })
                                  : addButton(onAction: () {
                                      customButtomSheet(
                                          context: context,
                                          height: 0.9,
                                          child: AddCurrentAddress(
                                              typeKey: AppString
                                                  .text_present_address));
                                    }),
                            ],
                          ),
                          (controller.addressDetailsModel.data != null &&
                                  controller
                                      .addressDetailsModel.data!.isNotEmpty)
                              ? controller.addressDetailsModel.data?.last.key ==
                                          AppString.text_present_address ||
                                      controller.addressDetailsModel.data?.first
                                              .key ==
                                          AppString.text_present_address
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customSpacerHeight(height: 20),
                                        Text(
                                          AppString.text_details,
                                          style: AppStyle.mid_large_text
                                              .copyWith(
                                                  color: AppColor.hintColor
                                                      .withOpacity(0.7),
                                                  fontSize: Dimensions
                                                          .fontSizeDefault -
                                                      2,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        customSpacerHeight(height: 8),
                                        Text(
                                          controller.addressDetailsModel.data
                                                  ?.last.value?.details
                                                  .toString() ??
                                              "",
                                          style: AppStyle.mid_large_text
                                              .copyWith(
                                                  color: AppColor
                                                      .normalTextColor
                                                      .withOpacity(0.7),
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        customSpacerHeight(height: 12),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    customSpacerHeight(
                                                        height: 12),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_area),
                                                    textSubTitle(
                                                      subTitleText: controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.last
                                                              .value
                                                              ?.area ??
                                                          "",
                                                    ),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_state),
                                                    textSubTitle(
                                                      subTitleText: controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.last
                                                              .value
                                                              ?.state ??
                                                          "",
                                                    ),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_county),
                                                    textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.last
                                                                .value
                                                                ?.country ??
                                                            ""),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    customSpacerHeight(
                                                        height: 12),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_city),
                                                    textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.last
                                                                .value
                                                                ?.city ??
                                                            ""),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_zip_code),
                                                    textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.last
                                                                .value
                                                                ?.zipCode ??
                                                            ""),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    textTitle(
                                                        titleText: AppString
                                                            .text_phone),
                                                    textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.last
                                                                .value
                                                                ?.phoneNumber ??
                                                            "")
                                                  ],
                                                ),
                                              ],
                                            ),
                                            customSpacerHeight(height: 24),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Container()
                              : Container()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          onLoading: const LoadingIndicator()),
    );
  }
}
