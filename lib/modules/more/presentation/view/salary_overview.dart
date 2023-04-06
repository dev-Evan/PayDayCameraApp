// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:pay_day_mobile/common/custom_appbar.dart';
// import 'package:pay_day_mobile/common/custom_spacer.dart';
// import 'package:pay_day_mobile/modules/more/presentation/controller/salary_overview_controller.dart';
// import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
// import 'package:pay_day_mobile/modules/more/presentation/widget/dotted_view.dart';
// import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
// import 'package:pay_day_mobile/utils/app_color.dart';
// import 'package:pay_day_mobile/utils/app_layout.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
// import 'package:pay_day_mobile/utils/app_style.dart';
// import 'package:pay_day_mobile/utils/dimensions.dart';
//
// class SalaryOverView extends StatelessWidget {
//   SalaryOverView({Key? key}) : super(key: key);
//
//   SalaryOverviewController salaryOverviewController = Get.put(SalaryOverviewController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppbar(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             customMoreAppbar(titleText: AppString.text_salary_overview),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       AppString.text_basic_salary,
//                       style: AppStyle.mid_large_text.copyWith(
//                           color: AppColor.normalTextColor,
//                           fontSize: Dimensions.fontSizeMid,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     Text(
//                      salaryOverviewController.salaryOverView?.data?.first.basicSalary==true? salaryOverviewController
//                               .salaryOverView?.data?.first.amount
//                               .toString() ??
//                           "":"",
//                       style: AppStyle.small_text_black
//                           .copyWith(color: AppColor.hintColor),
//                     ),
//                     customSpacerHeight(height: 16),
//                     _jobHisTitleView()
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget _jobHisTitleView() {
//   SalaryOverviewController salaryOverviewController =
//       Get.put(SalaryOverviewController());
//   //SettingController settingController=Get.put(SettingController());
//
//   return Padding(
//     padding:  EdgeInsets.only(left: AppLayout.getWidth(8), bottom: 18),
//     child: ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: salaryOverviewController.salaryOverView?.data?.length,
//
//       itemBuilder: (context, index) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             dottedView(),
//             Positioned(
//                 left: 23,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _salaryCardTitleView(
//                           titleText: salaryOverviewController
//                                   .salaryOverView?.data?.first.level ??
//                               "",
//                           dotIconColor: salaryOverviewController
//                                       .salaryOverView?.message !=
//                                   null
//                               ? AppColor.primaryColor
//                               : AppColor.disableColor,
//                         ),
//                         SizedBox(
//                           height: AppLayout.getHeight(6),
//                         ),
//                         _salaryCardView(
//                            // iconText: settingController.basicInfo?.data.currencySymbol??"",
//                             salaryText: salaryOverviewController
//                                     .salaryOverView?.data?.first.amount .toString()??
//                                 ""),
//                       ],
//                     ),
//                   ],
//                 )),
//           ],
//         );
//       },
//     ),
//   );
// }
//
// Widget _salaryCardView({iconText, salaryText}) {
//   return Padding(
//     padding: EdgeInsets.only(left: AppLayout.getWidth(16)),
//     child: Row(
//       children: [
//         Card(
//             elevation: 0,
//             color: AppColor.primaryColor.withOpacity(0.1),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
//             child: Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Center(
//                 child: Text(
//                   iconText ?? "",
//                   style: TextStyle(color:AppColor.primaryColor.withOpacity(0.8)),
//                 ),
//               ),
//             )),
//         SizedBox(
//           width: AppLayout.getWidth(3),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               salaryText,
//               style: AppStyle.mid_large_text.copyWith(
//                   color: AppColor.normalTextColor.withOpacity(0.7),
//                   fontSize: Dimensions.fontSizeDefault + 2,
//                   fontWeight: FontWeight.w800),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// Widget _salaryCardTitleView(
//     {titleText, Color dotIconColor = AppColor.disableColor}) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Icon(
//         Icons.circle,
//         size: 10,
//         color: dotIconColor,
//       ),
//       Padding(
//         padding: EdgeInsets.only(left: AppLayout.getWidth(12)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [_titleText(titleTextS: titleText)],
//         ),
//       ),
//     ],
//   );
// }
//
// Widget _titleText({titleTextS}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         titleTextS,
//         style: AppStyle.mid_large_text.copyWith(
//           color: AppColor.hintColor,
//           fontSize: Dimensions.fontSizeExtraDefault,
//         ),
//       ),
//     ],
//   );
// }
