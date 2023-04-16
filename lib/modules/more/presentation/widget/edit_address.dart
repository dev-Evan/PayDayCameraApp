import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/custom_double_button.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_update_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({Key? key}) : super(key: key);
  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  final List<String> _locations = ['A', 'B', 'C', 'D'];
  String? dropdownValue;

  AddressUpdateController addressUpdateController =
      Get.put(AddressUpdateController());
  AddressDetailsController addressDetailsController =
      Get.put(AddressDetailsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bottomSheetAppbar(
              context: context,
              appbarTitle: '${AppString.text_edit} ${AppString.text_address}',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: textFieldTitleText(titleText: AppString.text_county),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Card(
                color: AppColor.cardColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault),
                    side: const BorderSide(
                        width: 0.0, color: AppColor.disableColor)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DropdownButton<String>(
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    isDense: true,
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    icon: const Icon(Icons.expand_more),
                    iconEnabledColor: AppColor.normalTextColor,
                    hint: Text(
                      AppString.text_select_county,
                      style: AppStyle.normal_text
                          .copyWith(color: AppColor.normalTextColor),
                    ),
                    value: dropdownValue,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault),
                    items: _locations
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: AppStyle.normal_text
                                .copyWith(color: AppColor.normalTextColor)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
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
                  labelText: addressDetailsController
                          .addressDetailsModel?.data?.first.value?.phoneNumber
                          .toString() ??
                      "Demo",
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
                                .addressDetailsModel?.data?.first.value?.area
                                .toString() ??
                            "Demo",
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
                                  .addressDetailsModel?.data?.first.value?.city
                                  .toString() ??
                              "Demo",
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
                                  .addressDetailsModel?.data?.first.value?.state
                                  .toString() ??
                              "Demo",
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
                          hintText: addressDetailsController.addressDetailsModel
                                  ?.data?.first.value?.zipCode
                                  .toString() ??
                              "Demo",
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
                            .addressDetailsModel?.data?.first.value?.details
                            .toString() ??
                        "Demo",
                    controller:
                        addressUpdateController.detailsController.value),
              ],
            ),
            customDoubleButton(
                context: context,
                elevatedBtnText:
                    '${AppString.text_add} ${AppString.text_address}',
                textBtnText: AppString.text_cancel,
                textButtonAction: () {},
                elevatedButtonAction: () {
                  addressUpdateController.addressUpdate(
                    typeKey: addressDetailsController
                            .addressDetailsModel?.data?.first.key
                            .toString() ??
                        "",
                  );
                  print("click");
                }),
          ],
        ),
      ),
    );
  }
}
