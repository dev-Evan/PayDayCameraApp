//
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:pay_day_mobile/network/network_client.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
//
// import '../../domain/salary_overview_rep.dart';
//
//
// class SalaryOverviewController extends GetxController{
//
// var baseUrl=AppString.BASE_URL+AppString.SALARY_OVERVIEW;
// final _connect = GetConnect();
// SalaryOverViewModel?salaryOverView;
// RxBool loading = false.obs;
// @override
// void onInit() {
//   salaryOverViewApi();
//   super.onInit();
// }
// final NetworkClient _networkClient = NetworkClient();
//   void salaryOverViewApi()async{
//     loading.value=true;
//     try{
//       final response = await _connect.get(baseUrl,
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Access-Control-Allow-Origin': "*",
//           'Authorization': 'Bearer 34|jLoLoZwDOREPNdzTUU4y8h3kZz93ngMslgogb0l6',
//           // 'Authorization': 'Bearer $storeToken',
//         },
//       );
//       var data = response.body ;
//       if(response.statusCode==200){
//         loading.value=false;
//         salaryOverView =SalaryOverViewModel.fromJson(data);
//         print(data.toString());
//       }
//     }
//     catch(error){
//       print(error);
//     }
//   }
//
//
// }

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/more/data/salary_overview_rep.dart';
import 'package:pay_day_mobile/modules/more/domain/salary_overview.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class SalaryOverviewController extends GetxController with StateMixin {
  SalaryOverViewModel? salaryOverView;
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  SalaryOverViewRepository salaryOverViewRepository =
      SalaryOverViewRepository(NetworkClient());

  getUserData() async {
    change(null, status: RxStatus.loading());
    try {
      await salaryOverViewRepository.getSalaryOverViewData().then((value) {
        print(value);
        salaryOverView = value;
      }, onError: (error) {
        print(error.message);
      });

      change(null, status: RxStatus.success());
    } catch (ex) {
      print(ex.toString());
    }
  }
}
