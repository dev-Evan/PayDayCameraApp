import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_eidt_bottomsheet.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/change_log_bottom_sheet.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/widget/custom_app_button.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/dimensions.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../widget/log_details_bottom_sheet_content.dart';

class LogDetailsBottomSheet extends GetView<AttendanceController> {
  const LogDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => DraggableScrollableSheet(
              initialChildSize: .8,
              maxChildSize: .8,
              minChildSize: .5,
              builder:
                  (BuildContext context, ScrollController scrollController) =>
                      Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))),
                child: Stack(
                  children: [
                    ListView(
                      controller: scrollController,
                      children: [
                        bottomSheetAppbar(
                            context: context,
                            appbarTitle: AppString.text_log_details),
                        contentLayout(),
                        SizedBox(
                          height: AppLayout.getHeight(60),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _buttonLayout(context),
                    ),

                  ],
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  _buttonLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppLayout.getWidth(Dimensions.paddingLarge),
        right: AppLayout.getWidth(Dimensions.paddingLarge),
        bottom: AppLayout.getHeight(Dimensions.paddingLarge),
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _editButton(context),
        ],
      ),
    );
  }

  _editButton(BuildContext context) {
    return AppButton(
      buttonColor: AppColor.primaryBlue,
      buttonText: AppString.text_edit,
      onPressed: () => _openEditBottomSheet(),
    );
  }

  //_openChangeLogBottomSheet()
  _cancelButton(BuildContext context) {
    return AppButton(
      buttonText: AppString.text_change_log,
      onPressed: () => (){},
      buttonColor: Colors.transparent,
      hasOutline: true,
      borderColor: Colors.black,
      textColor: Colors.black,
    );
  }
}

Future _openEditBottomSheet() {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: Get.context!,
    builder: (context) =>  EditAttendanceBottomSheet(Get.find<AttendanceController>().logDetailsById),
  );
}

Future _openChangeLogBottomSheet() {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: Get.context!,
    builder: (context) => const ChangeLogBottomSheet(),
  );
}
