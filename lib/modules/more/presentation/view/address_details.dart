import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/add_address.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_address.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../controller/deleted_address_controller.dart';
import '../widget/add_ current_address.dart';

class AddressDetails extends GetView<AddressDetailsController> {
  AddressDetails({Key? key}) : super(key: key);
  AddressDetailsController addressDetailsController =
      Get.put(AddressDetailsController());
  DeletedAddController deletedAddController = Get.put(DeletedAddController());

  @override
  Widget build(BuildContext context) {
    final _box = GetStorage();
    return controller.obx(
        (state) => Scaffold(
              appBar: const CustomAppbar(),
              body: SingleChildScrollView(
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
                              Text(
                                "${AppString.text_permanent}${AppString.text_address}",
                                style: AppStyle.mid_large_text.copyWith(
                                    color: AppColor.normalTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              addressDetailsController
                                      .addressDetailsModel!.data!.isNotEmpty
                                  ? _editDetBtn(
                                      context: context,
                                      onAction: () => deletedAddController
                                          .deletedAddressApi(
                                              addressType:
                                                  addressDetailsController
                                                      .addressDetailsModel
                                                      ?.data
                                                      ?.first
                                                      .key),
                                      editAction: const EditAddress(),

                                    )
                                  : _addButton(onAction: () {
                                      _box.write(AppString.STORE_ADDRESS,
                                          AppString.text_permanent_address);
                                      customButtomSheet(
                                          context: context,
                                          height: 0.9,
                                          child: const EditAddress());
                                    })
                            ],
                          ),
                          addressDetailsController
                                  .addressDetailsModel!.data!.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customSpacerHeight(height: 20),
                                    Text(
                                      AppString.text_details,
                                      style: AppStyle.mid_large_text.copyWith(
                                          color: AppColor.hintColor
                                              .withOpacity(0.7),
                                          fontSize:
                                              Dimensions.fontSizeDefault - 2,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    customSpacerHeight(height: 8),
                                    Text(
                                      addressDetailsController
                                              .addressDetailsModel
                                              ?.data
                                              ?.first
                                              .value
                                              ?.details
                                              .toString() ??
                                          "Demo",
                                      style: AppStyle.mid_large_text.copyWith(
                                          color: AppColor.normalTextColor
                                              .withOpacity(0.7),
                                          fontSize: Dimensions.fontSizeDefault,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    customSpacerHeight(height: 12),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                customSpacerHeight(height: 12),
                                                _textTitle(
                                                    titleText:
                                                        AppString.text_area),
                                                _textSubTitle(
                                                  subTitleText:
                                                      addressDetailsController
                                                              .addressDetailsModel
                                                              ?.data
                                                              ?.first
                                                              .value
                                                              ?.area ??
                                                          "Demo",
                                                ),
                                                customSpacerHeight(height: 16),
                                                _textTitle(
                                                    titleText:
                                                        AppString.text_state),
                                                _textSubTitle(
                                                  subTitleText:
                                                      addressDetailsController
                                                              .addressDetailsModel
                                                              ?.data
                                                              ?.first
                                                              .value
                                                              ?.state ??
                                                          "Demo",
                                                ),
                                                customSpacerHeight(height: 16),
                                                _textTitle(
                                                    titleText:
                                                        AppString.text_county),
                                                _textSubTitle(
                                                    subTitleText:
                                                        addressDetailsController
                                                                .addressDetailsModel
                                                                ?.data
                                                                ?.first
                                                                .value
                                                                ?.country ??
                                                            "Demo"),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                customSpacerHeight(height: 12),
                                                _textTitle(
                                                    titleText:
                                                        AppString.text_city),
                                                _textSubTitle(
                                                    subTitleText:
                                                        addressDetailsController
                                                                .addressDetailsModel
                                                                ?.data
                                                                ?.first
                                                                .value
                                                                ?.city ??
                                                            "Demo"),
                                                customSpacerHeight(height: 16),
                                                _textTitle(
                                                    titleText: AppString
                                                        .text_zip_code),
                                                _textSubTitle(
                                                    subTitleText:
                                                        addressDetailsController
                                                                .addressDetailsModel
                                                                ?.data
                                                                ?.first
                                                                .value
                                                                ?.zipCode ??
                                                            "Demo"),
                                                customSpacerHeight(height: 16),
                                                _textTitle(
                                                    titleText:
                                                        AppString.text_phone),
                                                _textSubTitle(
                                                    subTitleText:
                                                        addressDetailsController
                                                                .addressDetailsModel
                                                                ?.data
                                                                ?.first
                                                                .value
                                                                ?.phoneNumber ??
                                                            "Demo")
                                              ],
                                            ),
                                          ],
                                        ),
                                        customSpacerHeight(height: 24),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppString.text_current_address,
                                style: AppStyle.mid_large_text.copyWith(
                                    color: AppColor.normalTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              addressDetailsController
                                      .addressDetailsModel!.data!.isNotEmpty
                                  ? addressDetailsController.addressDetailsModel
                                              ?.data?.last.key ==
                                          AppString.text_present_address
                                      ? _editDetBtn(
                                          context: context,
                                          onAction: () => deletedAddController
                                              .deletedAddressApi(
                                                  addressType:
                                                      addressDetailsController
                                                          .addressDetailsModel
                                                          ?.data
                                                          ?.last
                                                          .key),
                                          editAction: const AddCurrentAddress(),
                                        )
                                      : _addButton(onAction: () {
                                          _box.write(AppString.STORE_ADDRESS,
                                              AppString.text_present_address);
                                          customButtomSheet(
                                              context: context,
                                              height: 0.9,
                                              child: const AddCurrentAddress());
                                        })
                                  : Container()
                            ],
                          ),
                          addressDetailsController
                                  .addressDetailsModel!.data!.isNotEmpty
                              ? addressDetailsController
                                      .addressDetailsModel!.data!.last.key!
                                      .startsWith(
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
                                          addressDetailsController
                                                  .addressDetailsModel
                                                  ?.data
                                                  ?.last
                                                  .value
                                                  ?.details
                                                  .toString() ??
                                              "Demo",
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
                                                      subTitleText:
                                                          addressDetailsController
                                                                  .addressDetailsModel
                                                                  ?.data
                                                                  ?.last
                                                                  .value
                                                                  ?.area ??
                                                              "Demo",
                                                    ),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_state),
                                                    _textSubTitle(
                                                      subTitleText:
                                                          addressDetailsController
                                                                  .addressDetailsModel
                                                                  ?.data
                                                                  ?.last
                                                                  .value
                                                                  ?.state ??
                                                              "Demo",
                                                    ),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_county),
                                                    _textSubTitle(
                                                        subTitleText:
                                                            addressDetailsController
                                                                    .addressDetailsModel
                                                                    ?.data
                                                                    ?.last
                                                                    .value
                                                                    ?.country ??
                                                                "Demo"),
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
                                                        subTitleText:
                                                            addressDetailsController
                                                                    .addressDetailsModel
                                                                    ?.data
                                                                    ?.last
                                                                    .value
                                                                    ?.city ??
                                                                "Demo"),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_zip_code),
                                                    _textSubTitle(
                                                        subTitleText:
                                                            addressDetailsController
                                                                    .addressDetailsModel
                                                                    ?.data
                                                                    ?.last
                                                                    .value
                                                                    ?.zipCode ??
                                                                "Demo"),
                                                    customSpacerHeight(
                                                        height: 16),
                                                    _textTitle(
                                                        titleText: AppString
                                                            .text_phone),
                                                    _textSubTitle(
                                                        subTitleText:
                                                            addressDetailsController
                                                                    .addressDetailsModel
                                                                    ?.data
                                                                    ?.last
                                                                    .value
                                                                    ?.phoneNumber ??
                                                                "Demo")
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
            ),
        onLoading: const LoadingIndicator());
  }
}

Widget _textTitle({titleText}) {
  return Text(
    titleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.hintColor.withOpacity(0.7),
        fontSize: Dimensions.fontSizeDefault,
        fontWeight: FontWeight.w500),
  );
}

Widget _textSubTitle({subTitleText}) {
  return Text(
    subTitleText,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor.withOpacity(0.7),
        fontSize: Dimensions.fontSizeDefault + 2,
        fontWeight: FontWeight.w700),
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
        const Icon(
          Icons.edit_square,
          color: AppColor.hintColor,
          size: 20,
        ),
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
