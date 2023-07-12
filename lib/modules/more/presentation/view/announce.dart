import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/view_announce.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../controller/announcement_controller.dart';

class AnnounceScreen extends GetView<AnnouncementController> {
  const AnnounceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
      body: ViewAnnounce(),
    );
  }
}


class ExpandedText extends StatefulWidget {
  final String text;

  const ExpandedText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String firstHalf;
  late String secondHalf;
  bool isExpanded = false;

  @override
  void initState() {
    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(101, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf == ""
        ? RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.text,
            style: disTextStyle,
          ),
        ],
      ),
    )
        : RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: isExpanded ? widget.text : firstHalf,
            style: disTextStyle,
          ),
          TextSpan(
            text: isExpanded ? " ${AppString.text_read_less}" : "...${AppString.text_read_more}",
            style: AppStyle.normal_text_black.copyWith(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  isExpanded = !isExpanded;
                });

                //_readMoreText();
              },
          ),
        ],
      ),
    );
  }
}

Decoration get decoration {
  return AppStyle.ContainerStyle.copyWith(
      color: AppColor.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault));
}

TextStyle get cardTitleTextStyle {
  return AppStyle.title_text.copyWith(
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.fontSizeMid);
}

TextStyle get viewCardSubTextStyle {
  return GoogleFonts.poppins(
      color: AppColor.hintColor, fontWeight: FontWeight.w400);
}

TextStyle get disTextStyle {
  return GoogleFonts.poppins(
      color: AppColor.normalTextColor,
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.fontSizeDefault);
}
