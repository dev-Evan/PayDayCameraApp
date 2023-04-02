import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_navigator.dart';
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
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);

  // UserProfileController profileData=Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileCardLayOut(
                    context: context,
                    userImage: Images.user,
                    userName: AppString.text_user_name,
                    userEmail: AppString.text_user_email),
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
                                  fontSize: Dimensions.fontSizeDefault + 2),
                            ),
                            _jobDeskCard(
                                cardIcon: Icons.folder_open,
                                cardText: AppString.text_documents,
                                onAction: () => CustomNavigator(
                                    context: context,
                                    pageName: const Documents())),
                            _jobDeskCard(
                                cardIcon: Icons.calendar_month,
                                cardText: AppString.text_calender,
                                onAction: () => CustomNavigator(
                                    context: context,
                                    pageName: const CalendarScreen())),
                            _jobDeskCard(
                                cardIcon: Icons.access_time_outlined,
                                cardText: AppString.text_salary_overview,
                                onAction: () => CustomNavigator(
                                    context: context,
                                    pageName: const JodHistory())),
                            _jobDeskCard(
                                cardIcon: Icons.monetization_on_outlined,
                                cardText: AppString.text_salary_overview,
                                onAction: () => CustomNavigator(
                                    context: context,
                                    pageName: const SalaryOverView())),
                            _jobDeskCard(
                                cardIcon: Icons.location_on_outlined,
                                cardText: AppString.text_address_details,
                                onAction: () => CustomNavigator(
                                    context: context,
                                    pageName: const AddressDetails())),
                            SizedBox(
                              height: AppLayout.getHeight(20),
                            ),
                            Text(
                              AppString.text_other,
                              style: AppStyle.mid_large_text.copyWith(
                                  color: AppColor.hintColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dimensions.fontSizeDefault + 2),
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
                                    yesAction: () {})),
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
    );
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


