import 'package:get/get.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/api_endpoints.dart';
import '../domain/attendance_status.dart';

class StatusController extends GetxController {
  AttendanceStatus statusData = AttendanceStatus();

  @override
  void onInit() {
    super.onInit();
    getAttendanceStatus();
  }

  getAttendanceStatus() async {
    await NetworkClient().getRequest(Api.ATTENDANCE_STATUS).then(
        (response) {
      statusData = AttendanceStatus.fromJson(response.body);
      print("status::: ${statusData.message}");
    }, onError: (error) => print(error));
  }
}
