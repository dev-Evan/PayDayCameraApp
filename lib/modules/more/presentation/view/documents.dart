import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/common/widget/custom_buttom_sheet.dart';
import 'package:pay_day_mobile/common/widget/custom_button.dart';
import 'package:pay_day_mobile/common/widget/custom_navigator.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../widget/add_document.dart';
import '../widget/document_view.dart';
import '../widget/documents_appbar.dart';
import 'package:file_picker/file_picker.dart';

class Documents extends StatefulWidget {
  const Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {



  List _document=[];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColor.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(),
            customMoreAppbar(titleText: AppString.text_documents),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.text_total_file,
                    style: AppStyle.title_text.copyWith(
                        color: AppColor.normalTextColor,
                        fontSize: Dimensions.fontSizeMid),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(4),
                  ),
                  Text(
                    '02',
                    style: AppStyle.small_text.copyWith(
                        color: AppColor.hintColor,
                        fontSize: Dimensions.fontSizeDefault),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(

                  children: [
                    _document ==null?

                    Expanded(child: ListView.builder(

                      itemCount: _document.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                           onTap: ()=>CustomNavigator(context: context,pageName: const DocumentView()),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: AppLayout.getHeight(88),
                            decoration: AppStyle.ContainerStyle.copyWith(
                                color: AppColor.backgroundColor,
                                border:
                                Border.all(width: 1, color: AppColor.disableColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: AppStyle.ContainerStyle.copyWith(
                                        borderRadius: BorderRadius.only(
                                            topLeft:
                                            Radius.circular(Dimensions.radiusMid),
                                            bottomLeft: Radius.circular(
                                                Dimensions.radiusMid)),
                                        // image: DecorationImage(
                                        //     image: FileImage(fileToDisplay!),
                                        //     fit: BoxFit.cover),
                                      ),
                                      child: Image.network(_document[index]),
                                    )),
                                Expanded(
                                    flex: 8,
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [


                                                    Text(AppString.text_doctor_slips,style: AppStyle.mid_large_text.copyWith(color: AppColor.normalTextColor,fontSize: Dimensions.fontSizeDefault,),),
                                                    Text(
                                                      '2 MB',
                                                      style: AppStyle.small_text.copyWith(
                                                          color: AppColor.hintColor,
                                                          fontSize: Dimensions.fontSizeDefault),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
                                        ],
                                      ),


                                    )),
                              ],
                            ),
                          ),
                        );

                      },
                    )):const Center(child: Text('No Content')),




                    const Spacer(),
                    CustomButton('Add Document', () {

                      customButtomSheet(context: context, height: 0.9,child: const AddDocument());
                    }),
                    SizedBox(
                      height: AppLayout.getHeight(20),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
