import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/dotted_view.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_his_job_title.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';

Widget jobHisEmploymentView() {
  return Padding(
    padding: const EdgeInsets.only(left: 45.0, bottom: 16,top: 0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Get.find<JobHistoryController>()
          .jobHistoryModel.data?.employmentStatuses?.length ??0,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: AppLayout.getWidth(24),
                child: jodTitle(
                    jobTitleText: Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.employmentStatuses?[index].name ??
                        "",
                    subTitleText: Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.employmentStatuses?[index].startDate ??
                        "",
                    subEndText: Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.employmentStatuses?[index].endDate ??
                        "")),
          ],
        );
      },
    ),
  );
}

Widget jobHisDesignationView() {

  return Padding(
    padding: const EdgeInsets.only(left: 45.0, bottom: 16,top: 0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          Get.find<JobHistoryController>().jobHistoryModel.data?.designations?.length ??0,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: AppLayout.getWidth(23),
                top: AppLayout.getHeight(20),
                child: jodTitle(
                    jobTitleText:  Get.find<JobHistoryController>()
                            .jobHistoryModel.data?.designations?[index].name ??
                        "",
                    subTitleText:  Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.designations?[index].startDate ??
                        "",
                    subEndText:  Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.designations?[index].endDate ??
                        "")),
          ],
        );
      },
    ),
  );
}

Widget jobHisDepartmentView() {


  return Padding(
    padding: const EdgeInsets.only(left: 45.0, bottom: 16,top: 0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
      Get.find<JobHistoryController>().jobHistoryModel.data?.departments?.length??0,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: AppLayout.getWidth(23),
                top: AppLayout.getHeight(20),
                child: jodTitle(
                    jobTitleText: Get.find<JobHistoryController>()
                            .jobHistoryModel.data?.departments?[index].name ??
                        "",
                    subTitleText:Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.departments?[index].startDate ??
                        "",
                    subEndText:Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.departments?[index].endDate ??
                        "")),
          ],
        );
      },
    ),
  );
}

Widget jobHisRoleView() {

  return Padding(
    padding: const EdgeInsets.only(left: 45.0, bottom: 16,top: 0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Get.find<JobHistoryController>().jobHistoryModel.data?.roles?.length ??0,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: AppLayout.getWidth(23),
                top: AppLayout.getHeight(20),
                child: jodTitleRole(
                  jobTitleText: Get.find<JobHistoryController>()
                          .jobHistoryModel.data?.roles?[index].name ??
                      "",
                )),
          ],
        );
      },
    ),
  );
}

Widget jobHisWorkShiftView() {
  return Padding(
    padding: const EdgeInsets.only(left: 45.0, bottom: 16,top: 0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
      Get.find<JobHistoryController>().jobHistoryModel.data?.workingShifts?.length??0,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: AppLayout.getWidth(23),
                top: AppLayout.getHeight(20),
                child: jodTitle(
                    jobTitleText:   Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.workingShifts?[index].name ??
                        "",
                    subTitleText: Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.workingShifts?[index].startDate ??
                        "",
                    subEndText: Get.find<JobHistoryController>().jobHistoryModel.data
                            ?.workingShifts?[index].endDate ??
                        "")),
          ],
        );
      },
    ),
  );
}
