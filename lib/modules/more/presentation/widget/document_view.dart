import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/controller/downloader_helper.dart';

class DocumentView extends StatelessWidget {
  final imageUrl;
  final docName;
  const DocumentView({Key? key, this.imageUrl, this.docName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                _fileView(url: imageUrl),
                _body(docName: docName, fullUrl: imageUrl)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _body({required docName, required fullUrl}) {
  return Positioned(
      child: AppBar(
    backgroundColor:Colors.transparent,
    centerTitle: true,
    title: _titleText(text: docName),
    leading: _leading(),
    actions: [
      IconButton(
          onPressed: () {
            Get.find<DownloadHelper>().downloadFile(url: fullUrl);
          },
          icon: svgIcon(url: Images.download,height: 23,width: 42,color: AppColor.cardColor)


      )
    ],
  ));
}

Widget _fileView({required url}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColor.normalTextColor,
      image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fitWidth),
    ),
  );
}

Widget _titleText({required text}) {
  return Text(
    text,
    style: AppStyle.mid_large_text.copyWith(fontWeight: FontWeight.w600),
  );
}

Widget _leading() {
  return IconButton(
    onPressed: () => Get.back(),
    icon: const Icon(
      Icons.arrow_back,
      color: AppColor.cardColor,
    ),
  );
}
