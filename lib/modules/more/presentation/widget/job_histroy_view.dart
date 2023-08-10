// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_history_title.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class JobHistoryView extends StatefulWidget {
  const JobHistoryView({super.key});
  @override
  State<JobHistoryView> createState() => _JobHistoryViewState();
}

class _JobHistoryViewState extends State<JobHistoryView> {
  bool _designationIcon = false;
  bool _departmentIcon = false;
  bool _roleIcon = false;
  bool _workShiftIcon = false;
  bool _employmentIcon = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customSpacerHeight(height: 12),
          Theme(
            data: _defaultDividerColor(),
            child: ExpansionTile(
              trailing: _statusIcon(value: _designationIcon),
              title: _designationTitleLayout(),
              onExpansionChanged: (bool expanded) {
                setState(() => _designationIcon = expanded);
              },
              children: [jobHisDesignationView()],
            ),
          ),
          divider,
          Theme(
            data: _defaultDividerColor(),
            child: ExpansionTile(
              trailing: _statusIcon(value: _departmentIcon),
              title: _departmentTitleLayout(),
              onExpansionChanged: (bool expanded) {
                setState(() => _departmentIcon = expanded);
              },
              children: [jobHisDepartmentView()],
            ),
          ),
          divider,
          Theme(
            data: _defaultDividerColor(),
            child: ExpansionTile(
              trailing: _statusIcon(value: _roleIcon),
              title: _rollTitleLayout(),
              onExpansionChanged: (bool expanded) {
                setState(() => _roleIcon = expanded);
              },
              children: [jobHisRoleView()],
            ),
          ),
          divider,
          Theme(
            data: _defaultDividerColor(),
            child: ExpansionTile(
              trailing: _statusIcon(value: _workShiftIcon),
              title: _workShiftTitleLayout(),
              onExpansionChanged: (bool expanded) {
                setState(() => _workShiftIcon = expanded);
              },
              children: [jobHisWorkShiftView()],
            ),
          ),
          divider,
          Theme(
            data: _defaultDividerColor(),
            child: ExpansionTile(
              trailing: _statusIcon(value: _employmentIcon),
              title: _userStatusTitleLayout(),
              onExpansionChanged: (bool expanded) {
                setState(() => _employmentIcon = expanded);
              },
              children: [jobHisEmploymentView()],
            ),
          ),
          divider
        ],
      ),
    );
  }

  _designationTitleLayout() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _boxLayout(
              icon: Images.designation, titleText: AppString.text_designation),
        ],
      ),
    );
  }

  _departmentTitleLayout() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _boxLayout(
              icon: Images.department, titleText: AppString.text_department),
        ],
      ),
    );
  }

  _rollTitleLayout() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _boxLayout(icon: Images.flag, titleText: AppString.text_role)
        ],
      ),
    );
  }

  _workShiftTitleLayout() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _boxLayout(icon: Images.clock, titleText: AppString.text_work_shift),
        ],
      ),
    );
  }

  _userStatusTitleLayout() {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _boxLayout(
              icon: Images.user_status, titleText: AppString.text_employment),
        ],
      ),
    );
  }

  _defaultDividerColor() {
    return Theme.of(context).copyWith(dividerColor: Colors.transparent);
  }
}

Divider get divider {
  return Divider(
    thickness: 0.5,
    color: AppColor.disableColor.withOpacity(0.7),
  );
}

Widget _boxLayout({icon, titleText}) {
  return Row(
    children: [
      _boxInfoLayout(icon),
      customSpacerWidth(width: 12),
      Text(
        titleText,
        style: AppStyle.small_text_black.copyWith(
            fontSize: Dimensions.fontSizeSmall + 3,
            color: AppColor.normalTextColor),
      )
    ],
  );
}

_boxInfoLayout(icon) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: _roundedRectangleBorder,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SvgPicture.asset(
            icon.toString(),
            width: AppLayout.getWidth(20),
            height: AppLayout.getWidth(20),
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        ),
      ));
}

Widget _statusIcon({value}) {
  return CircleAvatar(
      radius: 15,
      backgroundColor: AppColor.hintColor.withOpacity(0.1),
      child: value ? _closeArrow() : _openArrow());
}

_closeArrow() {
  return SvgPicture.asset(
    Images.close_arrow,
    width: AppLayout.getWidth(18),
    height: AppLayout.getWidth(18),
    color: AppColor.primaryColor.withOpacity(0.8),
  );
}

_openArrow() {
  return SvgPicture.asset(
    Images.open_arrow,
    width: AppLayout.getWidth(18),
    height: AppLayout.getWidth(18),
    color: AppColor.primaryColor.withOpacity(0.8),
  );
}

RoundedRectangleBorder get _roundedRectangleBorder {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault));
}
