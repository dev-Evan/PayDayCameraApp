import 'dart:async';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pay_day_mobile/common/widget/error_alert_pop_up.dart';
import 'package:pay_day_mobile/common/widget/error_snackbar.dart';
import 'package:pay_day_mobile/common/widget/success_snakbar.dart';
import 'package:pay_day_mobile/modules/attendance/data/attendance_data_repository.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_details/log_details.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_entry/log_entry_request.dart';
import 'package:pay_day_mobile/modules/attendance/domain/log_entry/log_entry_response.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/logger.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_color.dart';
import '../../domain/check_entry_status/check_entry_status.dart';
import '../../domain/daily_log/daily_log.dart';
import 'break_controller.dart';

class AttendanceController extends GetxController with StateMixin {
  final AttendanceDataRepository _attendanceDataRepository =
      AttendanceDataRepository(NetworkClient());
  final isLoading=false.obs;

  @override
  void onInit() async {
    await checkUserIsPunchedIn();
    await getDailyLog();
    super.onInit();
  }

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
  Rx<Duration> balanceDuration = const Duration().obs;
  final currentIndex = 0.obs;
  LogDetails logDetailsById=LogDetails();
  List<BreakTimes> breakTimes = [];
  Rx<BreakDetails> breakDetails = BreakDetails().obs;
  int lastAttendanceId = 0;

  checkUserIsPunchedIn() async {
    change(null, status: RxStatus.loading());
    await _attendanceDataRepository.checkEntryStatus().then((checkEntryStatus) {
      try {
        isPunchIn.value = checkEntryStatus.data!.punchIn!;
        lastAttendanceId = checkEntryStatus.data!.lastAttendanceId ?? 0;
        breakTimes = checkEntryStatus.data!.breakTimes!;
        breakDetails.value =
            checkEntryStatus.data!.breakDetails ?? BreakDetails();
        LoggerHelper.infoLog(message: isPunchIn.value.toString());
      } catch (e) {
        LoggerHelper.errorLog(message: e.toString());
      }
    }, onError: (error) {
      if (error.message.startsWith("Unauthenticated")) {
        Get.offNamed(Routes.SIGN_IN);
        Get.delete<AttendanceController>();
      } else {
        LoggerHelper.errorLog(message: error.message);
        if (!Get.isDialogOpen!) {
          errorAlertPopup(_reloadPage);
        }
      }
    });
    change(null, status: RxStatus.success());
  }

  Future<bool> punchIn(LogEntryRequest punchInRequest) async {
    bool returnValue = false;
    isLoading(true);

    await _attendanceDataRepository
        .punchIn(punchInRequest: punchInRequest)
        .then((value) {
      isLoading(false);
      checkUserIsPunchedIn();
      getDailyLog();
      startTimer();
      showCustomSnackBar(message: value.message ?? "");
      returnValue = true;
      LoggerHelper.infoLog(message: value.message ?? "");
    }, onError: (error) {
      isLoading(false);
      errorSnackBar(errorMessage: error.message);
      returnValue = false;
      LoggerHelper.errorLog(message: error.message);
    });
    isLoading(false);
    return returnValue;
  }

  Future<bool> punchOut(LogEntryRequest punchOutRequest) async {
    bool returnValue = false;
    isLoading(true);
    await _attendanceDataRepository
        .punchOut(
      punchOutRequest: punchOutRequest,
    )
        .then(
      (LogEntryResponse value) {
        isLoading(false);
        checkUserIsPunchedIn();
        getDailyLog();
        stopTimer();
        showCustomSnackBar(message: value.message ?? "");
        _endBreak();
        returnValue = true;
        LoggerHelper.infoLog(message: value.message ?? "");
      },
      onError: (error) {
        isLoading(false);

        errorSnackBar(errorMessage: error.message);
        returnValue = false;
        LoggerHelper.errorLog(message: error.message);
      },
    );
    isLoading(false);
    return returnValue;
  }

