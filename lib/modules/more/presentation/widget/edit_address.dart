import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/input_note.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
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

class EditAddress extends GetView<AddressController> {
  final String typeText;
  final String isoCode;
  EditAddress(this.typeText, this.isoCode, {super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    left: AppLayout.getWidth(20),
                    right: AppLayout.getWidth(20)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _editAppbarLayout(context),
                      customSpacerHeight(height: 8),
                      //details input field here
                      _detailsInputField(),
                      customSpacerHeight(height: 12),
                      //area and city input field here
                      _areaAndCityInputField(),
                      //sate and zip code input field here
                      _stateAndZipInputField(),
                      textFieldTitleText(titleText: AppString.text_county),
                      //county input field here
                      _countyInputField(context),
                      textFieldTitleText(titleText: AppString.text_phone),
                      //phone number input field here
                      _phoneInputField(),
                      customSpacerHeight(height: 48),
                      _saveButtonLayout(context),
                      customSpacerHeight(height: 250)
                    ],
                  ),
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  _editAppbarLayout(context) {
    return bottomSheetAppbar(
        context: context,
        appbarTitle: "${AppString.text_edit} ${AppString.text_address}");
  }

  _detailsInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textFieldTitleText(
            titleText: AppString.text_address + AppString.text_details),
        InputNote(
          controller: Get.find<InputTextFieldController>().detailsController,
          hintText: "${AppString.text_add}${AppString.text_address_details}",
          validator: (value) {
            if (value!.isEmpty) {
              return AppString.the_details_field_is_required;
            } else if (value.length < 3) {
              return AppString.the_details_must_be_at_least_3_character;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  _areaAndCityInputField() {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldTitleText2(titleText: AppString.text_area),
              CustomTextField(
                hintText: AppString.text_enter_area,
                controller: Get.find<InputTextFieldController>().areaController,
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
                controller: Get.find<InputTextFieldController>().cityController,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _stateAndZipInputField() {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldTitleText(titleText: AppString.text_state),
              CustomTextField(
                hintText: AppString.text_enter_state,
                controller:
                    Get.find<InputTextFieldController>().stateController,
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
                controller:
                    Get.find<InputTextFieldController>().zipCodeController,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _countyInputField(context) {
    return countyField(
      context: context,
      controller: Get.find<InputTextFieldController>().countyTextController,
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
            });
      },
    );
  }

  _phoneInputField() {
    return editPhoneAndCountyField(
        controller: Get.find<InputTextFieldController>().phoneNumberController,
        isoCode: isoCode);
  }

  _saveButtonLayout(context) {
    return Obx(
      () => Get.find<AddressController>().isLoading.isTrue
          ? loadingIndicatorLayout()
          : customDoubleButton(
              context: context,
              elevatedBtnText: AppString.text_save,
              textBtnText: AppString.text_cancel,
              textButtonAction: () => Get.back(),
              elevatedButtonAction: () {
                FocusScope.of(context).requestFocus(FocusNode());
                if (_formKey.currentState!.validate()) {
                  Get.find<AddressController>()
                      .updateEmployeeAddress(
                          typeKey: typeText.toString(),
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
                          isoCode: Get.find<CountryPickerController>()
                              .isoCode
                              .value
                              .toString(),
                          message: AppString.text_address_update_successfully)
                      .then((value) {
                    if (value == true) {
                      controller.getEmployeeAddress();
                    }
                  });
                }
              }),
    );
  }
}

final CountryPickerController _controller = Get.put(CountryPickerController());
