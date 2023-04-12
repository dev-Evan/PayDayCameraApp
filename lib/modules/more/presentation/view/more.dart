import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/widget/custom_alert_dialog.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/user_profile_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/about_this_app.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/address_details.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/calender.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/jod_history.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/salary_overview.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/view_profile.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:pay_day_mobile/utils/images.dart';

class MoreScreen extends StatelessWidget {
   MoreScreen({Key? key}) : super(key: key);

  UserProfileController profileData=Get.put(UserProfileController());

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
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: AppStyle.ContainerStyle.copyWith(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft:
                                  Radius.circular(Dimensions.radiusMid + 4),
                              bottomRight:
                                  Radius.circular(Dimensions.radiusMid + 4))),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(Images.user),
                                      radius: 28,
                                    ),
                                    SizedBox(
                                      width: AppLayout.getWidth(16),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        // profileData.userProfile!.data!.fullName.toString(),
                                          '',
                                          style: AppStyle.mid_large_text
                                              .copyWith(
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        // Text(
                                        //  profileData.userProfile!.data.email.toString(),
                                        //   style: AppStyle.small_text,
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radiusExtraLarge)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 14.0,
                                        right: 14,
                                        top: 4,
                                        bottom: 4),
                                    child: Text(
                                     //   profileData.userProfile !.data!.userStatus.toString() ??
                                            '',
                                      style: AppStyle.normal_text.copyWith(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              Dimensions.fontSizeDefault - 2),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Center(
                              child: InkWell(
                                onTap: ()=>CustomNavigator(context: context,pageName: ViewProfile()),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppString.text_view_profile,
                                      style: AppStyle.small_text.copyWith(
                                          fontSize: Dimensions.fontSizeDefault),
                                    ),
                                    SizedBox(
                                      width: AppLayout.getWidth(8),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: AppColor.cardColor,
                                      size: Dimensions.fontSizeDefault + 3,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
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
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: InkWell(
                                onTap: () => CustomNavigator(context: context,pageName:const Documents() ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Card(
                                            elevation: 0,
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Icon(
                                                  Icons.folder_open,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          width: AppLayout.getWidth(12),
                                        ),
                                        Text(
                                          AppString.text_documents,
                                          style: AppStyle.small_text_black
                                              .copyWith(
                                                  fontSize:
                                                      Dimensions.fontSizeSmall +
                                                          2,
                                                  color:
                                                      AppColor.normalTextColor),
                                        )
                                      ],
                                    ),
                                    CircleAvatar(
                                        radius: 14,
                                        backgroundColor:
                                            AppColor.hintColor.withOpacity(0.1),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.8),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: ()=>CustomNavigator(context: context,pageName:const CalendarScreen() ),
                                    child: Row(
                                      children: [
                                        Card(
                                            elevation: 0,
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Icon(
                                                  Icons.calendar_month,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          width: AppLayout.getWidth(12),
                                        ),
                                        Text(
                                          AppString.text_calender,
                                          style: AppStyle.small_text_black
                                              .copyWith(
                                                  fontSize:
                                                      Dimensions.fontSizeSmall +
                                                          2,
                                                  color:
                                                      AppColor.normalTextColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          AppColor.hintColor.withOpacity(0.1),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                        color: AppColor.primaryColor
                                            .withOpacity(0.8),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: ()=>CustomNavigator(context: context,pageName: const JodHistory()),
                                    child: Row(
                                      children: [
                                        Card(
                                            elevation: 0,
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Icon(
                                                  Icons.access_time_outlined,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          width: AppLayout.getWidth(12),
                                        ),
                                        Text(
                                          AppString.text_job_history,
                                          style: AppStyle.small_text_black
                                              .copyWith(
                                                  fontSize:
                                                      Dimensions.fontSizeSmall +
                                                          2,
                                                  color:
                                                      AppColor.normalTextColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          AppColor.hintColor.withOpacity(0.1),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                        color: AppColor.primaryColor
                                            .withOpacity(0.8),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: InkWell(
                                onTap: ()=>CustomNavigator(context: context,pageName: const SalaryOverView()),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Card(
                                            elevation: 0,
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Icon(
                                                  Icons.monetization_on_outlined,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          width: AppLayout.getWidth(12),
                                        ),
                                        Text(
                                          AppString.text_salary_overview,
                                          style: AppStyle.small_text_black
                                              .copyWith(
                                                  fontSize:
                                                      Dimensions.fontSizeSmall +
                                                          2,
                                                  color:
                                                      AppColor.normalTextColor),
                                        )
                                      ],
                                    ),
                                    CircleAvatar(
                                        radius: 14,
                                        backgroundColor:
                                            AppColor.hintColor.withOpacity(0.1),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.8),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: InkWell(
                                onTap: ()=>CustomNavigator(context: context,pageName: const AddressDetails()),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Card(
                                            elevation: 0,
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Icon(
                                                  Icons.location_on_outlined,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          width: AppLayout.getWidth(12),
                                        ),
                                        Text(
                                          AppString.text_address_details,
                                          style: AppStyle.small_text_black
                                              .copyWith(
                                                  fontSize:
                                                      Dimensions.fontSizeSmall +
                                                          2,
                                                  color:
                                                      AppColor.normalTextColor),
                                        )
                                      ],
                                    ),
                                    CircleAvatar(
                                        radius: 14,
                                        backgroundColor:
                                            AppColor.hintColor.withOpacity(0.1),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.8),
                                        )),
                                  ],
                                ),
                              ),
                            ),
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
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: InkWell(
                                onTap: ()=>CustomNavigator(context: context,pageName: const AboutThisApp()),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Card(
                                            elevation: 0,
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Icon(
                                                  Icons.text_snippet_outlined,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          width: AppLayout.getWidth(12),
                                        ),
                                        Text(
                                          AppString.text_about_this_app,
                                          style: AppStyle.small_text_black
                                              .copyWith(
                                                  fontSize:
                                                      Dimensions.fontSizeSmall +
                                                          2,
                                                  color:
                                                      AppColor.normalTextColor),
                                        )
                                      ],
                                    ),
                                    CircleAvatar(
                                        radius: 14,
                                        backgroundColor:
                                            AppColor.hintColor.withOpacity(0.1),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.8),
                                        )),
                                  ],
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: InkWell(
                                onTap: ()=>CustomAlertDialog(context: context,icon: Icons.logout,iconBgColor: Colors.orange.shade50,yesAction: (){}),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Card(
                                            elevation: 0,
                                            color: AppColor.primaryColor
                                                .withOpacity(0.1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Center(
                                                child: Icon(
                                                  Icons.logout,
                                                  color: AppColor.primaryColor
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          width: AppLayout.getWidth(12),
                                        ),
                                        Text(
                                          AppString.text_log_out,
                                          style: AppStyle.small_text_black
                                              .copyWith(
                                                  fontSize:
                                                      Dimensions.fontSizeSmall +
                                                          2,
                                                  color:
                                                      AppColor.normalTextColor),
                                        )
                                      ],
                                    ),
                                    CircleAvatar(
                                        radius: 14,
                                        backgroundColor:
                                            AppColor.hintColor.withOpacity(0.1),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: AppColor.primaryColor
                                              .withOpacity(0.8),
                                        )),
                                  ],
                                ),
                              ),
                            ),








                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                decoration: AppStyle.ContainerStyle.copyWith(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusExtraLarge),
                                  color: AppColor.primaryColor.withOpacity(0.1),

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 14.0),
                                        child: Text(
                                          AppString.text_english,
                                          style: AppStyle.small_text_black.copyWith(
                                              fontSize:
                                                  Dimensions.fontSizeSmall + 2,
                                              color: AppColor.normalTextColor),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 14.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              AppString.text_language,
                                              style: AppStyle.small_text_black.copyWith(
                                                  fontSize:
                                                  Dimensions.fontSizeSmall + 2,
                                                  color: AppColor.normalTextColor,fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(width: AppLayout.getWidth(4),),
                                            const Icon(Icons.expand_more,color: AppColor.normalTextColor,)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: AppLayout.getHeight(30),)


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
