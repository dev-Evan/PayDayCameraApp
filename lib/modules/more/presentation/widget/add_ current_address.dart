import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/input_note.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_update_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/edit_address.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class AddCurrentAddress extends StatelessWidget {
  final String typeKey;
  AddCurrentAddress({required this.typeKey});
  @override
  Widget build(BuildContext context) {
    final _box = GetStorage();
    return Padding(
      padding: EdgeInsets.only(
          left: AppLayout.getWidth(20),
          right: AppLayout.getWidth(20),
          bottom: AppLayout.getHeight(20)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bottomSheetAppbar(
              context: context,
              appbarTitle: (Get.find<AddressDetailsController>()
                              .addressDetailsModel
                              .data !=
                          null &&
                      Get.find<AddressDetailsController>()
                          .addressDetailsModel
                          .data!
                          .isNotEmpty)
                  ? Get.find<AddressDetailsController>()
                              .addressDetailsModel
                              .data
                              ?.last
                              .key ==
                          AppString.text_present_address
                      ? "${AppString.text_edit} ${AppString.text_address}"
                      : "${AppString.text_add} ${AppString.text_address}"
                  : "",
            ),
            textFieldTitleText(titleText: AppString.text_county),
            InkWell(
              onTap: () => showCountryPicker(
                  context: context,
                  countryListTheme: CountryListThemeData(
                    flagSize: 24,
                    backgroundColor: AppColor.cardColor,
                    textStyle: const TextStyle(
                        fontSize: 16, color: AppColor.normalTextColor),
                    bottomSheetHeight: AppLayout.getHeight(554),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radiusMid),
                      topRight: Radius.circular(Dimensions.radiusMid),
                    ),
                    inputDecoration: InputDecoration(
                      labelText: AppString.text_search,
                      hintText: AppString.text_search_typing_to_search,
                      prefixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.solidGray),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusDefault)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.hintColor,
                          ),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radiusMid)),
                    ),
                  ),
                  onSelect: (Country country) {
                    _box.write(AppString.STORE_COUNTY, country.displayName);
                  }),
              child: countyField(
                text:  (Get.find<AddressDetailsController>()
                    .addressDetailsModel
                    .data !=
                    null &&
                    Get.find<AddressDetailsController>()
                        .addressDetailsModel
                        .data!
                        .isNotEmpty)
                    ? Get.find<AddressDetailsController>()
                    .addressDetailsModel.data?.last.key ==
                            AppString.text_present_address
                        ? Get.find<AddressDetailsController>()
                                .addressDetailsModel
                                .data
                                ?.last
                                .value
                                ?.country
                                .toString() ??
                            ""
                        : _box.read(AppString.STORE_COUNTY)
                    : _box.read(AppString.STORE_COUNTY),
                context: Get.context,
              ),
            ),
            textFieldTitleText(titleText: AppString.text_phone),
            phoneAndCountyField(
              hintText: (Get.find<AddressDetailsController>()
                              .addressDetailsModel
                              .data !=
                          null &&
                      Get.find<AddressDetailsController>()
                          .addressDetailsModel
                          .data!
                          .isNotEmpty)
                  ? Get.find<AddressDetailsController>()
                              .addressDetailsModel
                              .data
                              ?.last
                              .key ==
                          AppString.text_present_address
                      ? Get.find<AddressDetailsController>()
                          .addressDetailsModel
                          .data
                          ?.last
                          .value
                          ?.phoneNumber
                      : AppString.text_enter_phone_number
                  : "",
              controller:
                  Get.find<AddressUpdateController>().phoneNumberController,
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText2(titleText: AppString.text_area),
                      CustomTextFeild(
                        hintText: (Get.find<AddressDetailsController>()
                                        .addressDetailsModel
                                        .data !=
                                    null &&
                                Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data!
                                    .isNotEmpty)
                            ? Get.find<AddressDetailsController>()
                                        .addressDetailsModel
                                        .data
                                        ?.last
                                        .key ==
                                    AppString.text_present_address
                                ? Get.find<AddressDetailsController>()
                                        .addressDetailsModel
                                        .data
                                        ?.last
                                        .value
                                        ?.area
                                        .toString() ??
                                    ""
                                : AppString.text_enter_area
                            : "",
                        controller:
                            Get.find<AddressUpdateController>().areaController,
                      ),
                    ],
                  ),
                ),
                customSpacerWidth(width: 18),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText2(titleText: AppString.text_city),
                      CustomTextFeild(
                          hintText: (Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data !=
                                      null &&
                                  Get.find<AddressDetailsController>()
                                      .addressDetailsModel
                                      .data!
                                      .isNotEmpty)
                              ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.last
                                          .key ==
                                      AppString.text_present_address
                                  ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.last
                                          .value
                                          ?.city
                                          .toString() ??
                                      ""
                                  : AppString.text_enter_city
                              : "",
                          controller: Get.find<AddressUpdateController>()
                              .cityController),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_state),
                      CustomTextFeild(
                          hintText: (Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data !=
                                      null &&
                                  Get.find<AddressDetailsController>()
                                      .addressDetailsModel
                                      .data!
                                      .isNotEmpty)
                              ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.last
                                          .key ==
                                      AppString.text_present_address
                                  ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.last
                                          .value
                                          ?.state
                                          .toString() ??
                                      ""
                                  : AppString.text_enter_state
                              : "",
                          controller: Get.find<AddressUpdateController>()
                              .stateController),
                    ],
                  ),
                ),
                customSpacerWidth(width: 18),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_zip_code),
                      CustomTextFeild(
                          hintText: (Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data !=
                                      null &&
                                  Get.find<AddressDetailsController>()
                                      .addressDetailsModel
                                      .data!
                                      .isNotEmpty)
                              ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.last
                                          .key ==
                                      AppString.text_present_address
                                  ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.last
                                          .value
                                          ?.zipCode
                                          .toString() ??
                                      ""
                                  : AppString.text_enter_zip_code
                              : "",
                          controller: Get.find<AddressUpdateController>()
                              .zipCodeController),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFieldTitleText(
                    titleText: AppString.text_address + AppString.text_details),
                InputNote(
                    hintText: (Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data !=
                                null &&
                            Get.find<AddressDetailsController>()
                                .addressDetailsModel
                                .data!
                                .isNotEmpty)
                        ? Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data
                                    ?.last
                                    .key ==
                                AppString.text_present_address
                            ? Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data
                                    ?.last
                                    .value
                                    ?.details
                                    .toString() ??
                                ""
                            : "${AppString.text_add}${AppString.text_address_details}"
                        : "",
                    controller:
                        Get.find<AddressUpdateController>().detailsController),
              ],
            ),
            customSpacerHeight(height: 30),
            customDoubleButton(
                context: context,
                elevatedBtnText:
                    '${AppString.text_add} ${AppString.text_address}',
                textBtnText: AppString.text_cancel,
                textButtonAction: () => Get.back(),
                elevatedButtonAction: () {
                  Get.find<AddressUpdateController>().addressUpdate(
                    typeKey: typeKey.toString(),
                    selectedCounty: _box.read(AppString.STORE_COUNTY),
                  );
                  Future.delayed(
                    const Duration(seconds: 2),
                    () => _box.remove(AppString.STORE_COUNTY),
                  );
                }),
            customSpacerHeight(height: 250)
          ],
        ),
      ),
    );
  }
}
