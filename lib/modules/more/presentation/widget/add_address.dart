import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/input_note.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_update_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/address_details_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class AddAddress extends StatefulWidget {
  final String typeText;
  AddAddress(this.typeText);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
              left: AppLayout.getWidth(20), right: AppLayout.getWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bottomSheetAppbar(
                  context: context,
                  appbarTitle: AppString.text_add_address,

                ),
                customSpacerHeight(height: 8),
                textFieldTitleText(titleText: AppString.text_county),
                countyField(
                  context: context,
                  controller: Get.find<CustomTextEditingController>().addCountyController,
                  onAction: () {
                    showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 24,
                          backgroundColor: AppColor.cardColor,
                          textStyle: countyTextStyle,
                          bottomSheetHeight: AppLayout.getHeight(554),
                          borderRadius: countyFieldRadius,
                          inputDecoration: countryDecoration,
                        ),
                        onSelect: (Country country) {
                          setState(() {
                            Get.find<CustomTextEditingController>()
                                .addCountyController
                                .text = country.displayName.toString();
                          });
                        });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppString.fieldIsRequired;
                    }
                    return null;
                  },
                ),
                textFieldTitleText(titleText: AppString.text_phone),
                phoneAndCountyField(controller:Get.find<CustomTextEditingController>().addPhoneNumberController,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textFieldTitleText2(titleText: AppString.text_area),
                          CustomTextField(
                            hintText
                                : AppString.text_enter_area,
                            controller: Get.find<CustomTextEditingController>()
                                .addAreaController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppString.fieldIsRequired;
                              }
                              return null;
                            },
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
                          CustomTextField(
                            hintText: AppString.text_enter_city,
                            controller: Get.find<CustomTextEditingController>()
                                .addCityController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppString.fieldIsRequired;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textFieldTitleText(titleText: AppString.text_state),
                          CustomTextField(
                            hintText: AppString.text_enter_state,
                            controller: Get.find<CustomTextEditingController>()
                                .addStateController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppString.fieldIsRequired;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    customSpacerWidth(width: 18),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textFieldTitleText(
                              titleText: AppString.text_zip_code),
                          CustomTextField(
                            hintText: AppString.text_enter_zip_code,
                            controller: Get.find<CustomTextEditingController>()
                                .addZipCodeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppString.fieldIsRequired;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldTitleText(
                        titleText:
                            AppString.text_address + AppString.text_details),
                    InputNote(
                      controller: Get.find<CustomTextEditingController>()
                          .addDetailsController,
                      hintText:  "${AppString.text_add}${AppString.text_address_details}",
                      validator: (value) {

                        if (value!.isEmpty) {
                          return AppString.fieldIsRequired;
                        } else if (value.length < 3) {
                          return AppString.the_details_must_be_at_least_3_character;
                        }else{
                          return null;
                        }


                        return null;
                      },
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
                      if (_formKey.currentState!.validate()) {
                             Get.find<AddressUpdateController>().addressUpdate(
                                typeKey: widget.typeText.toString(),context: context,
                               area: Get.find<CustomTextEditingController>().addAreaController.value.text,
                               city: Get.find<CustomTextEditingController>().addCityController.value.text,
                               country: Get.find<CustomTextEditingController>().addCountyController.value.text,
                               details: Get.find<CustomTextEditingController>().addDetailsController.value.text,
                               phone: Get.find<CustomTextEditingController>().addPhoneNumberController.value.text,
                               state: Get.find<CustomTextEditingController>().addStateController.value.text,
                               zipcode: Get.find<CustomTextEditingController>().addZipCodeController.value.text,
                               message:   AppString.text_address_added_successfully,





                              );
                      }
                    }),
                customSpacerHeight(height: 250)
              ],
            ),
          ),
        ));
  }
}
