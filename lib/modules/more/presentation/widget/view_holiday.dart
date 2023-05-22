import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_divider.dart';
import 'package:pay_day_mobile/enum/range_calendar_method_imp.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/selected_range_calender.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class ViewHoliday extends StatefulWidget {
  const ViewHoliday({Key? key}) : super(key: key);
  @override
  State<ViewHoliday> createState() => _ViewHolidayState();
}
class _ViewHolidayState extends State<ViewHoliday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                customMoreAppbar(titleText: AppString.text_holiday),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => customButtomSheet(
                            context: context,
                            height: 0.9,
                            child: SelectRangeCalender(
                              rangeCalendarMethodImp:
                                  RangeCalendarMethodImp.VIEW_HOLIDAY,
                            )),
                        child: Row(
                          children: [
                            Text(
                              AppString.text_this_year,
                              style: AppStyle.mid_large_text.copyWith(
                                  color: AppColor.normalTextColor,
                                  fontSize: Dimensions.fontSizeMid - 3,
                                  fontWeight: FontWeight.w700),
                            ),

                            customSpacerWidth(width: 4),
                            const Icon(
                              Icons.expand_more,
                              color: AppColor.hintColor,
                            ),
                          ],
                        ),
                      ),
                      customSpacerHeight(height: 2),
                      Text(
                        AppString.text_2022,
                        style: AppStyle.small_text_black
                            .copyWith(color: AppColor.hintColor),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Text(
                  AppString.text_february_2022,
                  style: AppStyle.small_text_black
                      .copyWith(color: AppColor.hintColor),
                )),
                holidaysList()
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget holidaysList() {
  return ListView.builder(
    itemCount: 33,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "10",
                        style: AppStyle.mid_large_text.copyWith(
                            color: AppColor.normalTextColor,
                            fontSize: Dimensions.fontSizeExtraLarge,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "Dec",
                        style: AppStyle.small_text.copyWith(
                            color: AppColor.hintColor,
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                    ],
                  ),
                  CustomDiveider(25, 1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Martyrs' day",
                        style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.secondaryColor,
                          fontSize: Dimensions.fontSizeDefault + 2,
                        ),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(6),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: AppColor.hintColor.withOpacity(0.6),
                            size: Dimensions.fontSizeDefault + 2,
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(3),
                          ),
                          Text(
                            "9h",
                            style: AppStyle.mid_large_text.copyWith(
                                color: AppColor.hintColor.withOpacity(0.7),
                                fontSize: Dimensions.fontSizeDefault + 2,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: AppLayout.getWidth(12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                      backgroundColor:
                          AppColor.backgroundColor.withOpacity(0.2),
                      radius: 14,
                      child: const Icon(
                        Icons.done,
                        color: AppColor.primaryColor,
                        size: 16,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CustomDiveider(
                  AppLayout.getHeight(0.6), MediaQuery.of(context).size.width),
            )
          ],
        ),
      );
    },
  );
}
