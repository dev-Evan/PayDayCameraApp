import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/address_details_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/salary_overview_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/about_this_app.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/address_details.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/calender.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/jod_history.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/salary_overview.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/arrow_style.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/profile_container_layout.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/text_title_text.dart';
import 'package:pay_day_mobile/modules/setting/presentation/controller/setting_controller.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

import '../../../../common/widget/custom_alert_dialog.dart';
import '../../../../common/widget/custom_appbar.dart';
import '../../../../common/widget/custom_navigator.dart';
import '../../../../common/widget/loading_indicator.dart';
import '../controller/document_controller.dart';


class MoreScreen extends GetView<ProfileDataController> {
  MoreScreen({Key? key}) : super(key: key);

  ProfileDataController profileDataController = Get.put(ProfileDataController());
  SalaryOverviewController salaryOverviewController=Get.put(SalaryOverviewController());
  SettingController settingController=Get.put(SettingController());
  AddressDetailsController addressDetailsController=Get.put(AddressDetailsController());
  LogoutController logoutController=Get.put(LogoutController());
  JobHistoryController jobHistoryController=Get.put(JobHistoryController());

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Obx(() =>  profileCardLayOut(
                         context: context,
                         userImage: profileDataController
                             .userProfile?.data?.profilePictureUrl ==null
                             ? AssetImage(Images.user )
                             : NetworkImage(profileDataController
                             .userProfile?.data?.profilePictureUrl ?? "") ,

                         userName: profileDataController
                             .userProfile?.data?.fullName
                             .toString() ??
                             "Demo",
                         userEmail: profileDataController
                             .userProfile?.data?.email
                             .toString() ??
                             "Demo",
                         statusText: profileDataController
                             .userProfile?.data?.userStatus
                             .toString() ??
                             "Demo",
                       ),),

                        Expanded(
                            flex: 12,
                            child: Container(
                              color: AppColor.backgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppString.text_job_desk,
                                      style: AppStyle.mid_large_text.copyWith(
                                          color: AppColor.hintColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Dimensions.fontSizeDefault + 2),
                                    ),
                                    _jobDeskCard(
                                        cardIcon: Icons.folder_open,
                                        cardText: AppString.text_documents,
                                        onAction: () => CustomNavigator(
                                            context: context,
                                            pageName:  DocumentScreen())),
                                    _jobDeskCard(
                                        cardIcon: Icons.access_time_outlined,
                                        cardText: AppString.text_job_history,
                                        onAction: () => CustomNavigator(
                                            context: context,
                                            pageName:  JodHistory())),
                                    _jobDeskCard(
                                        cardIcon:
                                            Icons.monetization_on_outlined,
                                        cardText:
                                            AppString.text_salary_overview,
                                        onAction: (){
                                          CustomNavigator(
                                              context: context,
                                              pageName:  SalaryOverView());
                                        },
                                    ),
                                    _jobDeskCard(
                                        cardIcon: Icons.location_on_outlined,
                                        cardText:
                                            AppString.text_address_details,
                                        onAction: () => CustomNavigator(
                                            context: context,
                                            pageName:  AddressDetails())),
                                    SizedBox(
                                      height: AppLayout.getHeight(20),
                                    ),
                                    Text(
                                      AppString.text_other,
                                      style: AppStyle.mid_large_text.copyWith(
                                          color: AppColor.hintColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Dimensions.fontSizeDefault + 2),
                                    ),
                                    _jobDeskCard(
                                        cardIcon: CupertinoIcons.doc_text,
                                        cardText: AppString.text_about_this_app,
                                        onAction: () => CustomNavigator(
                                            context: context,
                                            pageName: const AboutThisApp())),
                                    _jobDeskCard(
                                        cardIcon: Icons.logout,
                                        cardText: AppString.text_log_out,
                                        onAction: () => CustomAlertDialog(
                                            context: context,
                                            icon: Icons.logout,
                                            iconBgColor: Colors.orange.shade50,
                                            yesAction: () {
                                              logoutController.logOut();
                                            })),
                                    _languageCardView(
                                        langName: AppString.text_english,
                                        langText: AppString.text_language),
                                    SizedBox(
                                      height: AppLayout.getHeight(30),
                                    )
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

Widget _jobDeskCard({cardIcon, cardText, onAction}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: InkWell(
      onTap: () => onAction(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _cardShape(icon: cardIcon),
              SizedBox(
                width: AppLayout.getWidth(12),
              ),
              Text(
                cardText,
                style: AppStyle.small_text_black.copyWith(
                    fontSize: Dimensions.fontSizeSmall + 2,
                    color: AppColor.normalTextColor),
              )
            ],
          ),
          avatarArrowIcon()
        ],
      ),
    ),
  );
}

Widget _cardShape({icon}) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Icon(
            icon,
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        ),
      ));
}

Widget _languageCardView({langText, langName}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Container(
      decoration: AppStyle.ContainerStyle.copyWith(
        borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
        color: AppColor.primaryColor.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                langName,
                style: AppStyle.small_text_black.copyWith(
                    fontSize: Dimensions.fontSizeSmall + 2,
                    color: AppColor.normalTextColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Row(
                children: [
                  Text(
                    langText,
                    style: AppStyle.small_text_black.copyWith(
                        fontSize: Dimensions.fontSizeSmall + 2,
                        color: AppColor.normalTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: AppLayout.getWidth(4),
                  ),
                  const Icon(
                    Icons.expand_more,
                    color: AppColor.normalTextColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
