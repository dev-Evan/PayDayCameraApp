import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/controller/date_time_helper_controller.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/common/widget/warning_message.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_allowance.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/apply_leave_button_layout.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../common/widget/custom_double_button.dart';
import '../../../../common/widget/error_message.dart';
import '../../../../common/widget/input_note.dart';
import '../../../../utils/logger.dart';

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

  void pickFileFormStorage() async {
    PermissionStatus permissionStatus;
    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      permissionStatus = await Permission.photos.request();
    } else {
      permissionStatus = await Permission.storage.request();
    }


    if(permissionStatus.isGranted){
      try {
        result = await FilePicker.platform.pickFiles(
          type: FileType.any,
          allowMultiple: false,
        );

        if (result != null) {
          // setState(() {
          //   isFilePicked = true;
          // });
          Get.find<LeaveController>().isFilePicked.value=true;
        }
        Get.find<LeaveController>().requestLeaveQueries["attachments[]"] =
            result!.files.first.path.toString();
      } catch (e) {
        LoggerHelper.errorLog(message: e.toString());
      }
    }
    else if(permissionStatus.isPermanentlyDenied){
      openAppSettings();
    }else{
      showErrorMessage(errorMessage: AppString.storage_permission);
    }
  }

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    final  controller =Get.find<LeaveController>();
    return Container(
      decoration:_openModelRadius,
      child: Column(
        children: [
          bottomSheetAppbar(
            context: context,
            appbarTitle: AppString.text_apply_leve,
          ),
        controller.obx((state) =>  Expanded(child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppLayout.getHeight(
                          Dimensions.paddingDefaultExtra),
                      bottom: AppLayout.getHeight(10)),
                  child: Text(AppString.text_leave_duration,
                      style: AppStyle.normal_text_black),
                ),
                const ApplyLeaveButtonLayout(),
                customSpacerHeight(height: 10),
                textFieldTitleText(
                    titleText: AppString.text_leave_type),
                _leaveTypeDropDown(),
                customSpacerHeight(height: 20),
                _leaveCount(),
                customSpacerHeight(height: 10),
                textFieldTitleText(titleText: AppString.text_note),
                _noteTextField(),
                customSpacerHeight(height: 8),
                _addAttachment(),
                customSpacerHeight(height: 24),
                Obx(() => Get.find<LeaveController>().isLoading.isTrue
                    ? loadingIndicatorLayout(): _applyLeaveButtons(),),
                customSpacerHeight(height: 70)
              ],
            ),
          ),
        )),onLoading: const Expanded(child: Center(child: LoadingIndicator())))

        ],
      ),
    );

  }

  _leaveTypeDropDown() {
    List<String> leaveType = [];
    try {
      Get.find<LeaveController>().leaveType.values.forEach((element) {
        leaveType.add(element);
      });
    } catch (e) {
      LoggerHelper.errorLog(message: e.toString());
    }
    return Container(
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
        items: leaveType.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: _hintText(
              hintText: value,
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          //getting id value from leave type
          int indexValue = Get.find<LeaveController>()
              .leaveType
              .keys
              .firstWhere(
                  (element) =>
              Get.find<LeaveController>().leaveType[element] ==
                  newValue,
              orElse: () => null);
          _setData(indexValue: indexValue);
          setState(() {
            dropdownValue = newValue;
          });
        },
      ),
    );
  }

  void _setData({required int indexValue}) {
    Get.find<LeaveController>().requestLeaveQueries["leave_type_id"] =
        indexValue.toString();
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
        child: Get.find<LeaveController>().isFilePicked.value == true
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
    try {
      if (!Get.find<LeaveController>()
          .requestLeaveQueries
          .containsKey("date")) {
        Get.find<LeaveController>().requestLeaveQueries["date"] =
            Get.find<DateTimeController>().requestedDate.value;
      }
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
    } catch (e) {
      LoggerHelper.errorLog(message: e.toString());
    }
    Get.find<LeaveController>().requestLeave(
        leaveARequestQueries:
        Get.find<LeaveController>().requestLeaveQueries)
        .then((value) {
      if (value == true) {
        Get.back();
      }
    });
  }

  void _applyMultiDayLeave() {
    try {
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
    } catch (e) {
      LoggerHelper.errorLog(message: e.toString());
    }

    Get.find<LeaveController>()
        .requestLeave(
        leaveARequestQueries:
        Get.find<LeaveController>().requestLeaveQueries)
        .then((value) {
      if (value == true) {
        Get.back();
      }
    });
  }

  void _applyHalfDayLeave() {
    try {
      if (!Get.find<LeaveController>()
          .requestLeaveQueries
          .containsKey("date")) {
        Get.find<LeaveController>().requestLeaveQueries["date"] =
            Get.find<DateTimeController>().requestedDate.value;
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
    } catch (e) {
      LoggerHelper.errorLog(message: e.toString());
    }
    Get.find<LeaveController>()
        .requestLeave(
        leaveARequestQueries:
        Get.find<LeaveController>().requestLeaveQueries)

        .then((value) {
      if (value == true) {
        Get.back();
      }
    });
  }

  void _applyHourLeave() {
    try {
      if (!Get.find<LeaveController>()
          .requestLeaveQueries
          .containsKey("date")) {
        Get.find<LeaveController>().requestLeaveQueries["date"] =
            Get.find<DateTimeController>().requestedDate.value;
      }

      Get.find<LeaveController>()
          .requestLeaveQueries["start_time"] = DateFormat(
          "yyyy-MM-dd hh:mma")
          .parse(
          "${Get.find<DateTimeController>().requestedDate.value} ${Get.find<DateTimeController>().pickedInTime.value.replaceAll(" ", "")}")
          .toString();

      Get.find<LeaveController>().requestLeaveQueries["end_time"] = DateFormat(
          "yyyy-MM-dd hh:mma")
          .parse(
          "${Get.find<DateTimeController>().requestedDate.value} ${Get.find<DateTimeController>().pickedOutTime.value.replaceAll(" ", "")}")
          .toString();
    } catch (e) {
      LoggerHelper.errorLog(message: e.toString());
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

    Get.find<LeaveController>()
        .requestLeave(
            leaveARequestQueries:
                Get.find<LeaveController>().requestLeaveQueries);
  }

  _addAttachment() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textFieldTitleText(
          titleText:
          '${AppString.text_attachments} ${AppString.text_if_any}'),
     Obx(() =>  _dottedBorder(onAction: () => pickFileFormStorage())),
      customSpacerHeight(height: 8),
      Text(
        AppString.text_jpeg_jpg_png_etc,
        style: AppStyle.mid_large_text.copyWith(
            color: AppColor.hintColor,
            fontSize: Dimensions.fontSizeDefault - 2),
      ),
    ],
  );

  _leaveCount() {
    var data = Get.find<LeaveController>().leaveAllowance.data;
    late List<List<Values>?> dataValue;
    if (data != null) {
      dataValue = data
          .where((element) => element.leaveStatus!.startsWith("Availability"))
          .map((e) => e.values)
          .toList();
    }
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(20),
          vertical: AppLayout.getHeight(10)),
      decoration: BoxDecoration(
          color: AppColor.primaryBlue.withOpacity(.1),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textFieldTitleText(titleText: AppString.text_available),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: dataValue.first!
                      .map((e) => _leaveCounter(
                      leaveType: e.leaveType, leaveValue: e.value))
                      .toList(),
                ),
              ),
              customSpacerWidth(width: 10),
              Expanded(
                child: Column(
                  children: dataValue.last!
                      .map((e) => _leaveCounter(
                      leaveType: e.leaveType, leaveValue: e.value))
                      .toList(),
                ),
              ),
            ],
          ),
          customSpacerHeight(height: 20),
        ],
      ),
    );
  }

  Widget _leaveCounter({String? leaveType, String? leaveValue}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            leaveType ?? '',
            style: AppStyle.small_text_black,
          ),
        ),
        Text(
          leaveValue ?? "",
          style: AppStyle.small_text_black.copyWith(color: Colors.grey),
        )
      ],
    );
  }

  _applyLeaveButtons() {
    return Padding(
      padding: EdgeInsets.only(bottom: AppLayout.getHeight(20)),
      child: customDoubleButton(
          context: context,
          elevatedBtnText: AppString.text_apply,
          textBtnText: AppString.text_cancel,
          textButtonAction: () {
            Get.find<LeaveController>().requestLeaveQueries.clear();
            Get.find<LeaveController>().leaveNote.clear();
            Get.back();
          },
          elevatedButtonAction: () {
            if (Get.find<LeaveController>().leaveNote.text.isEmpty) {

              showWarningMessage(message: AppString.text_please_provite_a_leave_note);

            } else {
              switch (Get.find<LeaveController>().leaveDurationIndex.value) {
                case 0:
                  {
                    _applySingleLeave();
                  }
                  break;
                case 1:
                  {
                    _applyMultiDayLeave();
                  }
                  break;
                case 2:
                  {
                    _applyHalfDayLeave();
                  }
                  break;
                case 3:
                  {
                    _applyHourLeave();
                  }
                  break;
              }
            }
          }),
    );
  }
}

Widget _noteTextField() {
  return
    InputNote(controller: Get.find<LeaveController>().leaveNote);
}

Widget _hintText({hintText, Color textColor = AppColor.normalTextColor}) {
  return Text(
    hintText,
    style: AppStyle.normal_text.copyWith(color: textColor),
  );
}

Decoration  get _openModelRadius{
  return  const BoxDecoration(
      color: AppColor.cardColor,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)));
}