import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/text_field.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/custom_text_field_dob.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
class ApplyLeaveDobHalfDay extends StatefulWidget {
  const ApplyLeaveDobHalfDay({Key? key}) : super(key: key);

  @override
  State<ApplyLeaveDobHalfDay> createState() => _ApplyLeaveDobHalfDayState();
}

class _ApplyLeaveDobHalfDayState extends State<ApplyLeaveDobHalfDay> {
  bool selectedFirst=false;
  bool selectedLast=false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.text_start_day,
                style: AppStyle.small_text.copyWith(
                    color: AppColor.hintColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.fontSizeDefault + 1),
              ),
              CustomTextFieldDob(
                  hintText: '01-Jan-1996',
                  dobIcon: Icons.calendar_month,
                  dobIconAction: () {}),
            ],
          ),
        ),
        SizedBox(
          width: AppLayout.getWidth(12),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.text_end_day,
                style: AppStyle.small_text.copyWith(
                    color: AppColor.hintColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.fontSizeDefault + 1),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        selectedFirst  =! selectedFirst;

                      });
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                          side: BorderSide(
                              color: selectedFirst
                                  ? AppColor.primaryColor
                                  : AppColor.disableColor.withOpacity(0.4))
                      ),
                      color: selectedFirst?AppColor.primaryColor.withOpacity(0.2): AppColor.disableColor.withOpacity(0.4),
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 22.0,right: 22,top: 16,bottom: 16),
                        child: Text(AppString.text_first,style: AppStyle.small_text_black.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.fontSizeDefault,
                            letterSpacing: 0.2,
                            color: selectedFirst
                                ? AppColor.primaryColor
                                : AppColor.normalTextColor),),
                      ),
                    ),
                  ),
                  SizedBox(width: AppLayout.getWidth(12),),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selectedLast  =! selectedLast;

                      });
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                          side: BorderSide(
                              color: selectedLast
                                  ? AppColor.primaryColor
                                  : AppColor.disableColor.withOpacity(0.4))
                      ),
                      color: selectedLast?AppColor.primaryColor.withOpacity(0.2): AppColor.disableColor.withOpacity(0.4),
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 22.0,right: 22,top: 16,bottom: 16),
                        child: Text(AppString.text_last,style: AppStyle.small_text_black.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.fontSizeDefault,
                            letterSpacing: 0.2,
                            color: selectedLast
                                ? AppColor.primaryColor
                                : AppColor.normalTextColor),),




                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
