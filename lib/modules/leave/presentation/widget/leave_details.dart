import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_double_button.dart';
import 'package:pay_day_mobile/common/widget/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/leave/presentation/widget/edit_details.dart';
import 'package:pay_day_mobile/modules/payslip/presentation/widget/payslip_view.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class LeaveDetails extends StatelessWidget {
  const LeaveDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bottomSheetAppbar(
              appbarTitle: AppString.text_leave_details, context: context),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppString.text_paid_casual,
                          style: AppStyle.title_text.copyWith(
                              color: AppColor.normalTextColor,
                              fontSize: Dimensions.fontSizeMid),
                        ),
                        SizedBox(
                          width: AppLayout.getWidth(12),
                        ),
                        CustomStatusButton(
                          textColor: AppColor.pendingTextColor,
                          bgColor: AppColor.pendingBgColor.withOpacity(0.2),
                          text: AppString.text_pending,
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () => customButtomSheet(
                            context: context,
                            height: 0.9,
                            child: const EditDetails()),
                        icon: const Icon(
                          Icons.edit_document,
                          color: AppColor.hintColor,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppString.text_3_hour,
                      style: AppStyle.normal_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: AppColor.hintColor,
                      ),
                    ),
                    Text(
                      '11.00 am - 1.00 pm',
                      style: AppStyle.normal_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeDefault),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(12),
                ),
                Text(
                  '14 Nov 2022',
                  style: AppStyle.title_text.copyWith(
                      color: AppColor.normalTextColor,
                      fontSize: Dimensions.fontSizeDefault),
                ),
                SizedBox(
                  height: AppLayout.getHeight(4),
                ),
                Text(
                  'Feeling abdominal pain. Need to consult a doctor',
                  style: AppStyle.normal_text.copyWith(
                      color: AppColor.normalTextColor,
                      fontSize: Dimensions.fontSizeDefault),
                ),
                SizedBox(
                  height: AppLayout.getHeight(28),
                ),
                Text(
                  AppString.text_two_attachments,
                  style: AppStyle.title_text.copyWith(
                      color: AppColor.hintColor,
                      fontSize: Dimensions.fontSizeDefault - 1),
                ),
                SizedBox(
                  height: AppLayout.getHeight(8),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: AppLayout.getHeight(64),
                          width: AppLayout.getWidth(164),
                          decoration: AppStyle.ContainerStyle.copyWith(
                            image: DecorationImage(
                                image: AssetImage(
                                  Images.documents,
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(Dimensions.radiusDefault),
                                topLeft:
                                    Radius.circular(Dimensions.radiusDefault)),
                          ),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(8),
                        ),
                        Text('Medical \nCertificate.jpg',
                            style: AppStyle.normal_text
                                .copyWith(color: AppColor.normalTextColor)),
                        Text('12 MB',
                            style: AppStyle.normal_text.copyWith(
                                color: AppColor.hintColor,
                                fontSize: Dimensions.fontSizeDefault - 2)),
                      ],
                    ),
                    SizedBox(
                      width: AppLayout.getWidth(16),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppLayout.getHeight(64),
                          width: AppLayout.getWidth(164),
                          decoration: AppStyle.ContainerStyle.copyWith(
                            image: DecorationImage(
                                image: AssetImage(
                                  Images.documents,
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(Dimensions.radiusDefault),
                                topLeft:
                                    Radius.circular(Dimensions.radiusDefault)),
                          ),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(8),
                        ),
                        Text('Doctors Slip\n pdf',
                            style: AppStyle.normal_text
                                .copyWith(color: AppColor.normalTextColor)),
                        Text('12 MB',
                            style: AppStyle.normal_text.copyWith(
                                color: AppColor.hintColor,
                                fontSize: Dimensions.fontSizeDefault - 2)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(18),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: AppStyle.ContainerStyle.copyWith(
                        color: AppColor.disableColor.withOpacity(0.2),
                      ),
                      width: AppLayout.getWidth(140),
                      height: AppLayout.getHeight(120),
                      child: const Center(
                        child: Icon(
                          Icons.picture_as_pdf_outlined,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppLayout.getHeight(8),
                    ),
                    Text('Doctors Slip\npdf',
                        style: AppStyle.normal_text
                            .copyWith(color: AppColor.normalTextColor)),
                    Text('12 MB',
                        style: AppStyle.normal_text.copyWith(
                            color: AppColor.hintColor,
                            fontSize: Dimensions.fontSizeDefault - 2)),
                  ],
                ),
              ],
            ),
          ),

          customDoubleButton(
              textBtnText: AppString.text_cancel_leave,
              elevatedBtnText: AppString.text_log_response,
              context: context,
              elevatedButtonAction: () {},
              textButtonAction: () => Get.back())
        ],
      ),
    );
  }
}




