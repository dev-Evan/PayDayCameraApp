import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/common/widget/custom_spacer.dart';
import 'package:pay_day_mobile/common/widget/loading_indicator.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/announcement_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/announce.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/documents_appbar.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/more_widget.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';
import 'package:html/parser.dart' as htmlParser;
import '../../../../common/widget/no_data_found.dart';
import '../../../auth/presentation/controller/auth_controller.dart';

class ViewAnnounce extends GetView<AnnouncementController> {
  const ViewAnnounce({super.key});
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Scaffold(
              body: (controller.announcementModel.data?.announcements != null &&
                      controller
                          .announcementModel.data!.announcements!.isNotEmpty)
                  ? RefreshIndicator(
                      onRefresh: _refreshPage,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: controller.announceScrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customMoreAppbar(
                                titleText: AppString.text_announcement),
                            Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Obx(() => ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.announcementIndex.length,
                                      itemBuilder: (context, index) {
                                        String plainText = htmlParser
                                                .parse(controller
                                                        .announcementIndex[
                                                            index]
                                                        .description ??
                                                    "")
                                                .documentElement
                                                ?.text ??
                                            "";
                                        final drc = controller
                                                .announcementIndex[index]
                                                .description ??
                                            "";
                                        final wordCount = drc.split(' ').length;
                                        if (wordCount > 20) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: announceLargeCard(
                                                context: context,
                                                child: ExpandedText(
                                                    text: plainText),
                                                titleText: controller
                                                        .announcementIndex[
                                                            index]
                                                        .name ??
                                                    "",
                                                startDate: controller
                                                        .announcementIndex[
                                                            index]
                                                        .startDate ??
                                                    "",
                                                endDate: controller
                                                        .announcementIndex[
                                                            index]
                                                        .endDate ??
                                                    ""),
                                          );
                                        } else {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: announceCard(
                                                context: context,
                                                desText: plainText,
                                                length: 152,
                                                titleText: controller
                                                        .announcementIndex[
                                                            index]
                                                        .name ??
                                                    "",
                                                startDate: controller
                                                        .announcementIndex[
                                                            index]
                                                        .startDate ??
                                                    "",
                                                endDate: controller
                                                        .announcementIndex[
                                                            index]
                                                        .endDate ??
                                                    ""),
                                          );
                                        }
                                      },
                                    ))),
                            Obx(() => _progressBar()),
                            customSpacerHeight(height: 52)
                          ],
                        ),
                      ),
                    )
                  : noDataFound(),
            ),
        onLoading: const LoadingIndicator());
  }

  _progressBar() {
    return controller.isFloatingActionVisible.isTrue
        ? Center(
            child: Platform.isIOS
                ? const CupertinoActivityIndicator(
                    color: AppColor.primaryBlue,
                  )
                : const CircularProgressIndicator(color: AppColor.primaryColor, strokeWidth: 3,),
          )
        : Container();
  }

  Widget newText({required text}) {
    return jobDeskTitle(text: text);
  }

  Container announceCard(
      {required context,
      double? length,
      required desText,
      readMoreText,
      required titleText,
      required startDate,
      endDate}) {
    return Container(
      height: length,
      width: MediaQuery.of(context).size.width,
      decoration: decoration,
      child: Container(
        margin: EdgeInsets.only(
            left: AppLayout.getWidth(10),
            right: AppLayout.getWidth(10),
            top: AppLayout.getHeight(10),
            bottom: AppLayout.getHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardTitleText(titleText: titleText),
            _dateText(startDate: startDate, endDate: endDate),
            _cardDisText(desText: desText, readMoreText: readMoreText),
          ],
        ),
      ),
    );
  }

  Widget announceLargeCard(
      {required child,
      required context,
      required titleText,
      required startDate,
      required endDate}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: decoration,
      child: Container(
        margin: EdgeInsets.only(
            left: AppLayout.getWidth(10),
            right: AppLayout.getWidth(10),
            top: AppLayout.getHeight(10),
            bottom: AppLayout.getHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardTitleText(titleText: titleText),
            _dateText(startDate: startDate, endDate: endDate),
            customSpacerHeight(height: 6),
            child,
          ],
        ),
      ),
    );
  }

  Widget _cardTitleText({required titleText}) {
    return Container(
      margin: EdgeInsets.only(bottom: AppLayout.getHeight(2)),
      child: Text(titleText, style: cardTitleTextStyle),
    );
  }

  Widget _dateText({required startDate, required endDate}) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today_outlined,
          color: AppColor.hintColor,
          size: Dimensions.fontSizeDefault,
        ),
        customSpacerWidth(width: 6),
        Text("$startDate - $endDate", style: viewCardSubTextStyle),
      ],
    );
  }

  Widget _cardDisText({required desText, readMoreText}) {
    return Container(
      margin: EdgeInsets.only(top: AppLayout.getHeight(12)),
      child: Column(
        children: [
          Text(
            "$desText",
            style: disTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _redMoreBtn({required text}) {
    return Text(text);
  }

  TextButton textButton({required text, onAction}) {
    return TextButton(
        onPressed: () => onAction(), child: _redMoreBtn(text: text));
  }

  Future<void> _refreshPage() async {
    controller.getAnnouncement();
  }
}
