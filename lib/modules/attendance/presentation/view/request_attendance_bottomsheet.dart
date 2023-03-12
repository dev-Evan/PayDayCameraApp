import 'package:flutter/material.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/custom_app_button.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimensions.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../widget/date_picaker.dart';

class RequestAttendanceBottomSheet extends StatelessWidget {
  const RequestAttendanceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .8,
      maxChildSize: .8,
      minChildSize: .5,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: Stack(
          children: [
            ListView(
              controller: scrollController,
              children: [
                bottomSheetAppbar(
                    context: context,
                    appbarTitle: AppString.text_request_attendance),
                SizedBox(
                  height: AppLayout.getHeight(Dimensions.paddingLarge),
                ),
                _contentLayout(context),
                SizedBox(
                  height: AppLayout.getHeight(60),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buttonLayout(context),
            )
          ],
        ),
      ),
    );
  }

  _contentLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(Dimensions.paddingLarge),
          horizontal: AppLayout.getWidth(Dimensions.paddingLarge)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dateEntry(context),
        ],
      ),
    );
  }

  _buttonLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppLayout.getWidth(Dimensions.paddingLarge),
        right: AppLayout.getWidth(Dimensions.paddingLarge),
        bottom: AppLayout.getHeight(Dimensions.paddingLarge),
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _cancelButton(context),
          SizedBox(width: AppLayout.getWidth(10)),
          _requestButton(context),
        ],
      ),
    );
  }

  _requestButton(BuildContext context) {
    return AppButton(
      buttonColor: AppColor.primary_blue,
      buttonText: AppString.text_request,
      onPressed: () {},
    );
  }

  _cancelButton(BuildContext context) {
    return AppButton(
      buttonText: AppString.text_cancel,
      onPressed: () => Navigator.of(context).pop(),
      buttonColor: Colors.transparent,
      hasOutline: true,
      borderColor: Colors.black,
      textColor: Colors.black,
    );
  }

  _dateEntry(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.text_date,
          style: AppStyle.normal_text_grey,
        ),
        SizedBox(
          height: AppLayout.getHeight(Dimensions.radiusDefault),
        ),
        _dateInputField(context)
      ],
    );
  }

  _dateInputField(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          border: Border.all(color: AppColor.light_grey, width: 1),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(Dimensions.paddingDefaultExtra),
          vertical: AppLayout.getHeight(Dimensions.paddingDefault),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppString.text_select_date,
                style: AppStyle.normal_text_grey
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: AppLayout.getWidth(16),
              )
            ]),
      ),
      onTap: () => _openCalendar(context),
    );
  }

  _openCalendar(BuildContext context) async {
    return await showDatePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      initialDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendar,
    );
  }
}
