import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_button_layout.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

import '../../../../common/widget/custom_double_button.dart';
import '../../../../common/widget/input_note.dart';

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

  bool isFilePicked = false;

  void pickFile1() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          isFilePicked = true;
        });
      }
      Get.find<LeaveController>().requestLeaveQueries["attachments[]"] =
          result!.files.first.path.toString();
    } catch (e) {
      print(e);
    }
  }

  final _leaveType = Get.find<LeaveController>().leaveType;
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
                  child:
                      textFieldTitleText(titleText: AppString.text_leave_type),
                ),
                _leaveTypeDropDown(),
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
                    elevatedBtnText: AppString.text_apply,
                    textBtnText: AppString.text_cancel,
                    textButtonAction: () {
                      Get.find<LeaveController>().requestLeaveQueries.clear();
                      Get.find<LeaveController>().leaveNote.clear();
                      Get.back();
                    },
                    elevatedButtonAction: () {
                      switch (Get.find<LeaveController>()
                          .leaveDurationIndex
                          .value) {
                        case 0:
                          {
                            _applySingleLeave();
                            //clear queries after api call
                            Get.find<LeaveController>()
                                .requestLeaveQueries
                                .clear();
                          }
                          break;
                        case 1:
                          {
                            _applyMultiDayLeave();
                            //clear queries after api call
                            Get.find<LeaveController>()
                                .requestLeaveQueries
                                .clear();
                          }
                          break;
                        case 2:
                          {
                            _applyHalfDayLeave();
                            //clear queries after api call
                            Get.find<LeaveController>()
                                .requestLeaveQueries
                                .clear();
                          }
                          break;
                        case 3:
                          {
                            _applyHourLeave();
                            //clear queries after api call
                            Get.find<LeaveController>()
                                .requestLeaveQueries
                                .clear();
                          }
                          break;
                      }
                      Get.find<LeaveController>().leaveNote.clear();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  _leaveTypeDropDown() => Padding(
        padding: EdgeInsets.only(
            top: AppLayout.getHeight(Dimensions.paddingDefault)),
        child: Padding(
          padding: EdgeInsets.only(
            top: AppLayout.getHeight(Dimensions.paddingDefaultExtra),
            bottom: AppLayout.getHeight(Dimensions.paddingDefaultExtra),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
            child: DropdownButton<String>(
              style: const TextStyle(fontWeight: FontWeight.w500),
              isExpanded: true,
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.expand_more, color: Colors.grey),
              iconEnabledColor: AppColor.normalTextColor,
              hint: Row(
                children: [
                  _hintText(
                    textColor: Colors.grey,
                    hintText: AppString.text_paid_casual,
                  ),
                ],
              ),
              value: dropdownValue,
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              items: _leaveType.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: _hintText(
                    hintText: value,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                _setData(newValue);
                setState(() {
                  dropdownValue = newValue;
                });
              },
            ),
          ),
        ),
      );

  void _setData(String? newValue) {
    switch (newValue) {
      case "Paid Casual":
        {
          Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] =
              "1";
        }
        break;
      case "Paid Sick":
        {
          Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] =
              "2";
        }
        break;
      case "Unpaid Casual":
        {
          Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] =
              "3";
        }
        break;
      case "Unpaid Sick":
        {
          Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] =
              "4";
        }
    }
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
        child: isFilePicked == true
            ? Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(20),
                    vertical: AppLayout.getHeight(20)),
                color: AppColor.disableColor.withOpacity(0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Text(result?.files.first.name ?? ""))
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(20),
                    vertical: AppLayout.getHeight(20)),
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

  void _applySingleLeave() {
    //check if leave duration is set
    //its a mandatory
    //set default if not set
    if (!Get.find<LeaveController>()
        .requestLeaveQueries
        .containsKey("leave_duration")) {
      Get.find<LeaveController>().requestLeaveQueries["leave_duration"] =
          "single_day";
    }
    //check if leave type is set
    //its a mandatory
    //set default if not set
    if (!Get.find<LeaveController>()
        .requestLeaveQueries
        .containsKey("leave_type_id")) {
      Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] = "1";
    }
    //take the note value and set into map
    Get.find<LeaveController>().requestLeaveQueries["note"] =
        Get.find<LeaveController>().leaveNote.text;

    Get.find<LeaveController>().requestLeave(
        leaveARequestQueries: Get.find<LeaveController>().requestLeaveQueries);

    Get.back();
  }

  void _applyMultiDayLeave() {
    //check if leave duration is set
    //its a mandatory
    //set default if not set
    if (!Get.find<LeaveController>()
        .requestLeaveQueries
        .containsKey("leave_duration")) {
      Get.find<LeaveController>().requestLeaveQueries["leave_duration"] =
          "multi_day";
    }
    //Add multiple date
    Get.find<LeaveController>().requestLeaveQueries["start_date"] =
        Get.find<LeaveController>().startDate.value;
    Get.find<LeaveController>().requestLeaveQueries["end_date"] =
        Get.find<LeaveController>().endDate.value;
    //check if leave type is set
    //its a mandatory
    //set default if not set
    if (!Get.find<LeaveController>()
        .requestLeaveQueries
        .containsKey("leave_type_id")) {
      Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] = "1";
    }
    //take the note value and set into map
    Get.find<LeaveController>().requestLeaveQueries["note"] =
        Get.find<LeaveController>().leaveNote.text;

    Get.find<LeaveController>().requestLeave(
        leaveARequestQueries: Get.find<LeaveController>().requestLeaveQueries);

    Get.back();
  }

  void _applyHalfDayLeave() {
    //check if leave type is set
    //its a mandatory
    //set default if not set
    if (!Get.find<LeaveController>()
        .requestLeaveQueries
        .containsKey("leave_type_id")) {
      Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] = "1";
    }
    //take the note value and set into map
    Get.find<LeaveController>().requestLeaveQueries["note"] =
        Get.find<LeaveController>().leaveNote.text;

    Get.find<LeaveController>().requestLeave(
        leaveARequestQueries: Get.find<LeaveController>().requestLeaveQueries);

    Get.back();
  }

  void _applyHourLeave() {
    //check if leave type is set
    //its a mandatory
    //set default if not set
    if (!Get.find<LeaveController>()
        .requestLeaveQueries
        .containsKey("leave_type_id")) {
      Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] = "1";
    }
    //take the note value and set into map
    Get.find<LeaveController>().requestLeaveQueries["note"] =
        Get.find<LeaveController>().leaveNote.text;

    Get.find<LeaveController>().requestLeave(
        leaveARequestQueries: Get.find<LeaveController>().requestLeaveQueries);

    Get.back();
  }
}

Widget _noteTextField() {
  return inputNote(controller: Get.find<LeaveController>().leaveNote);
}

Widget _hintText({hintText, Color textColor = AppColor.normalTextColor}) {
  return Text(
    hintText,
    style: AppStyle.normal_text.copyWith(color: textColor),
  );
}
