import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_histroy_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class JodHistory extends GetView<JobHistoryController> {
  JodHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        body: controller.obx(
          (state) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customMoreAppbar(titleText: AppString.text_job_history),
                controller.jobHistoryModel.data !=null?

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
                          _joiningDateText(),
                          _joiningDateSubText(
                              text: controller.jobHistoryModel.data?.joiningDate
                                      .toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    const JobHistoryView(),
                  ],
                ):Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customSpacerHeight(height: 158),
                      svgIcon(
                        height: 130,
                        width: 130,
                        url: Images.error_404,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          onLoading: const LoadingIndicator(),
        ));
  }
}

Widget _joiningDateText() {
  return Text(
    AppString.text_joining_date,
    style: AppStyle.mid_large_text.copyWith(
        color: AppColor.normalTextColor,
        fontSize: Dimensions.fontSizeMid,
        fontWeight: FontWeight.w700),
  );
}

Widget _joiningDateSubText({required text}) {
  return Text(text,
      style: AppStyle.small_text_black.copyWith(color: AppColor.hintColor));
}
