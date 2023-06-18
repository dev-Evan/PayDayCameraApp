import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
            dottedSalaryView(),
            Positioned(
              top: 0,
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
                                : AppColor.disableColor,

                        firstIndex: Get.find<SalaryOverviewController>()
                            .salaryOverView
                            .data?.first
                            .level ??
                            ""
                        ),
                        customSpacerHeight(height: 6),
                        _salaryRow(
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





                        _salaryCardView()








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

Widget _salaryRow({iconText, salaryText}) {
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
                      color: AppColor.normalTextColor,
                      fontSize: Dimensions.fontSizeDefault + 2,
                      fontWeight: FontWeight.w500),
                ),
                customSpacerWidth(width: 4),
                Text(
                  salaryText,
                  style: AppStyle.mid_large_text.copyWith(
                      color: AppColor.normalTextColor,
                      fontSize: Dimensions.fontSizeDefault + 2,
                      fontWeight: FontWeight.w500),
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
    {titleText, Color dotIconColor = AppColor.disableColor, required firstIndex}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      firstIndex !=null?
      Icon(
        Icons.circle,
        size: 10,
        color: AppColor.primaryColor,
      ):Icon(
        Icons.circle,
        size: 10,
        color: AppColor.disableColor,
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

Widget _salaryCardView(){
  return Container(
    margin: EdgeInsets.only(left: 20,top: 4),
    height: AppLayout.getHeight(120),
    width: AppLayout.getWidth(280),
    decoration: AppStyle.ContainerStyle.copyWith(color: AppColor.primaryColor.withOpacity(0.1),
    borderRadius: borderRadius
    ),
    child: Container(
      margin: EdgeInsets.only(left: AppLayout.getWidth(12),right:AppLayout.getWidth(12),top: AppLayout.getHeight(12),bottom:  AppLayout.getHeight(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Will be effective form ${"10 Jun 2023"} ",style: cardTitleStyle,),
          customSpacerHeight(height: 8),
          textSpan

        ],
      ),
    ),
  );
}



RichText get  textSpan{
  return RichText(
    overflow: TextOverflow.clip,
    text: new TextSpan(
      children: <TextSpan>[
         TextSpan(text: "${GetStorage().read(AppString.USER_NAME)}",style: cardDynamicTextStyle),
        TextSpan(text: " has awarded a salary\n",style: cardSubTextStyle),
        TextSpan(text: "increment from ",style: cardSubTextStyle),
        TextSpan(text: "${'\$30,0000'}",style: cardDynamicTextStyle),
        TextSpan(text: " to ",style: cardSubTextStyle),
        TextSpan(text: "${'\$30,0000\n'}",style: cardDynamicTextStyle),
        TextSpan(text: " on ${"12 NoV 2022"}",style: cardSubTextStyle),

      ],
    ),
  );
}








TextStyle get cardTitleStyle{
  return  AppStyle.small_text_grey.copyWith(color: AppColor.successColor.withOpacity(0.7),letterSpacing: 1,fontWeight: FontWeight.w500);
}
TextStyle get cardSubTextStyle{
  return  AppStyle.small_text_grey.copyWith(color: AppColor.hintColor,fontWeight: FontWeight.w100);
}
TextStyle get cardDynamicTextStyle{
  return  AppStyle.small_text_grey.copyWith(color: AppColor.primaryColor,fontWeight: FontWeight.w500);
}

BorderRadius get  borderRadius{
  return BorderRadius.circular(Dimensions.radiusDefault-1);
}