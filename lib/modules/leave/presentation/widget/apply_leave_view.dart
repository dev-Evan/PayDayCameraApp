import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/common/custom_double_button.dart';
import 'package:pay_day_mobile/common/text_field.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_button_layout.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class ApplyLeaveView extends StatefulWidget {
  const ApplyLeaveView({Key? key}) : super(key: key);

  @override
  State<ApplyLeaveView> createState() => _ApplyLeaveViewState();
}

class _ApplyLeaveViewState extends State<ApplyLeaveView> {
  final List<String> _locations = ['A', 'B', 'C', 'D'];
  String? dropdownValue;

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _addDetailsController = TextEditingController();

  var currentindex = 0;
  List title = [
    AppString.text_single_day,
    AppString.text_multi_day,
    AppString.text_half_day,
    AppString.text_hours,
  ];
  final page = [
    Container(
      height: 50,
      color: Colors.green,
    ),
    Container(
      height: 50,
      color: Colors.yellow,
    ),
    Container(
      height: 50,
      color: Colors.red,
    ),
    Container(
      height: 50,
      color: Colors.yellow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bottomSheetAppbar(
            context: context,
            appbarTitle: AppString.text_apply_leve,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Text(
                    AppString.text_leave_duration,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
                ),
                const ApplyLeaveButtonLayout(),

                SizedBox(
                  height: AppLayout.getHeight(20),
                ),


                //
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: Card(
                //     color: AppColor.cardColor,
                //     elevation: 0,
                //     shape: RoundedRectangleBorder(
                //         borderRadius:
                //         BorderRadius.circular(Dimensions.radiusDefault),
                //         side: const BorderSide(
                //             width: 0.0, color: AppColor.disableColor)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(12.0),
                //       child: DropdownButton<String>(
                //         style: const TextStyle(fontWeight: FontWeight.w500),
                //         isDense: true,
                //         isExpanded: true,
                //         underline: const SizedBox.shrink(),
                //         icon: const Icon(Icons.expand_more),
                //         iconEnabledColor: AppColor.normalTextColor,
                //         hint: Text(
                //           AppString.text_select_county,
                //           style: AppStyle.normal_text
                //               .copyWith(color: AppColor.normalTextColor),
                //         ),
                //         value: dropdownValue,
                //         borderRadius:
                //         BorderRadius.circular(Dimensions.radiusDefault),
                //         items: _locations
                //             .map<DropdownMenuItem<String>>((String value) {
                //           return DropdownMenuItem<String>(
                //             value: value,
                //             child: Text(value,
                //                 style: AppStyle.normal_text
                //                     .copyWith(color: AppColor.normalTextColor)),
                //           );
                //         }).toList(),
                //         onChanged: (String? newValue) {
                //           setState(() {
                //             dropdownValue = newValue!;
                //           });
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: Text(
                //     AppString.text_phone,
                //     style: AppStyle.small_text.copyWith(
                //         color: AppColor.hintColor,
                //         fontWeight: FontWeight.w600,
                //         fontSize: Dimensions.fontSizeDefault + 1),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: IntlPhoneField(
                //     decoration: const InputDecoration(
                //       labelText: ' Enter phone Number',
                //       enabledBorder: OutlineInputBorder(
                //           borderSide:
                //           BorderSide(width: 0.0, color: AppColor.disableColor)),
                //       contentPadding: EdgeInsets.all(7),
                //       border: OutlineInputBorder(
                //         borderSide:
                //         BorderSide(width: 0.0, color: AppColor.disableColor),
                //       ),
                //     ),
                //   ),
                // ),
                //
                // Row(
                //   children: [
                //     Flexible(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             AppString.text_area,
                //             style: AppStyle.small_text.copyWith(
                //                 color: AppColor.hintColor,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: Dimensions.fontSizeDefault + 1),
                //           ),
                //           CustomTextFeild(
                //               hintText: 'Enter area', controller: _areaController),
                //         ],
                //       ),
                //     ),
                //     SizedBox(
                //       width: AppLayout.getWidth(18),
                //     ),
                //     Flexible(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             AppString.text_city,
                //             style: AppStyle.small_text.copyWith(
                //                 color: AppColor.hintColor,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: Dimensions.fontSizeDefault + 1),
                //           ),
                //           CustomTextFeild(
                //               hintText: 'Enter city', controller: _cityController),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: AppLayout.getHeight(16),
                // ),
                // Row(
                //   children: [
                //     Flexible(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             AppString.text_state,
                //             style: AppStyle.small_text.copyWith(
                //                 color: AppColor.hintColor,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: Dimensions.fontSizeDefault + 1),
                //           ),
                //           CustomTextFeild(
                //               hintText: 'Enter state',
                //               controller: _stateController),
                //         ],
                //       ),
                //     ),
                //     SizedBox(
                //       width: AppLayout.getWidth(18),
                //     ),
                //     Flexible(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             AppString.text_zip_code,
                //             style: AppStyle.small_text.copyWith(
                //                 color: AppColor.hintColor,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: Dimensions.fontSizeDefault + 1),
                //           ),
                //           CustomTextFeild(
                //               hintText: 'Enter zip code',
                //               controller: _zipCodeController),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: AppLayout.getHeight(12),
                // ),
                //
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       AppString.text_address + AppString.text_details,
                //       style: AppStyle.small_text.copyWith(
                //           color: AppColor.hintColor,
                //           fontWeight: FontWeight.w600,
                //           fontSize: Dimensions.fontSizeDefault + 1),
                //     ),
                //     CustomTextFeild(
                //         hintText: 'Enter address',
                //         controller: _addDetailsController),
                //   ],
                // ),
                //   const Spacer(),

                customDoubleButton(
                    context: context,
                    elevatedBtnText: '${AppString.text_add} ${AppString.text_address}',
                    textBtnText: AppString.text_cancel,
                    textButtonAction: () {},
                    elevatedButtonAction: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
