import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/enum/range_calendar_method_imp.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/modules/leave/presentation/controller/leave_controller.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_records_layout.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/view_list_view.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class LeaveRecordsView extends GetView<LeaveController> {
  const LeaveRecordsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
              appBar: const CustomAppbar(),
              body: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    _containerView(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(20),
                          vertical: AppLayout.getHeight(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [_customTexTitle(context)],
                      ),
                    ),
                    viewListViewLayout(),
                  ],
                ),
              ),
            ),
        onLoading: const LoadingIndicator());
  }

  Widget _containerView() {
    return SizedBox(
      height: AppLayout.getHeight(174),
      child: _containerViewStyle(
          child: Column(
        children: [
          customMoreAppbar(
            titleText: AppString.text_leave_records,
            bgColor: AppColor.primaryColor,
            textColor: AppColor.backgroundColor,
          ),
          leaveRecordsLayOut(),
        ],
      )),
    );
  }

  Widget _containerViewStyle({child}) {
    return Container(
      height: AppLayout.getHeight(222),
      decoration: AppStyle.ContainerStyle.copyWith(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimensions.radiusMid),
            bottomRight: Radius.circular(Dimensions.radiusMid)),
        color: AppColor.primaryColor,
      ),
      child: child,
    );
  }

  Widget _customTitleTextStyle({titleText}) {
    return Row(
      children: [
        Text(
          titleText,
          style: AppStyle.mid_large_text.copyWith(
              color: AppColor.secondaryColor, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: AppLayout.getWidth(12),
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          color: AppColor.hintColor,
        )
      ],
    );
  }

  Future _openBottomSheet() {
    return showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (context) => const SelectRangeCalender(
        rangeCalendarMethodImp: RangeCalendarMethodImp.LEAVE_RECORD,
      ),
    );
  }

  Widget _customTexTitle(context) {
    return InkWell(
      onTap: () => _openBottomSheet(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customTitleTextStyle(titleText: controller.rangeName.value),
          Text(
            '${DateFormat("dd MMM yyyy").format(controller.rangeStartDay.value)} - ${DateFormat("dd MMM yyyy").format(controller.rangeEndDate.value)}',
            style:
                AppStyle.small_text_black.copyWith(color: AppColor.hintColor),
          ),
        ],
      ),
    );
  }
}
