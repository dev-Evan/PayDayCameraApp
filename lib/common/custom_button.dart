import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class CustomButton extends StatefulWidget {
  String text;
  final  onAction;
  CustomButton(this.text, this.onAction);
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool value=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 18,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            value=!value;
            widget.onAction();
          });
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: AppColor.primaryColor,
            elevation: 0),
          child: value?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                  scale: 0.4,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
              SizedBox(width: AppLayout.getWidth(4),),
              Text(
                'Please wait',
                style: GoogleFonts.poppins(fontSize: Dimensions.fontSizeMid),
              )
            ],
          )

              :Text( widget.text,style: GoogleFonts.poppins(fontSize: Dimensions.fontSizeMid),)

      ),
    );
  }
}








class CustomSmallButton extends StatelessWidget {
  String text;
  final  onAction;

  CustomSmallButton(this.text, this.onAction);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 18,
      child: ElevatedButton(
        onPressed: () => onAction(),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: AppColor.primaryColor,
            elevation: 0),
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: Dimensions.fontSizeMid,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}


