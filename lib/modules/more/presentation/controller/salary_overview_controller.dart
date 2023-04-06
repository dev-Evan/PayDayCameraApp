//
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:pay_day_mobile/network/network_client.dart';
// import 'package:pay_day_mobile/utils/app_string.dart';
//
// import '../../domain/salary_overview.dart';
//
//
// class SalaryOverviewController extends GetxController{
//
// var baseUrl=AppString.BASE_URL+AppString.SALARY_OVERVIEW;
// final _connect = GetConnect();
// SalaryOverView?salaryOverView;
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
//         salaryOverView =SalaryOverView.fromJson(data);
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




import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import '../../domain/salary_overview.dart';


class SalaryOverviewController extends GetxController{
  var baseUrl=AppString.SALARY_OVERVIEW;
  SalaryOverView?salaryOverView;

  RxBool loading = false.obs;
  @override
  void onInit() {
    salaryOverViewApi();
    super.onInit();
  }
  final NetworkClient _networkClient = NetworkClient();
  void salaryOverViewApi()async{
    loading.value=true;
    try{
      final response = await _networkClient.getRequest(baseUrl,);
      var data = response.body ;
      if(response.statusCode==200){
        loading.value=false;
        salaryOverView =SalaryOverView.fromJson(data);
        print(data.toString());
      }
    }
    catch(error){
      print(error);
    }
  }

}