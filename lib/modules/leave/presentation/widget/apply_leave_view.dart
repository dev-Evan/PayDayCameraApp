import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    AppString.text_phone,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
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
                        hint: Row(
                          children: [
                            Text(
                              AppString.text_paid_casual,
                              style: AppStyle.normal_text
                                  .copyWith(color: AppColor.normalTextColor),
                            ),
                            SizedBox(
                              width: AppLayout.getWidth(4),
                            ),
                            Text(
                              '( 8d 7h)',
                              style: AppStyle.normal_text.copyWith(
                                  color: AppColor.hintColor,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                          ],
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
                  child: Text(
                    AppString.text_note,
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.fontSizeDefault + 1),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(8),
                ),
                Container(
                  height: AppLayout.getHeight(80),
                  decoration: AppStyle.ContainerStyle.copyWith(
                      borderRadius: BorderRadius.circular(
                        Dimensions.radiusDefault,
                      ),
                      border:
                          Border.all(width: 0.0, color: AppColor.disableColor)),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: AppString.text_add_reason_note_here,
                      contentPadding: EdgeInsets.all(8),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    expands: true,
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(8),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppString.text_attachments} ${AppString.text_if_any}',
                      style: AppStyle.small_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeDefault + 1),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(20),
                    ),
                    DottedBorder(
                      radius: Radius.circular(Dimensions.radiusMid),
                      color: AppColor.disableColor,
                      strokeCap: StrokeCap.square,
                      dashPattern: [8, 6],
                      strokeWidth: 2,
                      child: InkWell(
                        onTap: () => pickFile1(),
                        child: Container(
                          height: 100,
                          color: AppColor.disableColor.withOpacity(0.4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.link),
                              SizedBox(
                                width: AppLayout.getWidth(6),
                              ),
                              Text(
                                AppString.text_click,
                                style: AppStyle.mid_large_text.copyWith(
                                    color: AppColor.primaryColor,
                                    fontSize: Dimensions.fontSizeDefault),
                              ),
                              SizedBox(
                                width: AppLayout.getWidth(6),
                              ),
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
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(8),
                    ),
                    Text(
                      AppString.text_jpeg_jpg_png_etc,
                      style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeDefault - 2),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(24),
                ),
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
