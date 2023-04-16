import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/job_history_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/dotted_view.dart';
import 'package:pay_day_mobile/modules/more/presentation/widget/job_his_job_title.dart';
import 'package:pay_day_mobile/utils/app_color.dart';
import 'package:pay_day_mobile/utils/app_layout.dart';
import 'package:pay_day_mobile/utils/app_style.dart';
import 'package:pay_day_mobile/utils/dimensions.dart';

Widget jobHisEmploymentView() {
  JobHistoryController jobHistoryController = Get.put(JobHistoryController());

  return Padding(
    padding: const EdgeInsets.only(left: 44.0, bottom: 16),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobHistoryController
          .jobHistoryModel?.data?.employmentStatuses?.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: 23,
                child: jodTitle(
                    jobTitleText: jobHistoryController.jobHistoryModel?.data
                            ?.employmentStatuses?[index].name ??
                        "",
                    subTitleText: jobHistoryController.jobHistoryModel?.data
                            ?.employmentStatuses?[index].startDate ??
                        "",
                    subEndText: jobHistoryController.jobHistoryModel?.data
                            ?.employmentStatuses?[index].endDate ??
                        "")),
          ],
        );
      },
    ),
  );
}

Widget jobHisDesignationView() {
  JobHistoryController jobHistoryController = Get.put(JobHistoryController());

  return Padding(
    padding: const EdgeInsets.only(left: 44.0, bottom: 16),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          jobHistoryController.jobHistoryModel?.data?.designations?.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: 23,
                child: jodTitle(
                    jobTitleText: jobHistoryController
                            .jobHistoryModel?.data?.designations?[index].name ??
                        "",
                    subTitleText: jobHistoryController.jobHistoryModel?.data
                            ?.designations?[index].startDate ??
                        "",
                    subEndText: jobHistoryController.jobHistoryModel?.data
                            ?.designations?[index].endDate ??
                        "")),
          ],
        );
      },
    ),
  );
}

Widget jobHisDepartmentView() {
  JobHistoryController jobHistoryController = Get.put(JobHistoryController());

  return Padding(
    padding: const EdgeInsets.only(left: 44.0, bottom: 16),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          jobHistoryController.jobHistoryModel?.data?.departments?.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: 23,
                child: jodTitle(
                    jobTitleText: jobHistoryController
                            .jobHistoryModel?.data?.departments?[index].name ??
                        "",
                    subTitleText: jobHistoryController.jobHistoryModel?.data
                            ?.departments?[index].startDate ??
                        "",
                    subEndText: jobHistoryController.jobHistoryModel?.data
                            ?.departments?[index].endDate ??
                        "")),
          ],
        );
      },
    ),
  );
}

Widget jobHisRoleView() {
  JobHistoryController jobHistoryController = Get.put(JobHistoryController());

  return Padding(
    padding: const EdgeInsets.only(left: 44.0, bottom: 16),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobHistoryController.jobHistoryModel?.data?.roles?.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: 23,
                child: jodTitleRole(
                  jobTitleText: jobHistoryController
                          .jobHistoryModel?.data?.roles?[index].name ??
                      "",
                )),
          ],
        );
      },
    ),
  );
}

Widget jobHisWorkShiftView() {
  JobHistoryController jobHistoryController = Get.put(JobHistoryController());

  return Padding(
    padding: const EdgeInsets.only(left: 44.0, bottom: 16),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          jobHistoryController.jobHistoryModel?.data?.workingShifts?.length,
      itemBuilder: (context, index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            dottedView(),
            Positioned(
                left: 23,
                child: jodTitle(
                    jobTitleText: jobHistoryController.jobHistoryModel?.data
                            ?.workingShifts?[index].name ??
                        "",
                    subTitleText: jobHistoryController.jobHistoryModel?.data
                            ?.workingShifts?[index].startDate ??
                        "",
                    subEndText: jobHistoryController.jobHistoryModel?.data
                            ?.workingShifts?[index].endDate ??
                        "")),
          ],
        );
      },
    ),
  );
}
