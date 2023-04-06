import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/setting/domain/setting_model.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';




class SettingController extends GetxController{

  var baseUrl=AppString.BASE_URL+AppString.BASIC_INFO;
  final _connect = GetConnect();
  BasicInfo?basicInfo;
  RxBool loading = false.obs;
  @override
  void onInit() {
  //  settingApi();
    super.onInit();
  }
  final NetworkClient _networkClient = NetworkClient();
  void settingApi()async{
    loading.value=true;
    try{
      final response = await _connect.get(baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': "*",
          'Authorization': 'Bearer 34|jLoLoZwDOREPNdzTUU4y8h3kZz93ngMslgogb0l6',
          // 'Authorization': 'Bearer $storeToken',
        },
      );
      var data = response.body ;
      if(response.statusCode==200){
        loading.value=false;
        basicInfo =BasicInfo.fromJson(data);
        print(data.toString());
      }
    }
    catch(error){
      print(error);
    }
  }


}