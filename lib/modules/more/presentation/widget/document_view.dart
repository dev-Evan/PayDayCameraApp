import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/documents.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_style.dart';


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
              children: [_fileView(url: imageUrl), _body(docName: docName)],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _body({required docName}) {
  return Positioned(
      child: AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: _titleText(text: docName),
    leading: _leading(),
  ));
}

Widget _fileView({required url}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
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
