import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:table_calendar/table_calendar.dart';

class JodHistory extends StatefulWidget {
  const JodHistory({Key? key}) : super(key: key);

  @override
  State<JodHistory> createState() => _JodHistoryState();
}

class _JodHistoryState extends State<JodHistory> {
  bool _customIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customMoreAppbar(titleText: AppString.text_job_history),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.text_joining_date,
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeMid,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        AppString.text_01_jan_1998,
                        style: AppStyle.small_text_black
                            .copyWith(color: AppColor.hintColor),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ExpansionTile(
                      trailing: CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColor.hintColor.withOpacity(0.1),
                          child: _customIcon
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
                                    color:
                                        AppColor.primaryColor.withOpacity(0.1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radiusDefault)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Center(
                                        child: Icon(
                                          Icons.text_snippet_outlined,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: AppLayout.getWidth(12),
                                ),
                                Text(
                                  AppString.text_about_this_app,
                                  style: AppStyle.small_text_black.copyWith(
                                      fontSize: Dimensions.fontSizeSmall + 2,
                                      color: AppColor.normalTextColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customIcon = expanded);
                      },
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 28.0),
                              child: DottedBorder(
                                customPath: (p0) => Path()..lineTo(0, 100),
                                color: Colors.black,
                                strokeWidth: 1,
                                child: const Divider(
                                  height: 100,
                                ),
                              ),
                            ),
                            Positioned(child: Icon(Icons.circle)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
