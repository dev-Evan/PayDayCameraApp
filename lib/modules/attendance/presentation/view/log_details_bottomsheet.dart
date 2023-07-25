// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
// import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
// import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_eidt_bottomsheet.dart';
// import 'package:pay_day_mobile/utils/app_color.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
// import '../../../../common/controller/date_time_helper_controller.dart';
// import '../../../../common/widget/custom_app_button.dart';
// import '../../../../common/widget/loading_indicator.dart';
// import '../widget/bottom_sheet_appbar.dart';
// import '../widget/log_details_bottom_sheet_content.dart';
//
// class LogDetailsBottomSheet extends GetView<AttendanceController> {
//   const LogDetailsBottomSheet({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: .9,
//       maxChildSize: .9,
//       minChildSize: .7,
//       builder: (BuildContext context, ScrollController scrollController) =>
//           Container(
//         decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//
//           child: Stack(
//             children: [
//               bottomSheetAppbar(
//                   context: context, appbarTitle: AppString.text_log_details),
//               controller.obx((state) => Container(
//                 child: contentLayout(context),
//
//               ),
//
//
//
//                   onLoading: _loadingIndicator()),
//
//               // Align(
//               //   alignment: Alignment.bottomCenter,
//               //   child: _buttonLayout(context),
//               // ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _loadingIndicator() {
//     return const Expanded(child: Center(child: LoadingIndicator()));
//   }
// }
// _buttonLayout(BuildContext context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       _editButton(context),
//     ],
//   );
// }
//
// _editButton(BuildContext context) {
//   return AppButton(
//     buttonColor: AppColor.primaryBlue,
//     buttonText: AppString.text_edit,
//     onPressed: () {
//       Get.delete<DateTimeController>();
//       Get.put(DateTimeController());
//       customButtonSheet(
//         context: context,
//         height: 0.9,
//         child: EditAttendanceBottomSheet(
//             Get.find<AttendanceController>().logDetailsById),
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/controller/attendance_controller.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/view/attendance_eidt_bottomsheet.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../../../common/controller/date_time_helper_controller.dart';
import '../../../../common/widget/custom_app_button.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
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
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      child: Column(
        children: [
          bottomSheetAppbar(
              context: context, appbarTitle: AppString.text_log_details),
          controller.obx(
              (state) => Expanded(
                  flex: 5,
                  child: Container(
                    color: AppColor.cardColor,
                    child: contentLayout(),
                  )),
              onLoading: const Expanded(child: LoadingIndicator())),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buttonLayout(context),
          ),
        ],
      ),
    );
  }

  _buttonLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppLayout.getWidth(Dimensions.paddingLarge-2),
        right: AppLayout.getWidth(Dimensions.paddingLarge-2),
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
      onPressed: () {
        Get.delete<DateTimeController>();
        Get.put(DateTimeController());
        customButtonSheet(
          context: context,
          height: 0.9,
          child: EditAttendanceBottomSheet(
              Get.find<AttendanceController>().logDetailsById),
        );
      },
    );
  }
}
