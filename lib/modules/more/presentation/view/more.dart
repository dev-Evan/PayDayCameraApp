import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/more_data_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/salary_overview_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/more_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/profile_container_layout.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../../../common/widget/custom_spacer.dart';

class MoreScreen extends GetView<ProfileDataController> {
  MoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getUserData();
    return controller.obx(
        (state) => Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => profileCardLayOut(
                            context: context,
                            userImage: controller
                                        .userProfile.data?.profilePictureUrl ==
                                    null
                                ? AssetImage(Images.user)
                                : NetworkImage(controller
                                        .userProfile.data?.profilePictureUrl ??
                                    ""),
                            userName: controller.userProfile.data?.fullName
                                    .toString() ??
                                "",
                            userEmail:
                                controller.userProfile.data?.email.toString() ??
                                    "",
                            statusText: controller.userProfile.data?.userStatus
                                    .toString() ??
                                "",
                          ),
                        ),
                        Expanded(
                            flex: 14,
                            child: Container(
                              color: AppColor.backgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    jobDeskTitle(text: AppString.text_job_desk),
                                    jobDeskCard(
                                        cardIcon: Images.folder,
                                        cardText: AppString.text_documents,
                                        onAction: () async {
                                          Get.toNamed(AppString.documentScreen);
                                          await Get.find<DocumentController>()
                                              .getDocumentData();
                                        }),
                                    jobDeskCard(
                                        cardIcon: Images.clock,
                                        cardText: AppString.text_job_history,
                                        onAction: () async {
                                          Get.toNamed(AppString.jobHistory);
                                          await Get.find<JobHistoryController>()
                                              .getJobHistoryData();
                                        }),
                                    jobDeskCard(
                                      cardIcon: Images.credit_card,
                                      cardText: AppString.text_salary_overview,
                                      onAction: () async {
                                        Get.toNamed(AppString.salaryOverView);
                                        await Get.find<
                                                SalaryOverviewController>()
                                            .getSalaryOveData();
                                        await Get.find<SettingController>()
                                            .getCurrencyData();
                                      },
                                    ),
                                    jobDeskCard(
                                      cardIcon: Images.department,
                                      cardText: AppString.text_bank_details,
                                      onAction: () async {
                                        Get.toNamed(AppString.bankDetails);
                                        await Get.find<MoreDataController>()
                                            .getBankInfo();
                                      },
                                    ),
                                    jobDeskCard(
                                        cardIcon: Images.location,
                                        cardText:
                                            AppString.text_address_details,
                                        onAction: () async {
                                          Get.toNamed(AppString.addressDetails);
                                          await Get.find<
                                                  AddressDetailsController>()
                                              .getEmployeeAddressData();
                                        }),
                                    customSpacerHeight(height: 20),
                                    jobDeskTitle(text: AppString.text_other),
                                    jobDeskCard(
                                      cardIcon: Images.note,
                                      cardText: AppString.text_about_this_app,
                                      onAction: () =>
                                          Get.toNamed(AppString.aboutPage),
                                    ),
                                    jobDeskCard(
                                      cardIcon: Images.log_out,
                                      cardText: AppString.text_log_out,
                                      onAction: () => CustomAlertDialog(
                                          context: context,
                                          icon: Icons.logout,
                                          yesText: AppString.text_log_out,
                                          iconBgColor: Colors.orange.shade50,
                                          yesAction: () =>
                                              Get.find<LogoutController>()
                                                  .logOut()),
                                    ),
                                    languageCardView(
                                        langName: AppString.text_english,
                                        langText: AppString.text_language),
                                    customSpacerHeight(height: 30),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
        onLoading: const LoadingIndicator());
  }
}
