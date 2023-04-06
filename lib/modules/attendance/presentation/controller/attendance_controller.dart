import 'dart:async';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay_day_mobile/common/error_alert_pop_up.dart';
import 'package:pay_day_mobile/modules/attendance/data/attendance_data_repository.dart';
import 'package:pay_day_mobile/modules/attendance/domain/change_log/change_log.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_details/log_details.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_entry/log_entry_request.dart';
import 'package:pay_day_mobile/network/error_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_string.dart';
import '../../domain/change_request/change_request_req_model.dart';
import '../../domain/change_request/change_request_respose.dart';
import '../../domain/check_entry_status/check_entry_status.dart';
import '../../domain/daily_log/daily_log.dart';
import '../../domain/log_entry/log_entry_response.dart';

class AttendanceController extends GetxController with StateMixin {
  @override
  void onInit() async {
    // await checkUserIsPunchedIn();
    // await getDailyLog();
    // // duration =
    // //     Duration(minutes: (logs.value.data?.todayWorked * 60).toInt()).obs;
    // // countdownDuration =
    // //     Duration(minutes: (logs.value.data?.todayShortage * 60).toInt()).obs;
    // super.onInit();
  }

  final AttendanceDataRepository _attendanceDataRepository =
      AttendanceDataRepository(NetworkClient());

  final RxBool isPunchIn = false.obs;
  final TextEditingController editTextController = TextEditingController();
  final RxDouble lat = 0.0.obs;
  final RxDouble long = 0.0.obs;
  final RxString address = "Current Location".obs;
  final RxString addressOut = "Current Location".obs;
  final RxString ipAddress = "".obs;
  final Rx<DailyLog> logs = DailyLog().obs;
  Timer timer = Timer(Duration.zero, () {});
  Rx<Duration> duration = const Duration().obs;
  Rx<Duration> countdownDuration = const Duration().obs;
  final currentIndex = 0.obs;
  late LogDetails logDetailsById;

  checkUserIsPunchedIn() async {
    change(null, status: RxStatus.loading());
    await _attendanceDataRepository.checkEntryStatus().then((checkEntryStatus) {
      print(checkEntryStatus.toString());
      isPunchIn.value = checkEntryStatus.data!.punchIn!;
      if (checkEntryStatus.data!.punchIn == true && !timer.isActive) {
        startTimer();
      }
    }, onError: (error) {
      if (error.message!.startsWith("Unauthenticated")) {
        Get.toNamed(AppString.signInScreen);
      }
    });
    change(null, status: RxStatus.success());
  }

  punchIn(LogEntryRequest punchInRequest) {
    change(null, status: RxStatus.loading());
    try {
      _attendanceDataRepository.punchIn(punchInRequest: punchInRequest).then(
          (value) async {
        startTimer();
        await checkUserIsPunchedIn();
        await getDailyLog();
      }, onError: (error) => showToast(error.message));
    } catch (ex) {
      print(ex.toString());
    }
    change(null, status: RxStatus.success());
  }

  punchOut(LogEntryRequest punchOutRequest) async {
    change(null, status: RxStatus.loading());
    await _attendanceDataRepository
        .punchOut(
      punchOutRequest: punchOutRequest,
    )
        .then(
      (value) async {
        stopTimer();
        await checkUserIsPunchedIn();
        await getDailyLog();
      },
      onError: (error) => showToast(error.toString()),
    );
    change(null, status: RxStatus.success());
  }

  getDailyLog() async {
    change(null, status: RxStatus.loading());
    await _attendanceDataRepository.getDailyLog().then((dailyLogs) {
      logs.value = dailyLogs;
      print(logs.value);
    }, onError: (error) {
      print("Error::${error.message}");
    });
    change(null, status: RxStatus.success());
  }

  logDetails(int logId) async {
    change(null, status: RxStatus.loading());
    await _attendanceDataRepository.getLogDetails(logId).then(((logDetails) {
      logDetailsById = logDetails;
      print(logDetails.toString());
    }), onError: (error) {
      print(error.message);
    });
    change(null, status: RxStatus.success());
  }

  // changeLogRequest(int logId) async {
  //   Either<ErrorModel, ChangeLog> response =
  //       await _attendanceDataRepository.changeLog(logId);
  // }

  // changeAttendanceRequest(
  //     int logId, ChangeRequestReqModel changeRequestReqModel) async {
  //   Either<ErrorModel, ChangeRequestResponseModel> response =
  //       await _attendanceDataRepository.changeAttendanceRequest(
  //           logId, changeRequestReqModel);
  // }

  getLatLong() async {
    change(null, status: RxStatus.loading());
    ipAddress.value = await Ipify.ipv4();
    Future<Position> data = _determinePosition();
    data.then((value) {
      lat.value = value.latitude;
      long.value = value.longitude;
      print("${value.latitude}, ${value.longitude}");
      _getAddress(value.latitude, value.longitude);
      change(null, status: RxStatus.success());
    }).catchError((error) {
      print("Error $error");
      change(null, status: RxStatus.success());
    });
  }

//For convert lat long to address
  _getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    address.value = "${placemarks[0].street!} ${placemarks[0].country!}";
    // for (int i = 0; i < placemarks.length; i++) {
    //   print("INDEX $i ${placemarks[i]}");
    // }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _timer();
      _countDown();
    });
  }

  void stopTimer() async {
    timer.cancel();
  }

  void _timer() {
    duration.value = Duration(minutes: duration.value.inMinutes + 1);
    print(duration.value);
  }

  void _countDown() {
    countdownDuration.value =
        Duration(minutes: countdownDuration.value.inMinutes - 1);
  }

  showToast(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.hintColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
