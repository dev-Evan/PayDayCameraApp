// import 'package:flutter/material.dart';
// import 'package:pay_day_mobile/common/custom_appbar.dart';
// import 'package:pay_day_mobile/common/custom_buttom_sheet.dart';
// import 'package:pay_day_mobile/common/custom_button.dart';
// import 'package:pay_day_mobile/common/custom_navigator.dart';
// import 'package:pay_day_mobile/utils/app_color.dart';
// import 'package:pay_day_mobile/utils/app_layout.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
// import 'package:pay_day_mobile/utils/app_style.dart';
// import 'package:pay_day_mobile/utils/dimensions.dart';
// import '../widget/add_document.dart';
// import '../widget/document_view.dart';
// import '../widget/documents_appbar.dart';
//
// class Documents extends StatefulWidget {
//   const Documents({super.key});
//
//   @override
//   State<Documents> createState() => _DocumentsState();
// }
//
// class _DocumentsState extends State<Documents> {
//   List _document = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         color: AppColor.backgroundColor,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const CustomAppbar(),
//             customMoreAppbar(titleText: AppString.text_documents),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     AppString.text_total_file,
//                     style: AppStyle.title_text.copyWith(
//                         color: AppColor.normalTextColor,
//                         fontSize: Dimensions.fontSizeMid),
//                   ),
//                   SizedBox(
//                     height: AppLayout.getHeight(4),
//                   ),
//                   Text(
//                     '02',
//                     style: AppStyle.small_text.copyWith(
//                         color: AppColor.hintColor,
//                         fontSize: Dimensions.fontSizeDefault),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     _document == null
//                         ? Expanded(
//                             child: ListView.builder(
//                             itemCount: _document.length,
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () => CustomNavigator(
//                                     context: context,
//                                     pageName: const DocumentView()),
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   height: AppLayout.getHeight(88),
//                                   decoration: AppStyle.ContainerStyle.copyWith(
//                                       color: AppColor.backgroundColor,
//                                       border: Border.all(
//                                           width: 1,
//                                           color: AppColor.disableColor)),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                           flex: 3,
//                                           child: Container(
//                                             decoration: AppStyle.ContainerStyle
//                                                 .copyWith(
//                                               borderRadius: BorderRadius.only(
//                                                   topLeft: Radius.circular(
//                                                       Dimensions.radiusMid),
//                                                   bottomLeft: Radius.circular(
//                                                       Dimensions.radiusMid)),
//                                             ),
//                                             child:
//                                                 Image.network(_document[index]),
//                                           )),
//                                       Expanded(
//                                           flex: 8,
//                                           child: Container(
//                                             color: Colors.transparent,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               12.0),
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             AppString
//                                                                 .text_doctor_slips,
//                                                             style: AppStyle
//                                                                 .mid_large_text
//                                                                 .copyWith(
//                                                               color: AppColor
//                                                                   .normalTextColor,
//                                                               fontSize: Dimensions
//                                                                   .fontSizeDefault,
//                                                             ),
//                                                           ),
//                                                           Text(
//                                                             '2 MB',
//                                                             style: AppStyle
//                                                                 .small_text
//                                                                 .copyWith(
//                                                                     color: AppColor
//                                                                         .hintColor,
//                                                                     fontSize:
//                                                                         Dimensions
//                                                                             .fontSizeDefault),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 IconButton(
//                                                     onPressed: () {},
//                                                     icon: const Icon(
//                                                         Icons.more_vert))
//                                               ],
//                                             ),
//                                           )),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ))
//                         : const Center(child: Text('No Content')),
//                     const Spacer(),
//                     CustomButton('Add Document', () {
//                       customButtomSheet(
//                           context: context,
//                           height: 0.9,
//                           child: const AddDocument());
//                     }),
//                     SizedBox(
//                       height: AppLayout.getHeight(20),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/modules/attendance/presentation/widget/bottom_sheet_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/document_deleted_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/profile_calender_dialog.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import '../../../../common/widget/custom_appbar.dart';
import '../../../../common/widget/custom_buttom_sheet.dart';
import '../../../../common/widget/custom_button.dart';
import '../../../../common/widget/custom_navigator.dart';
import '../widget/add_document.dart';
import '../widget/document_view.dart';
import '../widget/documents_appbar.dart';

class DocumentScreen extends GetView<DocumentController> {
  DocumentScreen({Key? key}) : super(key: key);

  DocumentController documentController = Get.put(DocumentController());
  DeletedDocumentController deletedDocumentController=Get.put(DeletedDocumentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: controller.obx(
        (state) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customMoreAppbar(
                titleText: documentController.documentModel?.message ?? AppString.text_documents),
            documentController.documentModel?.data?.documents != null
                ? Expanded(
                    child: Container(
                      color: AppColor.backgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fileTitleText(
                              totalFileText: documentController
                                      .documentModel?.data?.meta?.total
                                      .toString() ??
                                  ""),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: ListView.builder(
                                    itemCount: documentController
                                        .documentModel?.data?.documents?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () => CustomNavigator(
                                          context: context,
                                          pageName: const DocumentView(),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width:
                                                        AppLayout.getWidth(0.3),
                                                    color: AppColor.hintColor),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions
                                                            .radiusDefault)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: _cardImage(
                                                    imageUrl: documentController
                                                            .documentModel
                                                            ?.data
                                                            ?.documents?[index]
                                                            .fullUrl ??
                                                        "",
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 8,
                                                    child: _cardImgTitle(
                                                        titleText:
                                                            documentController
                                                                    .documentModel
                                                                    ?.data
                                                                    ?.documents?[
                                                                        index]
                                                                    .name ??
                                                                "",
                                                        sizeText: "",context: context)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                    AppString.text_no_document_found,
                    style: AppStyle.title_text.copyWith(
                        color: AppColor.normalTextColor,
                        fontSize: Dimensions.fontSizeDefault),
                  )),
            Padding(
              padding: EdgeInsets.only(
                  left: AppLayout.getWidth(8),
                  right: AppLayout.getWidth(8),
                  top: AppLayout.getHeight(8),
                  bottom: AppLayout.getHeight(8)),
              child: CustomButton(AppString.text_add_documents, () {
                customButtomSheet(
                    context: context, height: 0.9, child: const AddDocument());
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardImage({required imageUrl}) {
    return Container(
      height: AppLayout.getHeight(66),
      decoration: AppStyle.ContainerStyle.copyWith(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radiusMid - 4),
              bottomLeft: Radius.circular(Dimensions.radiusMid - 4)),
          image: DecorationImage(image: NetworkImage(imageUrl))),
      // child: Image.network(imageUrl),
    );
  }
}

Widget _cardImgTitle({required titleText, required sizeText, required context}) {
  return Container(
    decoration: AppStyle.ContainerStyle.copyWith(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radiusMid),
            bottomRight: Radius.circular(Dimensions.radiusMid))),
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
                  Text(titleText),

                ],
              ),
            ),
          ],
        ),
        IconButton(onPressed: () {


          customButtomSheet(
              context: context, height: 0.3, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _docEditAndDeleted(context),
              ));

        }, icon: const Icon(Icons.more_vert))
      ],
    ),
  );
}

