import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../data/announcement_repo.dart';
import '../../domain/announcement_model.dart';

class AnnouncementController extends GetxController with StateMixin {
  AnnouncementModel announcementModel = AnnouncementModel();
  AnnouncementRepository announcementRepo =
      AnnouncementRepository(NetworkClient());

  late ScrollController announceScrollController;
  final RxBool isFloatingActionVisible = false.obs;
  RxList announcementIndex = [].obs;
  @override
  void onInit() {
    announceScrollController = ScrollController()
      ..addListener(() {
        print("Called:: getMoreAnnouncement");
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
      print("Get value ::::: .$announcementModelData");
      announcementIndex.clear();
      print("1st length:: ${announcementIndex.value.length}");
      announcementModel = announcementModelData;
      announcementModelData.data!.announcements
          ?.map((e) => announcementIndex.value.add(e))
          .toList(growable: true);
    }, onError: (error) {
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }

  getMoreAnnouncement() {
    if (announcementModel.data!.meta!.currentPage! <
        announcementModel.data!.meta!.totalPages!) {
      isFloatingActionVisible.value = true;
      announcementRepo
          .getAnnouncement(
              pageInt: announcementModel.data!.meta!.currentPage! + 1)
          .then((AnnouncementModel announcementModelData) {
        print(announcementModelData);
        announcementModel = announcementModelData;
        announcementModelData.data!.announcements!
            .map((e) => announcementIndex.value.add(e))
            .toList();
        isFloatingActionVisible.value = false;
        print("2st length:: ${announcementIndex.value.length}");
      }, onError: (error) {
        print(error.message);
        isFloatingActionVisible.value = false;
      });
    }
  }
}
