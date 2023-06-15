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
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/custom_spacer.dart';

class MoreScreen extends GetView<ProfileDataController> {
  MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     // controller.getUserData();

    });
    return controller.obx(
            (state) => Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileCardLayOut(
                        context: context,
                        userImage: controller
                            .userProfile.data?.profilePictureUrl.toString() ??
                            "",
                        userName: controller.userProfile.data?.fullName
                            .toString() ??
                            "",
                        userEmail:
                        controller.userProfile.data?.email.toString() ??
                            "",
                        statusText: controller.userProfile.data?.userStatus
                            .toString() ??
                            ""),
                    Expanded(
                        flex: 14,
                        child: Container(
                          color: AppColor.backgroundColor,
                          margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              jobDeskTitle(text: AppString.text_job_desk),

                              jobDeskCard(
                                  cardIcon: Images.announce,
                                  cardText: AppString.text_announcement,
                                  onAction: () async {
                                    Get.toNamed(Routes.ANNOUNCE_SCREEN);
                                    await Get.find<DocumentController>()
                                        .getDocumentData();
                                  }),

                              jobDeskCard(
                                  cardIcon: Images.folder,
                                  cardText: AppString.text_documents,
                                  onAction: () async {
                                    Get.toNamed(Routes.DOCUMENT_SCREEN);
                                    await Get.find<DocumentController>()
                                        .getDocumentData();
                                  }),

                              jobDeskCard(
                                  cardIcon: Images.leave_allowance,
                                  cardText: AppString.text_leave_allowance,
                                  onAction: () async {
                                    Get.toNamed(Routes.DOCUMENT_SCREEN);
                                    await Get.find<DocumentController>()
                                        .getDocumentData();
                                  }),

                              jobDeskCard(
                                  cardIcon: Images.clock,
                                  cardText: AppString.text_job_history,
                                  onAction: () async {
                                    Get.toNamed(Routes.JOB_HISTORY);
                                    await Get.find<JobHistoryController>()
                                        .getJobHistoryData();
                                  }),
                              jobDeskCard(
                                cardIcon: Images.credit_card,
                                cardText: AppString.text_salary_overview,
                                onAction: () async {
                                  Get.toNamed(Routes.SALARY_OVERVIEW);
                                  await Get.find<
                                      SalaryOverviewController>()
                                      .getSalaryOveData();
                                },
                              ),
                              jobDeskCard(
                                cardIcon: Images.department,
                                cardText: AppString.text_bank_details,
                                onAction: () async {
                                  Get.toNamed(Routes.BANK_DETAILS);
                                  await Get.find<MoreDataController>()
                                      .getBankInfo();
                                },
                              ),
                              jobDeskCard(
                                  cardIcon: Images.location,
                                  cardText:
                                  AppString.text_address_details,
                                  onAction: () async {
                                    Get.toNamed(Routes.ADDRESS_DETAILS);
                                    await Get.find<
                                        AddressDetailsController>()
                                        .getEmployeeAddressData();
                                  }),
                              customSpacerHeight(height: 16),
                              jobDeskTitle(text: AppString.text_other),
                              jobDeskCard(
                                cardIcon: Images.note,
                                cardText: AppString.text_about_this_app,
                                onAction: () =>
                                    Get.toNamed(Routes.ABOUT_PAGE),
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