Widget _fileTitleText({required totalFileText}) {
  return Padding(
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
          totalFileText,
          style: AppStyle.small_text.copyWith(
              color: AppColor.hintColor, fontSize: Dimensions.fontSizeDefault),
        ),
      ],
    ),
  );
}

Widget _docEditAndDeleted(context){
  DeletedDocumentController deletedDocumentController=Get.put(DeletedDocumentController());

  return Column(
    children: [
      bottomSheetAppbar(context: context,appbarTitle: ""),
      customSpacerHeight(height: 10),
      Row(
        children: [
          _cardShape(icon: Icons.edit),
          customSpacerWidth(width: 6),
          Text(AppString.text_edit,style: AppStyle.title_text.copyWith(color: AppColor.normalTextColor,fontSize: Dimensions.fontSizeDefault),),
          SizedBox(width: AppLayout.getWidth(40),),
          InkWell(
            onTap: ()=>deletedDocumentController.deletedDocumentApi(),

            child: Row(
              children: [
                _cardShape(icon: Icons.delete),
                customSpacerWidth(width: 6),
                Text(AppString.text_deleted,style: AppStyle.title_text.copyWith(color: AppColor.normalTextColor,fontSize: Dimensions.fontSizeDefault),),
              ],
            ),
          )
        ],
      ),
    ],
  );

}
Widget _cardShape({icon}) {
  return Card(
      elevation: 0,
      color: AppColor.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Icon(
            icon,
            color: AppColor.primaryColor.withOpacity(0.8),
          ),
        ),
      ));
}