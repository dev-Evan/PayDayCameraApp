import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../widget/job_histroy_view.dart';

class JodHistory extends StatelessWidget {
   JodHistory({Key? key}) : super(key: key);
  JobHistoryController jobHistoryController=Get.put(JobHistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customMoreAppbar(titleText: AppString.text_job_history),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppLayout.getHeight(Dimensions.paddingLarge),
                      horizontal: AppLayout.getWidth(Dimensions.paddingLarge),
                    ),
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
                          jobHistoryController.jobHistoryModel?.data?.joiningDate.toString() ??"Demo",
                          style: AppStyle.small_text_black
                              .copyWith(color: AppColor.hintColor),
                        ),
                      ],
                    ),
                  ),
                  const JobHistoryView(),
                ],
              )
            ],
          ),
        ));
  }
}
