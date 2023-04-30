import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_update_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../common/widget/custom_double_button.dart';
import '../../../../common/widget/text_field.dart';

class AddCurrentAddress extends StatefulWidget {
  const AddCurrentAddress({Key? key}) : super(key: key);
  @override
  State<AddCurrentAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<AddCurrentAddress> {
  AddressUpdateController addressUpdateController =
      Get.put(AddressUpdateController());
  AddressDetailsController addressDetailsController =
      Get.put(AddressDetailsController());

  @override
  Widget build(BuildContext context) {
    final _box = GetStorage();
    return Padding(
      padding:  EdgeInsets.only(
        left: AppLayout.getWidth(20),
        right: AppLayout.getWidth(20),
          bottom: AppLayout.getHeight(20)

      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bottomSheetAppbar(
              context: context,
              appbarTitle:
                  addressDetailsController.addressDetailsModel!.data!.isNotEmpty
                      ? addressDetailsController
                              .addressDetailsModel!.data!.last.key!
                              .startsWith(AppString.text_present_address)
                          ? "${AppString.text_edit} ${AppString.text_address}"
                          : "${AppString.text_add} ${AppString.text_address}"
                      : "",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0,bottom: 12),
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
                    (addressDetailsController
                            .addressDetailsModel!.data!.isNotEmpty
                        ? addressDetailsController
                                .addressDetailsModel!.data!.last.key!
                                .startsWith(AppString.text_present_address)
                            ? addressDetailsController.addressDetailsModel?.data
                                    ?.last.value?.country
                                    .toString() ??
                                ""
                            : AppString.text_select_county
                        : _box.read(AppString.STORE_COUNTY)),
                context: context,
              ),
            ),
            //),

            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: textFieldTitleText(titleText: AppString.text_phone),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: addressDetailsController
                          .addressDetailsModel!.data!.isNotEmpty
                      ? addressDetailsController
                              .addressDetailsModel!.data!.last.key!
                              .startsWith(AppString.text_present_address)
                          ? addressDetailsController.addressDetailsModel?.data
                              ?.last.value?.phoneNumber
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
                controller: addressUpdateController.phoneNumberController.value,
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
                        hintText: addressDetailsController
                                .addressDetailsModel!.data!.isNotEmpty
                            ? addressDetailsController
                                    .addressDetailsModel!.data!.last.key!
                                    .startsWith(AppString.text_present_address)
                                ? addressDetailsController.addressDetailsModel
                                        ?.data?.last.value?.area
                                        .toString() ??
                                    ""
                                : AppString.text_enter_area
                            : "",
                        controller:
                            addressUpdateController.areaController.value,
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
                          hintText: addressDetailsController
                                  .addressDetailsModel!.data!.isNotEmpty
                              ? addressDetailsController
                                      .addressDetailsModel!.data!.last.key!
                                      .startsWith(
                                          AppString.text_present_address)
                                  ? addressDetailsController.addressDetailsModel
                                          ?.data?.last.value?.city
                                          .toString() ??
                                      "Demo"
                                  : AppString.text_enter_city
                              : "",
                          controller:
                              addressUpdateController.cityController.value),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppLayout.getHeight(16),
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textFieldTitleText(titleText: AppString.text_state),
                      CustomTextFeild(
                          hintText: addressDetailsController
                                  .addressDetailsModel!.data!.isNotEmpty
                              ? addressDetailsController
                                      .addressDetailsModel!.data!.last.key!
                                      .startsWith(
                                          AppString.text_present_address)
                                  ? addressDetailsController.addressDetailsModel
                                          ?.data?.last.value?.state
                                          .toString() ??
                                      "Demo"
                                  : AppString.text_enter_state
                              : "",
                          controller:
                              addressUpdateController.stateController.value),
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
                          hintText: addressDetailsController
                                  .addressDetailsModel!.data!.isNotEmpty
                              ? addressDetailsController
                                      .addressDetailsModel!.data!.last.key!
                                      .startsWith(
                                          AppString.text_present_address)
                                  ? addressDetailsController.addressDetailsModel
                                          ?.data?.last.value?.zipCode
                                          .toString() ??
                                      "Demo"
                                  : AppString.text_enter_zip_code
                              : "",
                          controller:
                              addressUpdateController.zipCodeController.value),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppLayout.getHeight(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFieldTitleText(
                    titleText: AppString.text_address + AppString.text_details),
                CustomTextFeild(
                    hintText: addressDetailsController
                            .addressDetailsModel!.data!.isNotEmpty
                        ? addressDetailsController
                                .addressDetailsModel!.data!.last.key!
                                .startsWith(AppString.text_present_address)
                            ? addressDetailsController.addressDetailsModel?.data
                                    ?.last.value?.details
                                    .toString() ??
                                "Demo"
                            : "${AppString.text_add}${AppString.text_address_details}"
                        : "",
                    controller:
                        addressUpdateController.detailsController.value),
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
                  addressUpdateController.addressUpdate(
                    typeKey:
                        addressDetailsController.addressDetailsModel!.data!.isNotEmpty

                            ? addressDetailsController
                                    .addressDetailsModel?.data?.last.key
                                    .toString() ??
                                ""
                            : _box.read(AppString.STORE_ADDRESS),
                    selectedCounty: _box.read(AppString.STORE_COUNTY ?? ""),
                  );
                  Future.delayed(
                    const Duration(seconds: 2),
                    () => _box.remove(AppString.STORE_COUNTY),
                  );

                  Future.delayed(
                    const Duration(seconds: 5),
                        () => _box.remove(AppString.STORE_ADDRESS),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(color: AppColor.hintColor),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColor.normalTextColor,
          ),
        ],
      ),
    ),
  );
}
