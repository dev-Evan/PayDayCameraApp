import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/announce.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/more_widget.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class ViewAnnounce extends StatefulWidget {
  final String text;
  final int maxLength;
  const ViewAnnounce({super.key, required this.text, required this.maxLength});
  @override
  State<ViewAnnounce> createState() => _ViewAnnounceState();
}

class _ViewAnnounceState extends State<ViewAnnounce> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final isTextOverflowed = widget.text.length > widget.maxLength;

    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customMoreAppbar(titleText: AppString.text_announcement),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // newText(text: AppString.text_new),
                // announceCard(context: context,desText:
                //
                // isTextOverflowed && !isExpanded
                //     ? "${widget.text.substring(0, widget.maxLength)}..."
                //     : widget.text,
                //
                //     onAction: (){
                //       if (isTextOverflowed);
                //       setState(() {
                //         isExpanded = !isExpanded;
                //       });
                //     }, readMoreText: isExpanded ? 'Read Less' : 'Read More'
                //
                // ),
                Text(
                  isTextOverflowed && !isExpanded
                      ? "${widget.text.substring(0, widget.maxLength)}..."
                      : widget.text,
                  textAlign: TextAlign.justify,
                ),
                if (isTextOverflowed)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? 'Read Less' : 'Read More',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),

                // Text(
                //   isTextOverflowed && !isExpanded
                //       ? "${widget.text.substring(0, widget.maxLength)}..."
                //       : widget.text,
                //   textAlign: TextAlign.justify,
                // ),

                // if (isTextOverflowed)
                //   TextButton(
                //     onPressed: () {
                //       setState(() {
                //         isExpanded = !isExpanded;
                //       });
                //     },
                //     child:
                //     _redMoreBtn(text: isExpanded ? 'Read Less' : 'Read More',)
                //
                //
                //   ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget  newText({required text}){
  return jobDeskTitle(text: text);
}
Container announceCard ({required context,  double? length,required desText,required onAction,required readMoreText}){
  return Container(
    height: length,
    width: MediaQuery.of(context).size.width,
    decoration:decoration,
    child: Container(
      margin: EdgeInsets.only(left:AppLayout.getWidth(10),right: AppLayout.getWidth(10),top: AppLayout.getHeight(10),bottom: AppLayout.getHeight(10) ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardTitleText(),
          _dateText(),
          _cardDisText(desText: desText,onAction:onAction,readMoreText: readMoreText ),
        ],
      ),
    ),


  );
}


Widget _CardTitleText(){
  return Container(
    margin:  EdgeInsets.only(bottom: AppLayout.getHeight(2)),
    child: Text("UL release",style:CardTitleTextStyle ),
  );

}

Widget _dateText(){
  return Row(
    children: [
      Icon(Icons.calendar_today_outlined,color: AppColor.hintColor,size: Dimensions.fontSizeDefault,),
      customSpacerWidth(width: 4),
      Text("14 Nov 2022 - 15 Nov 2022",style:viewCardSubTextStyle ),
    ],
  );

}
Widget _cardDisText({required desText,required onAction,required readMoreText}){
  return Container(
    margin:  EdgeInsets.only(top: AppLayout.getHeight(12)),
    child: Row(
      children: [
        Text("$desText",textAlign: TextAlign.justify,style:disTextStyle ,),
        textButton(onAction: onAction,text: readMoreText),
      ],
    ),

  );
}
Widget _redMoreBtn({required text}){
  return Text(text);
}
TextButton textButton({required text ,onAction}){
  return TextButton(onPressed: ()=>onAction(), child: _redMoreBtn(text: text));
}

