import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pay_day_mobile/common/custom_appbar.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/app_style.dart';

import '../view/documents.dart';
import 'documents_appbar.dart';

class DocumentView extends StatelessWidget {
  const DocumentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1547665979-bb809517610d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    child: AppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: Text(
                    AppString.text_documents,
                    style: AppStyle.mid_large_text
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  leading: IconButton(
                    onPressed: () => Get.to( DocumentScreen()),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColor.cardColor,
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.arrow_down_to_line))
                  ],
                )


                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
