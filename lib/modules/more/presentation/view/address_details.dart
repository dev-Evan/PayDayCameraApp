import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/deleted_address_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_address.dart';
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
                                              "permanent_address" ||
                                          controller.addressDetailsModel.data
                                                  ?.last.key ==
                                              "present_address"
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
                                          editAction:
                                              EditAddress("permanent_address"),
                                          type: "permanent_address")
                                      : addButton(onAction: () {
                                          customButtonSheet(
                                              context: context,
                                              height: 0.9,
                                              child: AddAddress(
                                                  "permanent_address"));
                                        })
                                  : addButton(onAction: () {
                                      customButtonSheet(
                                          context: context,
                                          height: 0.9,
                                          child:
                                              AddAddress("permanent_address"));
                                    }),
                            ],
                          ),
                          (controller.addressDetailsModel.data != null &&
                                  controller
                                      .addressDetailsModel.data!.isNotEmpty)
                              ? controller.addressDetailsModel.data?.first
                                          .key ==
                                      "permanent_address"
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
                                                      ?.first.key ==
                                                  "permanent_address"
                                              ? controller
                                                      .addressDetailsModel
                                                      .data
                                                      ?.first
                                                      .value
                                                      ?.details
                                                      .toString() ??
                                                  ""
                                              : "",
                                          style: AppStyle.mid_large_text
                                              .copyWith(
                                                  color:
                                                      AppColor.normalTextColor,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        customSpacerHeight(height: 12),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            detailsTextLayout(
                                              leftTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.first
                                                              .value
                                                              ?.area !=
                                                          null
                                                      ? AppString.text_area
                                                      : ""
                                                  : "",
                                              rightTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.first
                                                              .value
                                                              ?.city !=
                                                          null
                                                      ? AppString.text_city
                                                      : ""
                                                  : "",
                                              leftSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .value
                                                          ?.area
                                                          .toString() ??
                                                      ""
                                                  : "",
                                              rightSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .value
                                                          ?.city
                                                          .toString() ??
                                                      ""
                                                  : "",
                                            ),
                                            detailsTextLayout(
                                              leftTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.first
                                                              .value
                                                              ?.state !=
                                                          null
                                                      ? AppString.text_state
                                                      : ""
                                                  : "",
                                              rightTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.first
                                                              .value
                                                              ?.zipCode !=
                                                          null
                                                      ? AppString.text_zip_code
                                                      : ""
                                                  : "",
                                              leftSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .value
                                                          ?.state
                                                          .toString() ??
                                                      ""
                                                  : "",
                                              rightSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .value
                                                          ?.zipCode
                                                          .toString() ??
                                                      ""
                                                  : "",
                                            ),
                                            detailsTextLayout(
                                              leftTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.first
                                                              .value
                                                              ?.country !=
                                                          null
                                                      ? AppString.text_county
                                                      : ""
                                                  : "",
                                              rightTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.first
                                                              .value
                                                              ?.phoneNumber !=
                                                          null
                                                      ? AppString.text_phone
                                                      : ""
                                                  : "",
                                              leftSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .value
                                                          ?.country
                                                          .toString() ??
                                                      ""
                                                  : "",
                                              rightSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .key ==
                                                      "permanent_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.first
                                                          .value
                                                          ?.phoneNumber
                                                          .toString() ??
                                                      ""
                                                  : "",
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
                                  ? controller.addressDetailsModel.data?.first
                                                  .key ==
                                              "permanent_address" ||
                                          controller.addressDetailsModel.data
                                                  ?.last.key ==
                                              "present_address"
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
                                          editAction:
                                              EditAddress("permanent_address"),
                                          type: "permanent_address")
                                      : addButton(onAction: () {
                                          customButtonSheet(
                                              context: context,
                                              height: 0.9,
                                              child: AddAddress(
                                                  "permanent_address"));
                                        })
                                  : addButton(onAction: () {
                                      (controller.addressDetailsModel.data !=
                                                  null &&
                                              controller.addressDetailsModel
                                                  .data!.isNotEmpty)
                                          ? controller.addressDetailsModel.data
                                                      ?.first.key ==
                                                  "permanent_address".isNotEmpty
                                              ? customButtonSheet(
                                                  context: context,
                                                  height: 0.9,
                                                  child: AddAddress(
                                                      "permanent_address"))
                                              : showCustomSnackBar(
                                                  message: AppString
                                                      .please_add_permanent_address,
                                                  )
                                          : showCustomSnackBar(
                                              message: AppString
                                                  .please_add_permanent_address,
                                              );
                                    }),
                            ],
                          ),
                          (controller.addressDetailsModel.data != null &&
                                  controller
                                      .addressDetailsModel.data!.isNotEmpty)
                              ? controller.addressDetailsModel.data?.last.key ==
                                      "present_address"
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
                                                      ?.last.key ==
                                                  "present_address"
                                              ? controller.addressDetailsModel
                                                      .data?.last.value?.details
                                                      .toString() ??
                                                  ""
                                              : "",
                                          style: AppStyle.mid_large_text
                                              .copyWith(
                                                  color:
                                                      AppColor.normalTextColor,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        customSpacerHeight(height: 12),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            detailsTextLayout(
                                              leftTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.last
                                                              .value
                                                              ?.area !=
                                                          null
                                                      ? AppString.text_area
                                                      : ""
                                                  : "",
                                              rightTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.last
                                                              .value
                                                              ?.city !=
                                                          null
                                                      ? AppString.text_city
                                                      : ""
                                                  : "",
                                              leftSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .value
                                                          ?.area
                                                          .toString() ??
                                                      ""
                                                  : "",
                                              rightSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .value
                                                          ?.city
                                                          .toString() ??
                                                      ""
                                                  : "",
                                            ),
                                            detailsTextLayout(
                                              leftTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.last
                                                              .value
                                                              ?.state !=
                                                          null
                                                      ? AppString.text_state
                                                      : ""
                                                  : "",
                                              rightTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.last
                                                              .value
                                                              ?.zipCode !=
                                                          null
                                                      ? AppString.text_zip_code
                                                      : ""
                                                  : "",
                                              leftSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .value
                                                          ?.state
                                                          .toString() ??
                                                      ""
                                                  : "",
                                              rightSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .value
                                                          ?.zipCode
                                                          .toString() ??
                                                      ""
                                                  : "",
                                            ),
                                            detailsTextLayout(
                                              leftTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.last
                                                              .value
                                                              ?.country !=
                                                          null
                                                      ? AppString.text_county
                                                      : ""
                                                  : "",
                                              rightTitleText: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                              .addressDetailsModel
                                                              .data
                                                              ?.last
                                                              .value
                                                              ?.phoneNumber !=
                                                          null
                                                      ? AppString.text_phone
                                                      : ""
                                                  : "",
                                              leftSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .value
                                                          ?.country
                                                          .toString() ??
                                                      ""
                                                  : "",
                                              rightSubtext: controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .key ==
                                                      "present_address"
                                                  ? controller
                                                          .addressDetailsModel
                                                          .data
                                                          ?.last
                                                          .value
                                                          ?.phoneNumber
                                                          .toString() ??
                                                      ""
                                                  : "",
                                            ),
                                            customSpacerHeight(height: 24),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Container()
                              : Container(),
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
