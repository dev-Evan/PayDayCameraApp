import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/dotted_view.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_his_job_title.dart';
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
            data: Theme.of(context)
                .copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              trailing: _statusIcon(value: _designationIcon),
              title: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Images.designation,
                        titleText: AppString.text_designation),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _designationIcon = expanded);
              },
              children: [
                customSpacerHeight(height: 16),
                jobHisDesignationView()
              ],
            ),
          ),
          customSpacerHeight(height: 12),

          Theme(
            data: Theme.of(context)
                .copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              trailing: _statusIcon(value: _departmentIcon),
              title: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Images.department,
                        titleText: AppString.text_department),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _departmentIcon = expanded);
              },
              children: [
                customSpacerHeight(height: 16),
                jobHisDepartmentView()
              ],
            ),
          ),
          customSpacerHeight(height: 12),

          Theme(
            data: Theme.of(context)
                .copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              trailing: _statusIcon(value: _roleIcon),
              title: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Images.flag,
                        titleText: AppString.text_role)
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _roleIcon = expanded);
              },
              children: [customSpacerHeight(height: 18), jobHisRoleView()],
            ),
          ),
          customSpacerHeight(height: 12),

          Theme(
            data: Theme.of(context)
                .copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              trailing: _statusIcon(value: _workShiftIcon),
              title: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Images.clock,

                        titleText: AppString.text_work_shift),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _workShiftIcon = expanded);
              },
              children: [customSpacerHeight(height: 18), jobHisWorkShiftView()],
            ),
          ),
          customSpacerHeight(height: 12),
          Theme(
            data: Theme.of(context)
                .copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              trailing: _statusIcon(value: _employmentIcon),
              title: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Images.user_status,
                        titleText: AppString.text_employment),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _employmentIcon = expanded);
              },
              children: [
                customSpacerHeight(height: 14),
                jobHisEmploymentView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _cardIconTitleText({icon, titleText}) {
  return Row(
    children: [
      Card(
          elevation: 0,
          color: AppColor.primaryColor.withOpacity(0.1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
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
          )),
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

Widget _statusIcon({value}) {
  return CircleAvatar(
      radius: 15,
      backgroundColor: AppColor.hintColor.withOpacity(0.1),
      child: value
          ? SvgPicture.asset(
        Images.close_arrow,
        width: AppLayout.getWidth(18),
        height: AppLayout.getWidth(18),
        color: AppColor.primaryColor.withOpacity(0.8),
      )
          :  SvgPicture.asset(
        Images.open_arrow,
        width: AppLayout.getWidth(18),
        height: AppLayout.getWidth(18),
        color: AppColor.primaryColor.withOpacity(0.8),
      )


  );
}
