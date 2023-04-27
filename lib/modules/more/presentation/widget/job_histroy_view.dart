import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/dotted_view.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_his_job_title.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_history_title.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class JobHistoryView extends StatefulWidget {
  const JobHistoryView({super.key});

  @override
  State<JobHistoryView> createState() => _JobHistoryViewState();
}

class _JobHistoryViewState extends State<JobHistoryView> {
  JobHistoryController jobHistoryController = Get.put(JobHistoryController());

  bool _designationIcon = false;
  bool _departmentIcon = false;
  bool _roleIcon = false;
  bool _workShifeIcon = false;
  bool _employmentIcon = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: _statusIcon(value: _designationIcon),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Icons.sticky_note_2_outlined,
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
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: _statusIcon(value: _departmentIcon),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Icons.card_giftcard,
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
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: _statusIcon(value: _roleIcon),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Icons.flag_outlined,
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
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: _statusIcon(value: _workShifeIcon),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Icons.schedule,
                        titleText: AppString.text_work_shift),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _workShifeIcon = expanded);
              },
              children: [customSpacerHeight(height: 18), jobHisWorkShiftView()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: _statusIcon(value: _employmentIcon),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardIconTitleText(
                        icon: Icons.verified_user_outlined,
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
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Icon(
                icon,
                color: AppColor.primaryColor.withOpacity(0.8),
              ),
            ),
          )),
      SizedBox(
        width: AppLayout.getWidth(12),
      ),
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
      radius: 14,
      backgroundColor: AppColor.hintColor.withOpacity(0.1),
      child: value
          ? Icon(
              CupertinoIcons.arrow_turn_up_left,
              size: 18,
              color: AppColor.primaryColor.withOpacity(0.8),
            )
          : const Icon(
              CupertinoIcons.arrow_turn_right_down,
              color: AppColor.primaryColor,
              size: 18,
            ));
}
