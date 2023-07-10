import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../data/announcement_repo.dart';
import '../../domain/announcement_model.dart';

class AnnouncementController extends GetxController with StateMixin {
  AnnouncementModel announcementModel = AnnouncementModel();
  AnnouncementRepository announcementRepo = AnnouncementRepository(NetworkClient());
  late ScrollController announceScrollController;
  final RxBool isFloatingActionVisible = false.obs;
  RxList announcementIndex = [].obs;
  @override
  void onInit() {
    announceScrollController = ScrollController()
      ..addListener(() {
        if (announceScrollController.position.atEdge) {
          if (announceScrollController.position.pixels > 0) {
            if (isFloatingActionVisible.isTrue) {
              isFloatingActionVisible(false);
            }
          }
        } else {
          if (isFloatingActionVisible.isFalse) {
            isFloatingActionVisible(true);
          }
        }
      });
    announceScrollController = ScrollController()
      ..addListener(() {
        if (announceScrollController.position.pixels ==
            announceScrollController.position.maxScrollExtent) {
          getMoreAnnouncement();
        }
      });
    super.onInit();
  }

  getAnnouncement() {
    change(null, status: RxStatus.loading());
    announcementRepo.getAnnouncement(pageInt: 1).then(
        (AnnouncementModel announcementModelData) {
      announcementIndex.clear();
      announcementModel = announcementModelData;
      announcementModelData.data!.announcements
          ?.map((e) => announcementIndex.add(e))
          .toList(growable: true);
      change(null, status: RxStatus.success());
        }, onError: (error) {
      print("Get Announcement ::: ${error.message}");
    });
  }

  getMoreAnnouncement() {
    if (announcementModel.data!.meta!.currentPage! <
        announcementModel.data!.meta!.totalPages!) {
      isFloatingActionVisible.value = true;
      announcementRepo
          .getAnnouncement(
              pageInt: announcementModel.data!.meta!.currentPage! + 1)
          .then((AnnouncementModel announcementModelData) {
        announcementModel = announcementModelData;
        announcementModelData.data!.announcements!
            .map((e) => announcementIndex.add(e))
            .toList();
        isFloatingActionVisible.value = false;
      }, onError: (error) {
        print("Get More Announcement ::: ${error.message}");
        isFloatingActionVisible.value = false;
      });
    }
  }
}
