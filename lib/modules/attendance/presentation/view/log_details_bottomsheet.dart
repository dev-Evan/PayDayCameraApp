import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';

import '../../../../common/custom_app_button.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/dimensions.dart';
import '../widget/bottom_sheet_appbar.dart';
import '../widget/log_details_bottom_sheet_content.dart';

class LogDetailsBottomSheet extends StatelessWidget {
  const LogDetailsBottomSheet({Key? key}) : super(key: key);

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
                bottomSheetAppbar(context: context,appbarTitle: AppString.text_log_details),
                Divider(color: Colors.grey.shade200, thickness: 1),
                contentLayout(),
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
          _cancelButton(),
          SizedBox(width: AppLayout.getWidth(10)),
          _editButton(),
        ],
      ),
    );
  }

  _editButton() {
    return AppButton(
      buttonColor: AppColor.primary_blue,
      buttonText: AppString.text_edit,
      onPressed: () {},
    );
  }

  _cancelButton() {
    return AppButton(
      buttonText: AppString.text_cancel,
      onPressed: () {},
      buttonColor: Colors.transparent,
      hasOutline: true,
      borderColor: Colors.black,
      textColor: Colors.black,
    );
  }
}
