import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/announce.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/more_widget.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class ViewAnnounce extends StatefulWidget {
  const ViewAnnounce({super.key});

  @override
  State<ViewAnnounce> createState() => _ViewAnnounceState();
}

class _ViewAnnounceState extends State<ViewAnnounce> {
  List texts = [
    'In publishing and graphic design, Lorem ipsum is',
    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful contentthe visual form of a document or a typeface without relying on meaningful content  the visual form of a document or a typeface without relying on meaningful content the visual form of a document or a typeface without relying on meaningful content',
    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
    'ut labore et dolore magna aliqua',
    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
    'Ut enim ad minim veniam',
    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
    'Ut enim ad minim veniam',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customMoreAppbar(titleText: AppString.text_announcement),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  final text = texts[index];
                  final wordCount = text.split(' ').length;
                  print(wordCount);

                  if (wordCount > 20) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: announceLargeCard(
                        context: context,
                        child: ExpandableText(
                          texts[index],
                          trimLines: 3,
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: announceCard(
                        context: context,
                        desText: texts[index],
                        length: 163,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget newText({required text}) {
  return jobDeskTitle(text: text);
}

Container announceCard(
    {required context, double? length, required desText, readMoreText}) {
  return Container(
    height: length,
    width: MediaQuery.of(context).size.width,
    decoration: decoration,
    child: Container(
      margin: EdgeInsets.only(
          left: AppLayout.getWidth(10),
          right: AppLayout.getWidth(10),
          top: AppLayout.getHeight(10),
          bottom: AppLayout.getHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardTitleText(),
          _dateText(),
          _cardDisText(desText: desText, readMoreText: readMoreText),
        ],
      ),
    ),
  );
}

Widget announceLargeCard({required child, required context}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: decoration,
    child: Container(
      margin: EdgeInsets.only(
          left: AppLayout.getWidth(10),
          right: AppLayout.getWidth(10),
          top: AppLayout.getHeight(10),
          bottom: AppLayout.getHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardTitleText(),
          _dateText(),
          customSpacerHeight(height: 6),
          child
        ],
      ),
    ),
  );
}

Widget _cardTitleText() {
  return Container(
    margin: EdgeInsets.only(bottom: AppLayout.getHeight(2)),
    child: Text("UL release", style: CardTitleTextStyle),
  );
}

Widget _dateText() {
  return Row(
    children: [
      Icon(
        Icons.calendar_today_outlined,
        color: AppColor.hintColor,
        size: Dimensions.fontSizeDefault,
      ),
      customSpacerWidth(width: 4),
      Text("14 Nov 2022 - 15 Nov 2022", style: viewCardSubTextStyle),
    ],
  );
}

Widget _cardDisText({required desText, readMoreText}) {
  return Container(
    margin: EdgeInsets.only(top: AppLayout.getHeight(12)),
    child: Column(
      children: [
        Text(
          "${desText}",
          style: disTextStyle,
        ),
        //textButton(onAction: onAction,text: readMoreText),
      ],
    ),
  );
}

Widget _redMoreBtn({required text}) {
  return Text(text);
}

TextButton textButton({required text, onAction}) {
  return TextButton(
      onPressed: () => onAction(), child: _redMoreBtn(text: text));
}
