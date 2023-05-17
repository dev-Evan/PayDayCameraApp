import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_update_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class EditAddress extends StatelessWidget {
  final String typeText;
  EditAddress(this.typeText);

  @override
  Widget build(BuildContext context) {
    final _box = GetStorage();
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                              ?.first
                              .key ==
                          AppString.text_permanent_address
                      ? "${AppString.text_edit} ${AppString.text_address}"
                      : "${AppString.text_add} ${AppString.text_address}"
                  : "",
            ),
            Padding(
              padding: EdgeInsets.only(top: AppLayout.getHeight(12)),
              child: textFieldTitleText(titleText: AppString.text_county),
            ),
            InkWell(
              onTap: () {
                showCountryPicker(
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
                    });
              },
              child: _countyField(
                text: _box.read(AppString.STORE_COUNTY) ??
                    (Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data !=
                                null &&
                            Get.find<AddressDetailsController>()
                                .addressDetailsModel
                                .data!
                                .isNotEmpty
                        ? Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data
                                    ?.first
                                    .key ==
                                AppString.text_permanent_address
                            ? Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data
                                    ?.last
                                    .value
                                    ?.country
                                    .toString() ??
                                ""
                            : AppString.text_select_county
                        : _box.read(AppString.STORE_COUNTY)),
                context: context,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: textFieldTitleText(titleText: AppString.text_phone),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: Get.find<AddressDetailsController>()
                                  .addressDetailsModel
                                  .data !=
                              null &&
                          Get.find<AddressDetailsController>()
                              .addressDetailsModel
                              .data!
                              .isNotEmpty
                      ? Get.find<AddressDetailsController>()
                                  .addressDetailsModel
                                  .data
                                  ?.first
                                  .key ==
                              AppString.text_permanent_address
                          ? Get.find<AddressDetailsController>()
                              .addressDetailsModel
                              .data
                              ?.first
                              .value
                              ?.phoneNumber
                          : AppString.text_enter_phone_number
                      : "",
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, color: AppColor.disableColor)),
                  contentPadding: const EdgeInsets.all(7),
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.0, color: AppColor.disableColor),
                  ),
                ),
                controller:
                    Get.find<AddressUpdateController>().phoneNumberController,
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_area),
                      CustomTextFeild(
                        hintText: Get.find<AddressDetailsController>()
                                        .addressDetailsModel
                                        .data !=
                                    null &&
                                Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data!
                                    .isNotEmpty
                            ? Get.find<AddressDetailsController>()
                                        .addressDetailsModel
                                        .data
                                        ?.first
                                        .key ==
                                    AppString.text_permanent_address
                                ? Get.find<AddressDetailsController>()
                                        .addressDetailsModel
                                        .data
                                        ?.first
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
                SizedBox(
                  width: AppLayout.getWidth(18),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_city),
                      CustomTextFeild(
                          hintText: Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data !=
                                      null &&
                                  Get.find<AddressDetailsController>()
                                      .addressDetailsModel
                                      .data!
                                      .isNotEmpty
                              ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.first
                                          .key ==
                                      AppString.text_permanent_address
                                  ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.first
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
            customSpacerHeight(height: 16),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_state),
                      CustomTextFeild(
                          hintText: Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data !=
                                      null &&
                                  Get.find<AddressDetailsController>()
                                      .addressDetailsModel
                                      .data!
                                      .isNotEmpty
                              ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.first
                                          .key ==
                                      AppString.text_permanent_address
                                  ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.first
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
                SizedBox(
                  width: AppLayout.getWidth(18),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_zip_code),
                      CustomTextFeild(
                          hintText: Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data !=
                                      null &&
                                  Get.find<AddressDetailsController>()
                                      .addressDetailsModel
                                      .data!
                                      .isNotEmpty
                              ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.first
                                          .key ==
                                      AppString.text_permanent_address
                                  ? Get.find<AddressDetailsController>()
                                          .addressDetailsModel
                                          .data
                                          ?.first
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
            customSpacerHeight(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFieldTitleText(
                    titleText: AppString.text_address + AppString.text_details),
                CustomTextFeild(
                    hintText: Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data !=
                                null &&
                            Get.find<AddressDetailsController>()
                                .addressDetailsModel
                                .data!
                                .isNotEmpty
                        ? Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data
                                    ?.first
                                    .key ==
                                AppString.text_permanent_address
                            ? Get.find<AddressDetailsController>()
                                    .addressDetailsModel
                                    .data
                                    ?.first
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
            customDoubleButton(
                context: context,
                elevatedBtnText:
                    '${AppString.text_add} ${AppString.text_address}',
                textBtnText: AppString.text_cancel,
                textButtonAction: () => Get.back(),
                elevatedButtonAction: () {
                  Get.find<AddressUpdateController>().addressUpdate(
                    typeKey: typeText.toString(),
                    selectedCounty: _box.read(AppString.STORE_COUNTY),
                  );
                  print(_box.read(AppString.STORE_ADDRESS).toString());
                }),
            customSpacerHeight(height: 250)
          ],
        ),
      ),
    );
  }
}

Widget _countyField({text, context}) {
  return Container(
    width: MediaQuery.of(context).size.width / 1,
    height: AppLayout.getHeight(50),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        border: Border.all(width: 0, color: AppColor.disableColor)),
    child: Padding(
      padding: EdgeInsets.only(
          left: AppLayout.getWidth(8),
          top: AppLayout.getHeight(8),
          bottom: AppLayout.getHeight(8),
          right: AppLayout.getWidth(8)),
      child: _fieldText(text: text),
    ),
  );
}

Widget _fieldText({required text}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text ?? "",
        style: GoogleFonts.poppins(color: AppColor.hintColor),
      ),
      const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColor.normalTextColor,
      ),
    ],
  );
}
