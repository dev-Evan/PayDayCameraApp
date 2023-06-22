import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/input_note.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/common_controller/more_text_editing_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../controller/address_controller.dart';
import '../controller/common_controller/county_pickar_controller.dart';
import 'address_details_widget.dart';

class EditAddress extends StatefulWidget {
  final String typeText;
  const EditAddress(this.typeText, {super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

final CountryPickerController _controller = Get.put(CountryPickerController());

class _EditAddressState extends State<EditAddress> {
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
                  appbarTitle:
                      "${AppString.text_edit} ${AppString.text_address}"),
              customSpacerHeight(height: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFieldTitleText(
                      titleText:
                      AppString.text_address + AppString.text_details),
                  InputNote(
                    controller:
                    Get.find<InputTextFieldController>().detailsController,
                    hintText:
                    "${AppString.text_add}${AppString.text_address_details}",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppString.the_details_field_is_required;
                      } else if (value.length < 3) {
                        return AppString
                            .the_details_must_be_at_least_3_character;
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
              customSpacerHeight(height: 12),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldTitleText2(titleText: AppString.text_area),
                        CustomTextField(
                          hintText: AppString.text_enter_area,
                          controller: Get.find<InputTextFieldController>()
                              .areaController,
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
                          controller: Get.find<InputTextFieldController>()
                              .cityController,
                        ),
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
                        CustomTextField(
                          hintText: AppString.text_enter_state,
                          controller: Get.find<InputTextFieldController>()
                              .stateController,
                        ),
                      ],
                    ),
                  ),
                  customSpacerWidth(width: 18),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldTitleText(titleText: AppString.text_zip_code),
                        CustomTextField(
                          hintText: AppString.text_enter_zip_code,
                          controller: Get.find<InputTextFieldController>()
                              .zipCodeController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              textFieldTitleText(titleText: AppString.text_county),
              countyField(
                context: context,
                controller:
                    Get.find<InputTextFieldController>().countyTextController,
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
                        _controller.editSetSelectedCountry(country.name);
                        print(country.name);
                      });
                },
              ),
              textFieldTitleText(titleText: AppString.text_phone),
              phoneAndCountyField(
                controller:
                    Get.find<InputTextFieldController>().phoneNumberController,
              ),


              customSpacerHeight(height: 24),
              customDoubleButton(
                  context: context,
                  elevatedBtnText:
                      AppString.text_save,
                  textBtnText: AppString.text_cancel,
                  textButtonAction: () => Get.back(),
                  elevatedButtonAction: () {
                    if (_formKey.currentState!.validate()) {
                      Get.find<AddressController>().addressUpdate(
                          typeKey: widget.typeText.toString(),
                          context: context,
                          area: Get.find<InputTextFieldController>()
                              .areaController
                              .value
                              .text,
                          city: Get.find<InputTextFieldController>()
                              .cityController
                              .value
                              .text,
                          country: Get.find<InputTextFieldController>()
                              .countyTextController
                              .value
                              .text,
                          details: Get.find<InputTextFieldController>()
                              .detailsController
                              .value
                              .text,
                          phone: Get.find<InputTextFieldController>()
                              .phoneNumberController
                              .value
                              .text,
                          state: Get.find<InputTextFieldController>()
                              .stateController
                              .value
                              .text,
                          zipcode: Get.find<InputTextFieldController>()
                              .zipCodeController
                              .value
                              .text,
                          message: AppString.text_address_update_successfully);
                    }
                  }),
              customSpacerHeight(height: 250)
            ],
          ),
        ),
      ),
    );
  }
}
