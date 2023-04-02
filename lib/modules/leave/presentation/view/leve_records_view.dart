import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/all_logs.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_filter.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_log_text.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_overview_layout.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_filter.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/leave_records_layout.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/view_list_view.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/view/payrun_badge.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class LeaveRecordsView extends StatelessWidget {
  const LeaveRecordsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            _containerView(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_customTexTitle(context)],
              ),
            ),
            viewListViewLayout(),
          ],
        ),
      ),
    );
  }
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

Widget _customTexTitle(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => customButtomSheet(
                context: context,
                height: 0.9,
                child: const SelectRangeCalender()),
            child: _customTitleTextStyle(titleText: AppString.textCustom),
          ),
          Text(
            '14 Dec 2022 - 30 Dec 2022',
            style:
                AppStyle.small_text_black.copyWith(color: AppColor.hintColor),
          ),
        ],
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 2.3,
      ),
      _filterStyle(context)
    ],
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

Widget _filterStyle(context) {
  return Column(
    children: [
      InkWell(
          onTap: () => customButtomSheet(
              context: context,
              height: 0.9,
              child: const LeaveDurationFilter()),
          child: const Icon(
            Icons.filter_alt,
            color: AppColor.hintColor,
          )),
    ],
  );
}
