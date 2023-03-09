// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pay_day_mobile/utils/app_color.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
// import 'package:pay_day_mobile/utils/dimensions.dart';
// class attendanceLogsScreen extends StatefulWidget {
//   const attendanceLogsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<attendanceLogsScreen> createState() => _attendanceLogsScreenState();
// }
//
// class _attendanceLogsScreenState extends State<attendanceLogsScreen> {
//
//   List _title = [
//     AppString.onboardTileMainAttend,
//     AppString.onboardTileEasy,
//     AppString.onboardTileMainAttend,
//     AppString.onboardTileEasy,
//     AppString.onboardTileMainAttend,
//     AppString.onboardTileEasy,
//
//   ];
//   List _title1 = [
//     AppString.onboardTileMainAttend,
//     AppString.onboardTileEasy,
//
//
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//       // body: GridView.builder(
//       //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       //     crossAxisCount: 3,
//       //       childAspectRatio: 3 / 2,
//       //       crossAxisSpacing: 0,
//       //       mainAxisSpacing: 0),
//       //   itemCount: 6,
//       //   itemBuilder: (context, index){
//       //     return Container(
//       //       child: Card(
//       //         elevation: 0,
//       //
//       //         color: AppColor.cardColor.withOpacity(0.1),
//       //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault),side: BorderSide(width: 2,color: AppColor.cardColor.withOpacity(0.2))),
//       //         child: Row(
//       //           mainAxisAlignment: MainAxisAlignment.center,
//       //           children: [
//       //             Padding(
//       //               padding: const EdgeInsets.all(8.0),
//       //               child: Column(
//       //                 children: [
//       //                   Text( '148',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: Dimensions.fontSizeLarge,color: AppColor.cardColor.withOpacity(0.8)), ),
//       //                   Text( 'Worked',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: Dimensions.fontSizeMid,color: AppColor.cardColor.withOpacity(0.8)), ),
//       //                 ],
//       //               ),
//       //             ),
//       //           ],
//       //         ),
//       //       ),
//       //     );
//       //   },
//       // ),
//
//
//
//
//       body: Column(
//         children: [
//           Container(
//             child:CarouselSlider(
//
//               options: CarouselOptions(height: 200.0,
//
//
//               animateToClosest: false,
//                 pageSnapping: false,
//                 disableCenter: false,
//                 pauseAutoPlayInFiniteScroll: false,
//                 reverse: false,
//                enlargeCenterPage: true,//
//                 initialPage: _title1.length.toInt(),
//                 enableInfiniteScroll: false,
//
//               ),
//
//
//               items: _title.map((i) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: BoxDecoration(
//                             color: Colors.transparent
//                         ),
//                         child:  GridView.builder(
//                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               childAspectRatio: 3 / 2.5,
//                               crossAxisSpacing: 0,
//                               mainAxisSpacing: 0),
//                           itemCount: 6,
//                           itemBuilder: (context, index){
//                             return Container(
//                               child: Card(
//                                 elevation: 0,
//
//                                 color: AppColor.cardColor.withOpacity(0.1),
//                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusDefault),side: BorderSide(width: 2,color: AppColor.cardColor.withOpacity(0.2))),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         children: [
//                                           Text( '148',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: Dimensions.fontSizeLarge,color: AppColor.cardColor.withOpacity(0.8)), ),
//                                           Text( 'Worked',style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: Dimensions.fontSizeMid,color: AppColor.cardColor.withOpacity(0.8)), ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//
//
//
//                         // child: Text('text $i', style: TextStyle(fontSize: 16.0),)
//                     );
//                   },
//                 );
//               }).toList(),
//             ) ,
//           ),
//           // Obx(
//           //       () => DotsIndicator(
//           //     dotsCount: _title.length,
//           //     position: _title,
//           //     decorator: DotsDecorator(
//           //       color: AppColor.disableColor,
//           //       activeColor: AppColor.primaryColor,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/common/custom_button.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/attendance_logs_widget.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/dot_indicator.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/timer_overview_layout.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

class attendanceLogsScreen extends StatelessWidget {
  const attendanceLogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        floatingActionButton:Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: CustomButton(AppString.text_requstAttendance, (){}),
        ),
        appBar: CustomAppbar(),
        body: Stack(
       children: [
         CustomScrollView(
          slivers: [

            SliverFillRemaining(
              hasScrollBody: false,

              child: Column(
                children: [
                  Container(
                    height: AppLayout.getHeight(310),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.radiusMid),
                            bottomRight: Radius.circular(Dimensions.radiusMid))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          backlogs(),
                          attendanceLogsOverviewLayout(context),
                          dotIndicator()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(2),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: tabBar(),
                    ),
                  ),

                ],
              ),
            )
          ],
         ),


       ],
        ));
  }
}
