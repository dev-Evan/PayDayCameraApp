import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/view_announce.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class AnnounceScreen extends StatefulWidget {
  const AnnounceScreen({Key? key}) : super(key: key);

  @override
  State<AnnounceScreen> createState() => _AnnounceScreenState();
}

class _AnnounceScreenState extends State<AnnounceScreen> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppbar(),
      body: ViewAnnounce(text: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used s a placeholder text commonly used",maxLength: 34,)
      ,
    );
  }
}


Decoration get decoration{
  return AppStyle.ContainerStyle.copyWith(color: AppColor.primaryColor.withOpacity(0.1),borderRadius: BorderRadius.circular(Dimensions.radiusDefault));
}
TextStyle get CardTitleTextStyle{
  return AppStyle.title_text.copyWith(color: AppColor.normalTextColor,fontWeight: FontWeight.w500,fontSize: Dimensions.fontSizeMid);
}

TextStyle get viewCardSubTextStyle{
  return GoogleFonts.poppins(color: AppColor.hintColor,fontWeight: FontWeight.w400);
}
TextStyle get disTextStyle{
  return GoogleFonts.poppins(color: AppColor.normalTextColor,fontWeight: FontWeight.w400);
}

