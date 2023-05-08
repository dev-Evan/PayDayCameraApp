import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/utils/app_string.dart';

import '../../../../common/widget/loading_indicator.dart';
import '../../../attendance/presentation/widget/bottom_sheet_appbar.dart';
import '../controller/notication_controller.dart';

class Notifications extends GetView<NotificationController> {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .9,
        maxChildSize: .9,
        minChildSize: .5,
        builder: (BuildContext context, ScrollController scrollController) =>
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16))),
              child: ListView(
                controller: scrollController,
                children: [
                  bottomSheetAppbar(
                      context: context,
                      appbarTitle: AppString.text_notications),
                ],
              ),
            ));
  }

  _contentLayout() => ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Text("Test Data"),
      );
}
