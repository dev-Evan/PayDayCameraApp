import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/salary_overview_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/dotted_view.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/custom_spacer.dart';
import '../widget/more_widget.dart';

class SalaryOverView extends GetView<SalaryOverviewController> {
  SalaryOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: const CustomAppbar(),
        body: controller.obx(
            (state) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customMoreAppbar(
                          titleText: AppString.text_salary_overview),
                      controller.salaryOverView.data != null &&
                              controller.salaryOverView.data!.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: AppLayout.getWidth(20),
                                  right: AppLayout.getWidth(20),
                                  top: AppLayout.getHeight(20),
                                  bottom: AppLayout.getHeight(20)),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.text_basic_salary,
                                      style: AppStyle.mid_large_text.copyWith(
                                          color: AppColor.normalTextColor,
                                          fontSize: Dimensions.fontSizeMid,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      controller.salaryOverView.data?.first
                                                  .basicSalary ==
                                              true
                                          ? controller.salaryOverView.data
                                                  ?.first.amount
                                                  .toString() ??
                                              ""
                                          : "",
                                      style: AppStyle.small_text_black
                                          .copyWith(color: AppColor.hintColor),
                                    ),
                                    customSpacerHeight(height: 16),
                                    _jobHisTitleView()
                                  ],
                                ),
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  customSpacerHeight(height: 158),
                                  logoView(
                                    height: 170,
                                    width: 170,
                                    url: Images.no_data_found,
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
            onLoading: const LoadingIndicator()));
  }
}

Widget _jobHisTitleView() {
  return Padding(
    padding: EdgeInsets.only(
        left: AppLayout.getWidth(8), bottom: AppLayout.getHeight(18)),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          Get.find<SalaryOverviewController>().salaryOverView.data?.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: AppLayout.getWidth(23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _salaryCardTitleView(
                            titleText: Get.find<SalaryOverviewController>()
                                    .salaryOverView
                                    .data?[index]
                                    .level ??
                                "",
                            dotIconColor: Get.find<SalaryOverviewController>()
                                        .salaryOverView
                                        .data?[index] ==
                                    0
                                ? AppColor.primaryColor
                                : AppColor.disableColor),
                        customSpacerHeight(height: 6),
                        _salaryCardView(
                            iconText: Get.find<SettingController>()
                                    .basicInfo
                                    ?.data
                                    .currencySymbol ??
                                "\$",
                            salaryText: Get.find<SalaryOverviewController>()
                                    .salaryOverView
                                    .data?[index]
                                    .amount
                                    .toString() ??
                                ""),
                      ],
                    ),
                  ],
                )),
          ],
        );
      },
    ),
  );
}

Widget _salaryCardView({iconText, salaryText}) {
  return Padding(
    padding: EdgeInsets.only(left: AppLayout.getWidth(16)),
    child: Row(
      children: [
        cardShape(icon: Images.credit_card),
        customSpacerWidth(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  iconText,
                  style: AppStyle.mid_large_text.copyWith(
                      color: AppColor.normalTextColor.withOpacity(0.7),
                      fontSize: Dimensions.fontSizeDefault + 2,
                      fontWeight: FontWeight.w800),
                ),
                customSpacerWidth(width: 4),
                Text(
                  salaryText,
                  style: AppStyle.mid_large_text.copyWith(
                      color: AppColor.normalTextColor.withOpacity(0.7),
                      fontSize: Dimensions.fontSizeDefault + 2,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _salaryCardTitleView(
    {titleText, Color dotIconColor = AppColor.disableColor}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.circle,
        size: 10,
        color: dotIconColor,
      ),
      Padding(
        padding: EdgeInsets.only(left: AppLayout.getWidth(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_titleText(titleTextS: titleText)],
        ),
      ),
    ],
  );
}

Widget _titleText({titleTextS}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titleTextS,
        style: AppStyle.mid_large_text.copyWith(
          color: AppColor.hintColor,
          fontSize: Dimensions.fontSizeExtraDefault,
        ),
      ),
    ],
  );
}
