import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/address_details_widget.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
class BankDetails extends StatelessWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customMoreAppbar(titleText: AppString.text_bank_details),
              _bankTitleRow(),
              _bankUserInfo(infoTitleText: "Branch",infoDetailsText: "nnnn"),
              _bankUserInfo(infoTitleText: "Bank Code",infoDetailsText: "nnnn"),
              _bankUserInfo(infoTitleText: "Account Holder",infoDetailsText: "nnnn"),
              _bankUserInfo(infoTitleText: "Account Number",infoDetailsText: "nnnn"),
              _bankUserInfo(infoTitleText: "Account Title",infoDetailsText: "nnnn"),
              _bankUserInfo(infoTitleText: "Tax Payer ID",infoDetailsText: "nnnn")


            ],
          ),
        ),
      ),
    );
  }
}
Widget _bankTitleRow(){
  return Padding(
    padding:  EdgeInsets.only(left: AppLayout.getWidth(20),right: AppLayout.getWidth(20),top: AppLayout.getHeight(20),bottom: AppLayout.getHeight(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _bankTitleText(),
        editDetBtn(onAction: (){},editAction: (){},context: Get.context),

      ],
    ),
  );
}
Widget _bankTitleText(){
  return Text("City Bank Ltd",style: AppStyle.title_text.copyWith(color: AppColor.normalTextColor,fontWeight: FontWeight.bold,fontSize: Dimensions.fontSizeMid),);

}
Widget _bankUserInfo({required infoTitleText,infoDetailsText}){
  return Padding(
    padding:  EdgeInsets.only(left: AppLayout.getWidth(20),right: AppLayout.getWidth(20),top: AppLayout.getHeight(12),bottom: AppLayout.getHeight(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textTitle(titleText: infoTitleText),
        textSubTitle(subTitleText: infoDetailsText),


      ],
    ),
  );
}