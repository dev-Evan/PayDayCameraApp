import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/images.dart';
import '../../../../common/controller/downloader_helper.dart';
import '../../../../utils/dimensions.dart';

class DocumentView extends StatelessWidget {
  final imageUrl;
  final docName;
  const DocumentView({Key? key, this.imageUrl, this.docName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _defaultAppbar(docName: docName, fullUrl: imageUrl),
          Expanded(
              child: Column(
            children: [
              _fileView(url: imageUrl),
            ],
          )),
        ],
      ),
    );
  }
}

Widget _defaultAppbar({required docName, required fullUrl}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColor.backgroundColor,
    centerTitle: true,
    title: _titleText(text: docName),
    leading: _leading(),
    actions: [
      IconButton(
          onPressed: () => Get.find<DownloadHelper>().downloadFile(url: fullUrl,fileInfo: docName),
          icon: svgIcon(
              url: Images.download,
              height: 23,
              width: 42,
              color: AppColor.normalTextColor))
    ],
  );
}

Widget _fileView({required url}) {
  return Expanded(
    child: FadeInImage(
      alignment: Alignment.center,
      image: NetworkImage(url),
      placeholder: AssetImage(Images.placeholder),
      fit: BoxFit.fitWidth,
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
          decoration: AppStyle.ContainerStyle.copyWith(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radiusDefault),
                  bottomLeft: Radius.circular(Dimensions.radiusDefault)),
              image: DecorationImage(
                  image: AssetImage(Images.placeholder), fit: BoxFit.fitWidth)),
        );
      },
    ),
  );
}

Widget _titleText({required text}) {
  return Text(
    text,
    style: AppStyle.mid_large_text
        .copyWith(fontWeight: FontWeight.w600, color: AppColor.normalTextColor),
  );
}

Widget _leading() {
  return IconButton(
    onPressed: () => Get.back(),
    icon: const Icon(
      Icons.arrow_back,
      color: AppColor.normalTextColor,
    ),
  );
}