  getDailyLog() async {
    change(null, status: RxStatus.loading());
    await _attendanceDataRepository.getDailyLog().then((dailyLogs) {
      logs.value = dailyLogs;
      //set the duration value for timer
      // it may have some existing value[other device or removing app from bg]
      duration =
          Duration(minutes: (dailyLogs.data?.todayWorked * 60).toInt()).obs;
      countdownDuration =
          Duration(minutes: (logs.value.data?.todayShortage * 60).toInt()).obs;
      balanceDuration =
          Duration(minutes: (dailyLogs.data?.todayOvertime * 60).toInt()).obs;

      if (isPunchIn.isTrue && !timer.isActive) {
        startTimer();
      }
      LoggerHelper.infoLog(message: dailyLogs.message);
    }, onError: (error) {
      if (!error.message.startsWith("Unauthenticated")) {
        if (!Get.isDialogOpen!) {
          errorAlertPopup(_reloadPage);
        }
      }
      LoggerHelper.errorLog(message: error.message);
    });
    change(null, status: RxStatus.success());
  }

  logDetails(int logId) async {
    change(null, status: RxStatus.loading());
    await _attendanceDataRepository.getLogDetails(logId).then(((logDetails) {
      logDetailsById = logDetails;
      LoggerHelper.infoLog(message: logDetails.message);
    }), onError: (error) {
      errorSnackBar(errorMessage: error!.message);
      LoggerHelper.errorLog(message: error.message);
    });
    change(null, status: RxStatus.success());
  }

  Future<bool> changeAttendance(
      {required int logId,
      required String inTime,
      required String outTime,
      required String note}) async {
    bool returnValue = false;
    isLoading(true);
    await _attendanceDataRepository
        .changeAttendanceRequest(
            logId: logId, note: note, outTime: outTime, inTime: inTime)
        .then((value) {
      isLoading(false);
      returnValue = true;
      LoggerHelper.infoLog(message: value.message);
    }, onError: (error) {
      isLoading(false);

      LoggerHelper.errorLog(message: error.message);
      errorSnackBar(errorMessage: error.message);
      returnValue = false;
    });
    isLoading(false);
    return returnValue;
  }

  getLatLong() async {
    change(null, status: RxStatus.loading());
    ipAddress.value = await Ipify.ipv4();
    await _determinePosition().then((value) async {
      lat.value = value.latitude;
      long.value = value.longitude;
      await _getAddress(value.latitude, value.longitude);
      change(null, status: RxStatus.success());
    }).catchError((error) {
      LoggerHelper.errorLog(message: error.message);
      change(null, status: RxStatus.success());
    });
  }

//For convert lat long to address
  _getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    address.value = "${placemarks[0].street!} ${placemarks[0].country!}";
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
      _startBalanceTimer();
    });
  }

  void stopTimer() async {
    timer.cancel();
  }

  void _timer() {
    duration.value = Duration(minutes: duration.value.inMinutes + 1);
  }

  void _countDown() {
    countdownDuration.value =
        Duration(minutes: countdownDuration.value.inMinutes - 1);
  }

  void _startBalanceTimer() {
    balanceDuration.value =
        Duration(minutes: balanceDuration.value.inMinutes + 1);
  }

  showToast(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.hintColor,
      textColor: Colors.white,
      fontSize: 16.0);

  void _endBreak() {
    if (Get.find<AttendanceController>().breakDetails.value.id != null) {
      Get.find<BreakController>().endBreak(
          logId: Get.find<AttendanceController>()
                  .logs
                  .value
                  .data!
                  .dailyLogs![0]
                  .id
                  ?.toInt() ??
              0,
          breakId:
              Get.find<AttendanceController>().breakDetails.value.breakTimeId ??
                  0);
      Get.find<BreakController>().stopTimer();
    }
  }

  _reloadPage() async {
    await checkUserIsPunchedIn();
    await getDailyLog();
  }
}
