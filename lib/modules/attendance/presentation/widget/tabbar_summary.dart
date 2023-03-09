
import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_divider.dart';
import 'package:pay_day_mobile/common/custom_status_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/date_picaker.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
class summaryScreen extends StatefulWidget {
  const summaryScreen({Key? key}) : super(key: key);

  @override
  State<summaryScreen> createState() => _summaryScreenState();
}

class _summaryScreenState extends State<summaryScreen> {


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: AppLayout.getHeight(12),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppString.textMonth,style: AppStyle.mid_large_text.copyWith(color: AppColor.secondaryColor,fontWeight: FontWeight.w700),),
                          SizedBox(
                            width: AppLayout.getWidth(12),
                          ),
                          InkWell(
                            onTap: (){
                              // _show();
                            },
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.hintColor,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Dec 2022',
                        style: AppStyle.small_text_black
                            .copyWith(color: AppColor.hintColor),
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: AppLayout.getHeight(12),),
              Expanded(child: logsList())
            ],
          ),
        ));
  }
}

Widget logsList() {

  List _color=[

    Colors.green,
    AppColor.errorColor,
    AppColor.secondaryColor,
    Colors.green,
    AppColor.secondaryColor,
  ];
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Card(
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "10",
                      style: AppStyle.mid_large_text.copyWith(
                          color: AppColor.normalTextColor,
                          fontSize: Dimensions.fontSizeExtraLarge,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Dec",
                      style: AppStyle.small_text.copyWith(
                          color: AppColor.hintColor,
                          fontSize: Dimensions.fontSizeSmall),
                    ),
                  ],
                ),
                customDiveider(25, 1),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('s : ',style: AppStyle.small_text.copyWith(color: AppColor.hintColor,fontSize: Dimensions.fontSizeDefault+4,fontWeight: FontWeight.w500),),
                        Text(
                          "8.00",
                          style: AppStyle.mid_large_text
                              .copyWith(color: AppColor.secondaryColor,fontSize: Dimensions.fontSizeDefault+2),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('w : ',style: AppStyle.small_text.copyWith(color: AppColor.hintColor,fontSize: Dimensions.fontSizeDefault+4,fontWeight: FontWeight.w500),),
                        Text(
                          "8.00",
                          style: AppStyle.mid_large_text
                              .copyWith(color: AppColor.secondaryColor,fontSize: Dimensions.fontSizeDefault+2),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Text('PL : ',style: AppStyle.small_text.copyWith(color: AppColor.hintColor,fontSize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w500),),
                        Text(
                          "0.00",
                          style: AppStyle.mid_large_text
                              .copyWith(color: AppColor.secondaryColor,fontSize: Dimensions.fontSizeDefault+2),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('B : ',style: AppStyle.small_text.copyWith(color: AppColor.hintColor,fontSize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w500),),
                        Text(
                          "1.00",
                          style: AppStyle.mid_large_text
                              .copyWith(color: _color[index],fontSize: Dimensions.fontSizeDefault+2),
                        ),
                      ],
                    ),
                  ],
                ),


              ],
            ),
          ),
          SizedBox(height: AppLayout.getHeight(18),)
        ],
      );
    },
  );
}




