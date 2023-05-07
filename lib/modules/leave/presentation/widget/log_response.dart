import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../../../common/widget/custom_app_button.dart';
import '../../../../utils/app_string.dart';
import '../../../attendance/presentation/widget/bottom_sheet_appbar.dart';

class LogResponse extends StatelessWidget {
  const LogResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bottomSheetAppbar(
                  appbarTitle: AppString.text_leave_response, context: context),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getWidth(20),
                    vertical: AppLayout.getHeight(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _leaveStatusDetailsLayout(),
                    customSpacerHeight(height: 20),
                    _leaveDateAndReason(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(20),
                  vertical: AppLayout.getHeight(10)),
              child: _cancelButton(),
            )),
      ],
    );
  }

  _leaveStatusDetailsLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Paid Leave",
              style: AppStyle.extra_large_text_black
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            customSpacerHeight(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.watch_later_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                customSpacerWidth(width: 4),
                Text("3d",
                    style:
                        AppStyle.small_text_black.copyWith(color: Colors.grey)),
                customSpacerWidth(width: 20),
                Image.asset(Images.attachment_file,
                    height: AppLayout.getWidth(12),
                    width: AppLayout.getHeight(12)),
                customSpacerWidth(width: 4),
                Text("3",
                    style:
                        AppStyle.small_text_black.copyWith(color: Colors.grey)),
              ],
            ),
          ],
        ),
        CustomStatusButton(
            bgColor: Colors.green, textColor: Colors.white, text: "Approved"),
      ],
    );
  }
}

_leaveDateAndReason() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leaveDate(),
        customSpacerHeight(height: 8),
        _leaveReason(),
      ],
    );

_leaveReason() => Text(
      "Feeling abdominal pain. Need to consult a doctor",
      style: AppStyle.normal_text_black,
    );

_leaveDate() => Text(
      "14 Nov 2022 - 17 Nov 2022",
      style: AppStyle.normal_text_black.copyWith(fontWeight: FontWeight.bold),
    );

_cancelButton() {
  return Row(
    children: [
      AppButton(
        onPressed: () => Get.back(),
        isButtonExpanded: true,
        buttonText: AppString.text_back,
        buttonColor: AppColor.primary_blue,
        textColor: Colors.white,
      ),
    ],
  );
}
