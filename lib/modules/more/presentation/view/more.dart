import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/controller/language_controller.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/enum/language.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/documet_controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/bank_info_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/salary_overview_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/more_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/profile_container_layout.dart';
import 'package:pay_day_mobile/routes/app_pages.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/widget/custom_spacer.dart';
import '../controller/announcement_controller.dart';

class MoreScreen extends GetView<ProfileDataController> {
  const MoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      controller.getProfileData();
    return controller.obx(
        (state) => Scaffold(
              body: RefreshIndicator(
                onRefresh: _refreshPage,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          profileCardLayOut(
                              context: context,
                              userImage: controller
                                      .userProfile.data?.profilePictureUrl
                                      .toString() ??
                                  "",
                              userName: controller.userProfile.data?.fullName
                                      .toString() ??
                                  AppString.text_not_added_yet,
                              userEmail:
                                  controller.userProfile.data?.email.toString() ??
                                      AppString.text_not_added_yet,
                              statusText: controller.userProfile.data?.userStatus
                                      .toString() ??
                                  ""),
                          Expanded(
                              flex: 14,
                              child: Container(
                                color: AppColor.backgroundColor,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    jobDeskTitle(text: AppString.text_job_desk),
                                    jobDeskCard(
                                        cardIcon: Images.announce,
                                        cardText: AppString.text_announcement,
                                        onAction: () async {
                                           Get.toNamed(Routes.ANNOUNCE_SCREEN);
                                          await Get.find<AnnouncementController>()
                                               .getAnnouncement();
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
                                          Get.toNamed(
                                              Routes.LEAVE_ALLOWANCE_SCREEN);
                                          await Get.find<AnnouncementController>()
                                             .getLeaveAllowanceDetails();
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
                                        await Get.find<SalaryOverviewController>()
                                            .getSalaryOveData();
                                      },
                                    ),
                                    jobDeskCard(
                                      cardIcon: Images.department,
                                      cardText: AppString.text_bank_details,
                                      onAction: () async {
                                        Get.toNamed(Routes.BANK_DETAILS);
                                        await Get.find<BankInfoController>()
                                            .getBankInfo();
                                      },
                                    ),
                                    jobDeskCard(
                                        cardIcon: Images.location,
                                        cardText: AppString.text_address_details,
                                        onAction: () async {
                                          Get.toNamed(Routes.ADDRESS_DETAILS);
                                          await Get.find<AddressController>()
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
                                      onAction: () => customAlertDialog(
                                          context: context,
                                          icon: Icons.logout,
                                          yesText: AppString.text_log_out,
                                          iconBgColor: Colors.orange.shade50,
                                          yesAction: () =>
                                              Get.find<LogoutController>()
                                                  .logOut()),
                                    ),
                                    _languageDropDown(),
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
            ),
        onLoading: const LoadingIndicator());
  }
  _languageDropDown() {
    return const LanguageDropDown();
  }

  Future<void> _refreshPage() async{
    await controller.getProfileData();
  }
}

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  final items = ['English', 'Bangla'];
  String? initValue;

  @override
  void initState() {
    _getLanguageName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(8), horizontal: AppLayout.getWidth(20)),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(children: [
        Expanded(
            child: Text(
          "text_language".tr,
          style: AppStyle.normal_text_black,
        )),
        DropdownButton(
          underline: Container(),
          isDense: true,
          value: initValue,
          items: items.map(buildMenuItem).toList(),
          onChanged: (String? value) {
            _changeLang(value: value!);
            setState(() {
              initValue = value;
            });
          },
        )
      ]),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
  
  void _changeLang({required String value}) {
    if (value.toLowerCase() == Language.english.name) {
      Get.find<LanguageController>().changeLanguage("en", "US");
    } else if (value.toLowerCase() == Language.bangla.name) {
      Get.find<LanguageController>().changeLanguage("bn", "BD");
    } else {}
  }

  void _getLanguageName() {
    String? languageCode = GetStorage().read("languageCode");
    if (languageCode != null) {
      switch (languageCode) {
        case "en":
          {
            initValue = "English";
            break;
          }
        case "bn":
          {
            initValue = "Bangla";
            break;
          }
        default:
          initValue = "English";
      }
    }
  }
}
