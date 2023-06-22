import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_address.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/address_details_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_address.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../controller/address_controller.dart';

class AddressDetails extends GetView<AddressController> {
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
                              controller.addressDetailsModel.data
                                          ?.permanentAddress !=
                                      null
                                  ? editDetBtn(
                                      context: context,
                                      onAction: () => _deletedAlert(
                                            context: context,
                                            onAction: () =>
                                                Get.find<AddressController>()
                                                    .deletedAddressApi(
                                                        addressType:
                                                            "permanent_address",
                                                        context: context),
                                          ),
                                      editAction:
                                          EditAddress("permanent_address"),
                                      type: "permanent_address")
                                  : addButton(onAction: () {
                                      customButtonSheet(
                                          context: context,
                                          height: 0.9,
                                          child:
                                              AddAddress("permanent_address"));
                                    })
                            ],
                          ),
                          (controller.addressDetailsModel.data != null)
                              ? controller.addressDetailsModel.data
                                          ?.permanentAddress !=
                                      null
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
                                                  ?.permanentAddress?.details
                                                  .toString() ??
                                              "",
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
                                              leftTitleText:
                                                  AppString.text_area,
                                              rightTitleText:
                                                  AppString.text_city,
                                              leftSubtext: controller
                                                      .addressDetailsModel
                                                      .data
                                                      ?.permanentAddress
                                                      ?.area
                                                      .toString() ??
                                                  "",
                                              rightSubtext: controller
                                                      .addressDetailsModel
                                                      .data
                                                      ?.permanentAddress
                                                      ?.city
                                                      .toString() ??
                                                  "",
                                            ),
                                            detailsTextLayout(
                                              leftTitleText:
                                                  AppString.text_state,
                                              rightTitleText:
                                                  AppString.text_zip_code,
                                              leftSubtext: controller
                                                      .addressDetailsModel
                                                      .data
                                                      ?.permanentAddress
                                                      ?.state
                                                      .toString() ??
                                                  "",
                                              rightSubtext: controller
                                                      .addressDetailsModel
                                                      .data
                                                      ?.permanentAddress
                                                      ?.zipCode
                                                      .toString() ??
                                                  "",
                                            ),
                                            detailsTextLayout(
                                              leftTitleText:
                                                  AppString.text_county,
                                              rightTitleText:
                                                  AppString.text_phone,
                                              leftSubtext: controller
                                                      .addressDetailsModel
                                                      .data
                                                      ?.permanentAddress
                                                      ?.country
                                                      .toString() ??
                                                  "",
                                              rightSubtext: controller
                                                      .addressDetailsModel
                                                      .data
                                                      ?.permanentAddress
                                                      ?.phoneNumber
                                                      .toString() ??
                                                  "",
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
                              controller.addressDetailsModel.data
                                          ?.presentAddress !=
                                      null
                                  ? editDetBtn(
                                      context: context,
                                      onAction: () => _deletedAlert(
                                            context: context,
                                            onAction: () =>
                                                Get.find<AddressController>()
                                                    .deletedAddressApi(
                                                        addressType:
                                                            "present_address",
                                                        context: context),
                                          ),
                                      editAction:
                                          EditAddress("present_address"),
                                      type: "present_address")
                                  : addButton(onAction: () {
                                      customButtonSheet(
                                          context: context,
                                          height: 0.9,
                                          child: AddAddress("present_address"));
                                    })
                            ],
                          ),
                          controller.addressDetailsModel.data?.presentAddress !=
                                  null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customSpacerHeight(height: 20),
                                    Text(
                                      AppString.text_details,
                                      style: AppStyle.mid_large_text.copyWith(
                                          color: AppColor.hintColor
                                              .withOpacity(0.9),
                                          fontSize:
                                              Dimensions.fontSizeDefault + 2,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    customSpacerHeight(height: 8),
                                    Text(
                                      controller.addressDetailsModel.data
                                              ?.presentAddress?.details
                                              .toString() ??
                                          "",
                                      style: AppStyle.mid_large_text.copyWith(
                                          color: AppColor.normalTextColor,
                                          fontSize: Dimensions.fontSizeDefault,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    customSpacerHeight(height: 12),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        detailsTextLayout(
                                          leftTitleText: AppString.text_area,
                                          rightTitleText: AppString.text_city,
                                          leftSubtext: controller
                                                  .addressDetailsModel
                                                  .data
                                                  ?.presentAddress
                                                  ?.area
                                                  .toString() ??
                                              "",
                                          rightSubtext: controller
                                                  .addressDetailsModel
                                                  .data
                                                  ?.presentAddress
                                                  ?.city
                                                  .toString() ??
                                              "",
                                        ),
                                        detailsTextLayout(
                                          leftTitleText: AppString.text_state,
                                          rightTitleText:
                                              AppString.text_zip_code,
                                          leftSubtext: controller
                                                  .addressDetailsModel
                                                  .data
                                                  ?.presentAddress
                                                  ?.state
                                                  .toString() ??
                                              "",
                                          rightSubtext: controller
                                                  .addressDetailsModel
                                                  .data
                                                  ?.presentAddress
                                                  ?.zipCode
                                                  .toString() ??
                                              "",
                                        ),
                                        detailsTextLayout(
                                          leftTitleText: AppString.text_county,
                                          rightTitleText: AppString.text_phone,
                                          leftSubtext: controller
                                                  .addressDetailsModel
                                                  .data
                                                  ?.presentAddress
                                                  ?.country
                                                  .toString() ??
                                              "",
                                          rightSubtext: controller
                                                  .addressDetailsModel
                                                  .data
                                                  ?.presentAddress
                                                  ?.phoneNumber
                                                  .toString() ??
                                              "",
                                        ),
                                        customSpacerHeight(height: 24),
                                      ],
                                    ),
                                  ],
                                )
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

Future _deletedAlert({required context, onAction}) {
  return CustomAlertDialog(
      context: context,
      icon: CupertinoIcons.delete,
      backAction: () {
        Navigator.pop(context);
      },
      iconBgColor: Colors.orange.shade50,
      yesAction: () => onAction());
}
