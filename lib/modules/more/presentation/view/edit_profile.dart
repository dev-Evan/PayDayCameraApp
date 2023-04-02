import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../widget/custom_text_field_dob.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final List<String> _locations = ['A', 'B', 'C', 'D'];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customMoreAppbar(titleText: AppString.text_edit_profile),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(titleText: AppString.text_name),
                  ),
                  CustomTextFeild(hintText: 'Steave Roggers'),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(titleText: AppString.text_email),
                  ),
                  CustomTextFeild(hintText: 'steaave@gmail.com'),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(
                        titleText: AppString.text_gender_text),
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
                            AppString.text_select_gender,
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
                                  style: AppStyle.normal_text.copyWith(
                                      color: AppColor.normalTextColor)),
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
                      decoration:  InputDecoration(
                        labelText: AppString.text_phone_number,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0.0, color: AppColor.disableColor)),
                        contentPadding: const EdgeInsets.all(7),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.0, color: AppColor.disableColor),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(
                        titleText: AppString.text_address_details),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(8),
                  ),
                  Container(
                    height: AppLayout.getHeight(120),
                    decoration: AppStyle.ContainerStyle.copyWith(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radiusDefault,
                        ),
                        border: Border.all(
                            width: 0.0, color: AppColor.disableColor)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: AppString.text_enter_massage,
                        contentPadding: EdgeInsets.all(8),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      expands: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: textFieldTitleText(
                        titleText: AppString.text_date_of_birth),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(8),
                  ),
                  CustomTextFieldDob(
                      hintText: '01-Jan-1996',
                      dobIcon: Icons.calendar_month,
                      dobIconAction: () {}),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child:
                        textFieldTitleText(titleText: AppString.text_about_me),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(8),
                  ),
                  Container(
                    height: AppLayout.getHeight(120),
                    decoration: AppStyle.ContainerStyle.copyWith(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radiusDefault,
                        ),
                        border: Border.all(
                            width: 0.0, color: AppColor.disableColor)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: AppString.text_enter_massage,
                        contentPadding: const EdgeInsets.all(8),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      expands: true,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(AppString.text_save, () {}),
            )
          ],
        ),
      ),
    );
  }
}
