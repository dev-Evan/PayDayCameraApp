import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_his_job_title.dart';
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
  bool _designationIcon = false;
  bool _departmentIcon = false;
  bool _roleIcon = false;
  bool _workShifIcon = false;
  bool _employmentIcon = false;
  List title = [
    AppString.text_ui_designer,
    AppString.text_ui_designer,
    AppString.text_ui_designer,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColor.hintColor.withOpacity(0.1),
                  child: _designationIcon
                      ? Icon(
                          CupertinoIcons.arrow_turn_up_left,
                          size: 18,
                          color: AppColor.primaryColor.withOpacity(0.8),
                        )
                      : const Icon(
                          CupertinoIcons.arrow_turn_right_down,
                          color: AppColor.primaryColor,
                          size: 18,
                        )),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Card(
                            elevation: 0,
                            color: AppColor.primaryColor.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Center(
                                child: Icon(
                                  Icons.sticky_note_2_outlined,
                                  color: AppColor.primaryColor.withOpacity(0.8),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: AppLayout.getWidth(12),
                        ),
                        Text(
                          AppString.text_designation,
                          style: AppStyle.small_text_black.copyWith(
                              fontSize: Dimensions.fontSizeSmall + 3,
                              color: AppColor.normalTextColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _designationIcon = expanded);
              },
              children: [
                SizedBox(
                  height: AppLayout.getHeight(18),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, bottom: 18),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: title.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: DottedBorder(
                              customPath: (p0) => Path()..lineTo(0, 98),
                              color: AppColor.disableColor,
                              dashPattern: const [6, 4],
                              strokeWidth: 1,
                              child: Row(
                                children: [
                                  Divider(
                                    height: AppLayout.getHeight(90),
                                    color: AppColor.noColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 23,
                              child: jodTitle(jobTitleText: title[index])),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColor.hintColor.withOpacity(0.1),
                  child: _departmentIcon
                      ? Icon(
                          CupertinoIcons.arrow_turn_up_left,
                          size: 18,
                          color: AppColor.primaryColor.withOpacity(0.8),
                        )
                      : const Icon(
                          CupertinoIcons.arrow_turn_right_down,
                          color: AppColor.primaryColor,
                          size: 18,
                        )),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Card(
                            elevation: 0,
                            color: AppColor.primaryColor.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Center(
                                child: Icon(
                                  Icons.card_giftcard,
                                  color: AppColor.primaryColor.withOpacity(0.8),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: AppLayout.getWidth(12),
                        ),
                        Text(
                          AppString.text_department,
                          style: AppStyle.small_text_black.copyWith(
                              fontSize: Dimensions.fontSizeSmall + 3,
                              color: AppColor.normalTextColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _departmentIcon = expanded);
              },
              children: [
                SizedBox(
                  height: AppLayout.getHeight(18),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, bottom: 18),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: title.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: DottedBorder(
                              customPath: (p0) => Path()..lineTo(0, 98),
                              color: AppColor.disableColor,
                              dashPattern: const [6, 4],
                              strokeWidth: 1,
                              child: Row(
                                children: [
                                  Divider(
                                    height: AppLayout.getHeight(90),
                                    color: AppColor.noColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 23,
                              child: jodTitle(jobTitleText: title[index])),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColor.hintColor.withOpacity(0.1),
                  child: _roleIcon
                      ? Icon(
                          CupertinoIcons.arrow_turn_up_left,
                          size: 18,
                          color: AppColor.primaryColor.withOpacity(0.8),
                        )
                      : const Icon(
                          CupertinoIcons.arrow_turn_right_down,
                          color: AppColor.primaryColor,
                          size: 18,
                        )),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Card(
                            elevation: 0,
                            color: AppColor.primaryColor.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Center(
                                child: Icon(
                                  Icons.flag_outlined,
                                  color: AppColor.primaryColor.withOpacity(0.8),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: AppLayout.getWidth(12),
                        ),
                        Text(
                          AppString.text_role,
                          style: AppStyle.small_text_black.copyWith(
                              fontSize: Dimensions.fontSizeSmall + 3,
                              color: AppColor.normalTextColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _roleIcon = expanded);
              },
              children: [
                SizedBox(
                  height: AppLayout.getHeight(18),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, bottom: 18),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: title.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: DottedBorder(
                              customPath: (p0) => Path()..lineTo(0, 98),
                              color: AppColor.disableColor,
                              dashPattern: const [6, 4],
                              strokeWidth: 1,
                              child: Row(
                                children: [
                                  Divider(
                                    height: AppLayout.getHeight(90),
                                    color: AppColor.noColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 23,
                              child: jodTitle(jobTitleText: title[index])),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColor.hintColor.withOpacity(0.1),
                  child: _workShifIcon
                      ? Icon(
                          CupertinoIcons.arrow_turn_up_left,
                          size: 18,
                          color: AppColor.primaryColor.withOpacity(0.8),
                        )
                      : const Icon(
                          CupertinoIcons.arrow_turn_right_down,
                          color: AppColor.primaryColor,
                          size: 18,
                        )),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Card(
                            elevation: 0,
                            color: AppColor.primaryColor.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Center(
                                child: Icon(
                                  Icons.schedule,
                                  color: AppColor.primaryColor.withOpacity(0.8),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: AppLayout.getWidth(12),
                        ),
                        Text(
                          AppString.text_work_shift,
                          style: AppStyle.small_text_black.copyWith(
                              fontSize: Dimensions.fontSizeSmall + 3,
                              color: AppColor.normalTextColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _workShifIcon = expanded);
              },
              children: [
                SizedBox(
                  height: AppLayout.getHeight(18),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, bottom: 18),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: title.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: DottedBorder(
                              customPath: (p0) => Path()..lineTo(0, 98),
                              color: AppColor.disableColor,
                              dashPattern: const [6, 4],
                              strokeWidth: 1,
                              child: Row(
                                children: [
                                  Divider(
                                    height: AppLayout.getHeight(90),
                                    color: AppColor.noColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 23,
                              child: jodTitle(jobTitleText: title[index])),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: ExpansionTile(
              trailing: CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColor.hintColor.withOpacity(0.1),
                  child: _employmentIcon
                      ? Icon(
                          CupertinoIcons.arrow_turn_up_left,
                          size: 18,
                          color: AppColor.primaryColor.withOpacity(0.8),
                        )
                      : const Icon(
                          CupertinoIcons.arrow_turn_right_down,
                          color: AppColor.primaryColor,
                          size: 18,
                        )),
              title: InkWell(
                //onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Card(
                            elevation: 0,
                            color: AppColor.primaryColor.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault)),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Center(
                                child: Icon(
                                  Icons.verified_user_outlined,
                                  color: AppColor.primaryColor.withOpacity(0.8),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: AppLayout.getWidth(12),
                        ),
                        Text(
                          AppString.text_employment,
                          style: AppStyle.small_text_black.copyWith(
                              fontSize: Dimensions.fontSizeSmall + 3,
                              color: AppColor.normalTextColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onExpansionChanged: (bool expanded) {
                setState(() => _employmentIcon = expanded);
              },
              children: [
                SizedBox(
                  height: AppLayout.getHeight(18),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0, bottom: 18),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: title.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: DottedBorder(
                              customPath: (p0) => Path()..lineTo(0, 98),
                              color: AppColor.disableColor,
                              dashPattern: const [6, 4],
                              strokeWidth: 1,
                              child: Row(
                                children: [
                                  Divider(
                                    height: AppLayout.getHeight(90),
                                    color: AppColor.noColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 23,
                              child: jodTitle(jobTitleText: title[index])),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
