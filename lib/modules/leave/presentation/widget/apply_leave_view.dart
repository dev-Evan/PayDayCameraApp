import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_button_layout.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../common/widget/custom_double_button.dart';

class ApplyLeaveView extends StatefulWidget {
  const ApplyLeaveView({Key? key}) : super(key: key);

  @override
  State<ApplyLeaveView> createState() => _ApplyLeaveViewState();
}

class _ApplyLeaveViewState extends State<ApplyLeaveView> {
  FilePickerResult? result;

  String? fileName;

  PlatformFile? pickFile;

  bool isLoading = false;

  File fileToDisplay = File('');

  void pickFile1() async {
    try {
      setState(() {
        isLoading = false;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          fileName = result!.files.first.name;
          pickFile = result!.files.first;
          fileToDisplay = File(pickFile!.path.toString());
        });
      }
    } catch (e) {
      print(e);
    }
  }

  final List<String> _locations = ['A', 'B', 'C', 'D'];
  String? dropdownValue;

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
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(Dimensions.paddingDefaultExtra),
                      bottom:
                          AppLayout.getHeight(Dimensions.paddingDefaultExtra)),
                  child: Text(
                    AppString.text_leave_duration,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
                ),
                const ApplyLeaveButtonLayout(),
                customSpacerHeight(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(Dimensions.paddingDefault)),
                  child: textFieldTitleText(titleText: AppString.text_phone),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(Dimensions.paddingDefault)),
                  child: Card(
                    color: AppColor.cardColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                        side: const BorderSide(
                            width: 0.0, color: AppColor.disableColor)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AppLayout.getHeight(
                              Dimensions.paddingDefaultExtra+2),

                      bottom: AppLayout.getHeight(
                          Dimensions.paddingDefaultExtra+2),
                      ),
                      child: DropdownButton<String>(
                        style: const TextStyle(fontWeight: FontWeight.w500),
                        isDense: true,
                        isExpanded: true,
                        underline: const SizedBox.shrink(),
                        icon: const Icon(Icons.expand_more),
                        iconEnabledColor: AppColor.normalTextColor,
                        hint: Padding(
                          padding:  EdgeInsets.only(left: AppLayout.getWidth(Dimensions.paddingDefault),right: AppLayout.getWidth(Dimensions.paddingDefault)),
                          child: Row(
                            children: [
                              _hintText(
                                hintText: AppString.text_paid_casual,
                              ),
                              customSpacerWidth(width: 4),
                              Text(
                                '( 8d 7h)',
                                style: AppStyle.normal_text.copyWith(
                                    color: AppColor.hintColor,
                                    fontSize: Dimensions.fontSizeDefault),
                              ),
                            ],
                          ),
                        ),
                        value: dropdownValue,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                        items: _locations
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: _hintText(
                              hintText: value,
                            ),
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
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(Dimensions.paddingDefault)),
                  child: textFieldTitleText(titleText: AppString.text_note),
                ),
                customSpacerHeight(height: 8),
                _noteTextField(),
                customSpacerHeight(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldTitleText(
                        titleText:
                            '${AppString.text_attachments} ${AppString.text_if_any}'),
                    customSpacerHeight(height: 20),
                    _dottedBorder(onAction: () => pickFile1()),
                    customSpacerHeight(height: 8),
                    Text(
                      AppString.text_jpeg_jpg_png_etc,
                      style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeDefault - 2),
                    ),
                  ],
                ),
                customSpacerHeight(height: 24),
                customDoubleButton(
                    context: context,
                    elevatedBtnText:
                        '${AppString.text_add} ${AppString.text_address}',
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

Widget _noteTextField() {
  return Container(
    height: AppLayout.getHeight(80),
    decoration: AppStyle.ContainerStyle.copyWith(
        borderRadius: BorderRadius.circular(
          Dimensions.radiusDefault,
        ),
        border: Border.all(width: 0.0, color: AppColor.disableColor)),
    child: const TextField(
      decoration: InputDecoration(
        hintText: AppString.text_add_reason_note_here,
        contentPadding: EdgeInsets.all(8),
        border: InputBorder.none,
      ),
      maxLines: null,
      expands: true,
    ),
  );
}

Widget _dottedBorder({onAction}) {
  return DottedBorder(
    radius: Radius.circular(Dimensions.radiusMid),
    color: AppColor.disableColor,
    strokeCap: StrokeCap.square,
    dashPattern: [AppLayout.getHeight(8), AppLayout.getWidth(6)],
    strokeWidth: 2,
    child: InkWell(
      onTap: () => onAction(),
      child: Container(
        height: AppLayout.getHeight(100),
        color: AppColor.disableColor.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.link),
            customSpacerWidth(width: 6),
            Text(
              AppString.text_click,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.primaryColor,
                  fontSize: Dimensions.fontSizeDefault),
            ),
            customSpacerWidth(width: 6),
            Text(
              AppString.text_to_add_fils,
              style: AppStyle.mid_large_text.copyWith(
                  color: AppColor.hintColor,
                  fontSize: Dimensions.fontSizeDefault + 2),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _hintText({hintText, Color textColor = AppColor.normalTextColor}) {
  return Text(
    hintText,
    style: AppStyle.normal_text.copyWith(color: textColor),
  );
}
