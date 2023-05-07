import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_histroy_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../utils/app_layout.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_style.dart';
import '../controller/job_history_controller.dart';
import '../widget/documents_appbar.dart';


class JodHistory extends GetView<JobHistoryController> {
  JodHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getJobHistoryData();
    return  Scaffold(
                appBar: const CustomAppbar(),
                body: controller.obx((state) => SingleChildScrollView(
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
                                  controller.jobHistoryModel?.data?.joiningDate.toString() ??"",
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
                ),
                    onLoading: const LoadingIndicator(),

                )



    );
  }
}