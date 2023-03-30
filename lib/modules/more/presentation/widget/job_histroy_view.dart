import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            padding: EdgeInsets.only(
                top: AppLayout.getHeight(Dimensions.fontSizeSmall)),
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
                              customPath: (p0) =>
                              Path()
                                ..lineTo(0, 98),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: AppColor.disableColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title[index],
                                                style: AppStyle.mid_large_text
                                                    .copyWith(
                                                  color:
                                                  AppColor.normalTextColor,
                                                  fontSize: Dimensions
                                                      .fontSizeDefault +
                                                      2,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .access_time_outlined,
                                                      color: AppColor.hintColor
                                                          .withOpacity(0.6),
                                                      size: Dimensions
                                                          .fontSizeDefault +
                                                          2,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                      AppLayout.getWidth(3),
                                                    ),
                                                    Text(
                                                      AppString
                                                          .text_11_jan_2023,
                                                      style: AppStyle
                                                          .mid_large_text
                                                          .copyWith(
                                                          color: AppColor
                                                              .hintColor
                                                              .withOpacity(
                                                              0.7),
                                                          fontSize: Dimensions
                                                              .fontSizeDefault +
                                                              2,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    ),
                                                    SizedBox(
                                                      width: AppLayout.getWidth(
                                                          12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppLayout.getHeight(6),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 23,
            bottom: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.circle,
                  size: 10,
                  color: AppColor.disableColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppString.text_ui_designer,
                            style:
                            AppStyle.mid_large_text.copyWith(
                              color: AppColor.secondaryColor,
                              fontSize:
                              Dimensions.fontSizeDefault + 2,
                            ),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(6),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: AppColor.hintColor
                                    .withOpacity(0.6),
                                size: Dimensions.fontSizeDefault +
                                    2,
                              ),
                              SizedBox(
                                width: AppLayout.getWidth(3),
                              ),
                              Text(
                                AppString.text_11_jan_2023,
                                style: AppStyle.mid_large_text
                                    .copyWith(
                                    color: AppColor.hintColor
                                        .withOpacity(0.7),
                                    fontSize: Dimensions
                                        .fontSizeDefault +
                                        2,
                                    fontWeight:
                                    FontWeight.w500),
                              ),
                              SizedBox(
                                width: AppLayout.getWidth(12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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