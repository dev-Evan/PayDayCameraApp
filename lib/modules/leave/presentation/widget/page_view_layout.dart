import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/modules/leave/domain/leave_allowance.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

// Widget pageViewLayout({required String title, Data? data}) {
//   return title.startsWith(AppString.text_availablity)
//       ? Container(
//           width: AppLayout.getWidth(252),
//           height: AppLayout.getHeight(120),
//           decoration: AppStyle.ContainerStyle.copyWith(
//               borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
//               color: AppColor.cardColor.withOpacity(0.1),
//               border: Border.all(
//                   width: 1, color: AppColor.cardColor.withOpacity(0.2))),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: AppStyle.large_text.copyWith(
//                     color: AppColor.backgroundColor,
//                     fontSize: Dimensions.fontSizeMid - 6,
//                     letterSpacing: 2,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//                 SizedBox(
//                   height: AppLayout.getHeight(8),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(2.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             AppString.text_casual,
//                             style: AppStyle.normal_text.copyWith(
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColor.backgroundColor,
//                                 fontSize: Dimensions.fontSizeDefault - 1),
//                           ),
//                           SizedBox(
//                             height: AppLayout.getHeight(4),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 data?.casual?.paid?.availability ?? "",
//                                 style: AppStyle.normal_text.copyWith(
//                                     fontWeight: FontWeight.w700,
//                                     color: AppColor.backgroundColor,
//                                     fontSize: Dimensions.fontSizeDefault - 1),
//                               ),
//                               SizedBox(
//                                 width: AppLayout.getWidth(8),
//                               ),
//                               Text(
//                                 AppString.text_paid,
//                                 style: AppStyle.normal_text.copyWith(
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.backgroundColor,
//                                     fontSize: Dimensions.fontSizeDefault - 1),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: AppLayout.getHeight(4),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 data?.casual?.unpaid?.availability ?? "",
//                                 style: AppStyle.normal_text.copyWith(
//                                     fontWeight: FontWeight.w700,
//                                     color: AppColor.backgroundColor,
//                                     fontSize: Dimensions.fontSizeDefault - 1),
//                               ),
//                               SizedBox(
//                                 width: AppLayout.getWidth(8),
//                               ),
//                               Text(
//                                 AppString.text_unpaid,
//                                 style: AppStyle.normal_text.copyWith(
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.backgroundColor,
//                                     fontSize: Dimensions.fontSizeDefault - 1),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           AppString.text_sick,
//                           style: AppStyle.normal_text.copyWith(
//                               fontWeight: FontWeight.w400,
//                               color: AppColor.backgroundColor,
//                               fontSize: Dimensions.fontSizeDefault - 1),
//                         ),
//                         SizedBox(
//                           height: AppLayout.getHeight(6),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               data?.sick?.paid?.availability ?? "",
//                               style: AppStyle.normal_text.copyWith(
//                                   fontWeight: FontWeight.w700,
//                                   color: AppColor.backgroundColor,
//                                   fontSize: Dimensions.fontSizeDefault - 1),
//                             ),
//                             SizedBox(
//                               width: AppLayout.getWidth(8),
//                             ),
//                             Text(
//                               AppString.text_paid,
//                               style: AppStyle.normal_text.copyWith(
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColor.backgroundColor,
//                                   fontSize: Dimensions.fontSizeDefault - 1),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: AppLayout.getHeight(6),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               data?.casual?.unpaid?.availability ?? "",
//                               style: AppStyle.normal_text.copyWith(
//                                   fontWeight: FontWeight.w700,
//                                   color: AppColor.backgroundColor,
//                                   fontSize: Dimensions.fontSizeDefault - 1),
//                             ),
//                             SizedBox(
//                               width: AppLayout.getWidth(8),
//                             ),
//                             Text(
//                               AppString.text_unpaid,
//                               style: AppStyle.normal_text.copyWith(
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColor.backgroundColor,
//                                   fontSize: Dimensions.fontSizeDefault - 1),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       : Container(
//           width: AppLayout.getWidth(252),
//           height: AppLayout.getHeight(120),
//           decoration: AppStyle.ContainerStyle.copyWith(
//               borderRadius: BorderRadius.circular(Dimensions.radiusDefault + 2),
//               color: AppColor.cardColor.withOpacity(0.1),
//               border: Border.all(
//                   width: 1, color: AppColor.cardColor.withOpacity(0.2))),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: AppStyle.large_text.copyWith(
//                     color: AppColor.backgroundColor,
//                     fontSize: Dimensions.fontSizeMid - 6,
//                     letterSpacing: 2,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//                 SizedBox(
//                   height: AppLayout.getHeight(8),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(2.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             AppString.text_casual,
//                             style: AppStyle.normal_text.copyWith(
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColor.backgroundColor,
//                                 fontSize: Dimensions.fontSizeDefault - 1),
//                           ),
//                           SizedBox(
//                             height: AppLayout.getHeight(4),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 data?.casual?.paid?.taken ?? "",
//                                 style: AppStyle.normal_text.copyWith(
//                                     fontWeight: FontWeight.w700,
//                                     color: AppColor.backgroundColor,
//                                     fontSize: Dimensions.fontSizeDefault - 1),
//                               ),
//                               SizedBox(
//                                 width: AppLayout.getWidth(8),
//                               ),
//                               Text(
//                                 AppString.text_paid,
//                                 style: AppStyle.normal_text.copyWith(
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.backgroundColor,
//                                     fontSize: Dimensions.fontSizeDefault - 1),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: AppLayout.getHeight(4),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 data?.casual?.unpaid?.taken ?? "",
//                                 style: AppStyle.normal_text.copyWith(
//                                     fontWeight: FontWeight.w700,
//                                     color: AppColor.backgroundColor,
//                                     fontSize: Dimensions.fontSizeDefault - 1),
//                               ),
//                               SizedBox(
//                                 width: AppLayout.getWidth(8),
//                               ),
//                               Text(
//                                 AppString.text_unpaid,
//                                 style: AppStyle.normal_text.copyWith(
//                                     fontWeight: FontWeight.w400,
//                                     color: AppColor.backgroundColor,
//                                     fontSize: Dimensions.fontSizeDefault - 1),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           AppString.text_sick,
//                           style: AppStyle.normal_text.copyWith(
//                               fontWeight: FontWeight.w400,
//                               color: AppColor.backgroundColor,
//                               fontSize: Dimensions.fontSizeDefault - 1),
//                         ),
//                         SizedBox(
//                           height: AppLayout.getHeight(6),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               data?.sick?.paid?.taken ?? "",
//                               style: AppStyle.normal_text.copyWith(
//                                   fontWeight: FontWeight.w700,
//                                   color: AppColor.backgroundColor,
//                                   fontSize: Dimensions.fontSizeDefault - 1),
//                             ),
//                             SizedBox(
//                               width: AppLayout.getWidth(8),
//                             ),
//                             Text(
//                               AppString.text_paid,
//                               style: AppStyle.normal_text.copyWith(
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColor.backgroundColor,
//                                   fontSize: Dimensions.fontSizeDefault - 1),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: AppLayout.getHeight(6),
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               data?.casual?.unpaid?.taken ?? "",
//                               style: AppStyle.normal_text.copyWith(
//                                   fontWeight: FontWeight.w700,
//                                   color: AppColor.backgroundColor,
//                                   fontSize: Dimensions.fontSizeDefault - 1),
//                             ),
//                             SizedBox(
//                               width: AppLayout.getWidth(8),
//                             ),
//                             Text(
//                               AppString.text_unpaid,
//                               style: AppStyle.normal_text.copyWith(
//                                   fontWeight: FontWeight.w400,
//                                   color: AppColor.backgroundColor,
//                                   fontSize: Dimensions.fontSizeDefault - 1),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
// }
