
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/input_note.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_update_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class AddAddress extends StatelessWidget {
  final String typeText;
  AddAddress(this.typeText);
  @override
  Widget build(BuildContext context) {
    final _box = GetStorage();
    return Padding(
      padding: EdgeInsets.only(
          left: AppLayout.getWidth(20), right: AppLayout.getWidth(20)),
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
            customSpacerHeight(height: 8),
            textFieldTitleText(titleText: AppString.text_county),
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
                          hintText: AppString.text_search,
                          hintStyle: AppStyle.normal_text.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                          isDense: true,
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
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
            textFieldTitleText(titleText: AppString.text_phone),
            _phoneAndCountyField(),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText2(titleText: AppString.text_area),
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
                customSpacerWidth(width: 18),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText2(titleText: AppString.text_city),
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
                customSpacerWidth(width: 18),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFieldTitleText(
                    titleText: AppString.text_address + AppString.text_details),
                InputNote(
                  controller:
                  Get.find<AddressUpdateController>().detailsController,
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
                ),
              ],
            ),
            customSpacerHeight(height: 24),
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
    height: AppLayout.getHeight(56),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        border: Border.all(width: 1, color: AppColor.solidGray)),
    child: Padding(
      padding: EdgeInsets.only(
          left: AppLayout.getWidth(12),
          top: AppLayout.getHeight(12),
          bottom: AppLayout.getHeight(12),
          right: AppLayout.getWidth(12)),
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
        style: AppStyle.normal_text
            .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
      ),
      const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColor.normalTextColor,
      ),
    ],
  );
}

Widget _phoneAndCountyField() {
  return IntlPhoneField(
    decoration: InputDecoration(
      labelText:
      Get.find<AddressDetailsController>().addressDetailsModel.data !=
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
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.solidGray),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.0, color: AppColor.disableColor),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
    ),
    controller: Get.find<AddressUpdateController>().phoneNumberController,
  );
}
