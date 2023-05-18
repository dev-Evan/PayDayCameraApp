import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewDocFile extends StatelessWidget {
  final path;
  final pathName;
  const ViewDocFile({Key? key, this.path, this.pathName}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const CustomAppbar(),
      body: Column(
        children: [
          _body(docName: pathName),
          customSpacerHeight(height: 20),
          Expanded(
            child:  _fileView(url: path),

          ),
        ],
      ),
    );
  }
}

Widget _body({required docName}) {
  return AppBar(
    backgroundColor: AppColor.backgroundColor,
    centerTitle: true,
    elevation: 0,
    title: _titleText(text: docName),
    leading: _leading(),
  );
}

Widget _fileView({required url}) {
  return Padding(
    padding:  EdgeInsets.only(
      left: AppLayout.getWidth(12),
      right: AppLayout.getWidth(12),
      top: AppLayout.getHeight(12),
      bottom: AppLayout.getHeight(12),
    ),
    child: SfPdfViewer.network(
        url,
        canShowScrollHead: false,
        canShowScrollStatus: false),
  );
}

Widget _titleText({required text}) {
  return Text(
    text,
    style: AppStyle.mid_large_text.copyWith(fontWeight: FontWeight.w600,color: AppColor.normalTextColor),
  );
}

Widget _leading() {
  return IconButton(
    onPressed: () => Get.to(DocumentScreen()),
    icon: const Icon(
      Icons.arrow_back,
      color: AppColor.normalTextColor,
    ),
  );
}
