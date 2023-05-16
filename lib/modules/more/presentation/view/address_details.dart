import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_address.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/custom_appbar.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../controller/deleted_address_controller.dart';
import '../widget/add_ current_address.dart';

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
                              controller.addressDetailsModel.data!.isNotEmpty
                                  ? controller
                                          .addressDetailsModel.data!.first.key!
                                          .startsWith(
                                              AppString.text_permanent_address) 	|| controller
                                  .addressDetailsModel.data!.last.key!
                                  .endsWith(
                                  AppString.text_permanent_address)
                                      ? _editDetBtn(
                                          context: context,
                                          onAction: () => Get.find<DeletedAddController>()
                                              .deletedAddressApi(
                                                  addressType: controller
                                                      .addressDetailsModel
                                                      .data
                                                      ?.first
                                                      .key),
                                          editAction: EditAddress(
                                              AppString.text_permanent_address),
                                        )
                                      : _addButton(onAction: () {
                                          customButtomSheet(
                                              context: context,
                                              height: 0.9,
                                              child: EditAddress(AppString
                                                  .text_permanent_address));
                                        })
                                  : _addButton(onAction: () {
                                      customButtomSheet(
                                          context: context,
                                          height: 0.9,
                                          child: EditAddress(AppString
                                              .text_permanent_address));
                                    }),
                            ],
                          ),


                          controller.addressDetailsModel.data!.isNotEmpty
                              ? controller.addressDetailsModel.data!.first.key!
                                      .startsWith(
                                          AppString.text_permanent_address)|| controller
                              .addressDetailsModel.data!.last.key!
                              .endsWith(
                              AppString.text_permanent_address)
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
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_area),
                                                    _textSubTitle(
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
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_state),
                                                    _textSubTitle(
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
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_county),
                                                    _textSubTitle(
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
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_city),
                                                    _textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.first
                                                                .value
                                                                ?.city ??
                                                            ""),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_zip_code),
                                                    _textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.first
                                                                .value
                                                                ?.zipCode ??
                                                            ""),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_phone),
                                                    _textSubTitle(
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
                              controller.addressDetailsModel.data!.isNotEmpty
                                  ? controller
                                          .addressDetailsModel.data!.last.key!
                                          .startsWith(
                                              AppString.text_present_address)|| controller
                                  .addressDetailsModel.data!.first.key!
                                  .endsWith(
                                  AppString.text_present_address)
                                      ? _editDetBtn(
                                          context: context,
                                          onAction: () => Get.find<DeletedAddController>()
                                              .deletedAddressApi(
                                                  addressType: AppString.text_present_address

                                          ),
                                          editAction: AddCurrentAddress(
                                              typeKey: AppString
                                                  .text_present_address),
                                        )
                                      : _addButton(onAction: () {
                                          customButtomSheet(
                                              context: context,
                                              height: 0.9,
                                              child: AddCurrentAddress(
                                                  typeKey: AppString
                                                      .text_present_address));
                                        })
                                  : _addButton(onAction: () {
                                      customButtomSheet(
                                          context: context,
                                          height: 0.9,
                                          child: AddCurrentAddress(
                                              typeKey: AppString
                                                  .text_present_address));
                                    }),
                            ],
                          ),
                          controller.addressDetailsModel.data!.isNotEmpty
                              ? controller.addressDetailsModel.data!.last.key!
                                      .startsWith(
                                          AppString.text_present_address)|| controller
                              .addressDetailsModel.data!.first.key!
                              .endsWith(
                              AppString.text_present_address)
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
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_area),
                                                    _textSubTitle(
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
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_state),
                                                    _textSubTitle(
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
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_county),
                                                    _textSubTitle(
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
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_city),
                                                    _textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.last
                                                                .value
                                                                ?.city ??
                                                            ""),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_zip_code),
                                                    _textSubTitle(
                                                        subTitleText: controller
                                                                .addressDetailsModel
                                                                .data
                                                                ?.last
                                                                .value
                                                                ?.zipCode ??
                                                            ""),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_phone),
                                                    _textSubTitle(
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

Widget _textTitle({titleText}) {
  return Text(
    titleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.hintColor.withOpacity(0.7),
        fontSize: Dimensions.fontSizeDefault + 1,
        fontWeight: FontWeight.w500),
  );
}

Widget _textSubTitle({subTitleText}) {
  return Text(
    subTitleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor,
        fontSize: Dimensions.fontSizeDefault + 1,
        fontWeight: FontWeight.w500),
  );
}

Widget _addButton({onAction}) {
  return Row(
    children: [
      TextButton(
          onPressed: () => onAction(),
          child: Text(
            AppString.text_add,
            style: AppStyle.mid_large_text.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeDefault),
          )),
      Icon(
        Icons.add,
        color: AppColor.primaryColor,
        size: Dimensions.fontSizeDefault + 8,
      )
    ],
  );
}

Widget _editDetBtn({context, onAction, required editAction}) {
  return InkWell(
    onTap: () =>
        customButtomSheet(context: context, height: 0.9, child: editAction),
    child: Row(
      children: [
        editIcon(),
        SizedBox(
          width: AppLayout.getWidth(14),
        ),
        InkWell(
          onTap: () => onAction(),
          child: const Icon(
            CupertinoIcons.delete,
            color: AppColor.hintColor,
            size: 20,
          ),
        ),
      ],
    ),
  );
}

Widget editIcon() {
  return SizedBox(
      height: AppLayout.getHeight(20),
      width: AppLayout.getWidth(20),
      child: Image(image: AssetImage(Images.edit)));
}

Widget perTitleText(){
  return  Text(
    "${AppString.text_permanent}${AppString.text_address}",
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor,
        fontWeight: FontWeight.bold),
  );
}
Widget currTitleText(){
  return  Text(
    AppString.text_current_address,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor,
        fontWeight: FontWeight.bold),
  );
}