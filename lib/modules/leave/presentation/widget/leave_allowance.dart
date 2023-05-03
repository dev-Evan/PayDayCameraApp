import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/page_view_layout.dart';

import '../../../../common/custom_spacer.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../controller/leave_controller.dart';

Widget leaveAllowance() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
        child: Row(children: [
          pageViewLayout(
              title: AppString.text_availablity,
              data: Get.find<LeaveController>().leaveAllowance.data),
          customSpacerWidth(width: 20),
          pageViewLayout(
              title: AppString.text_taken,
              data: Get.find<LeaveController>().leaveAllowance.data),
        ]),
      ),
    );
