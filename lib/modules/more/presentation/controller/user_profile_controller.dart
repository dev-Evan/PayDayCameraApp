import 'package:get/get.dart';
import 'package:pay_day_mobile/modules/more/data/profile_data_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/user_profile.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class ProfileDataController extends GetxController with StateMixin {


  // @override
  // void onInit() {
  //   getUserData();
  //   super.onInit();
  // }
  UserProfile userProfile =UserProfile();
  ProfileDataRepository profileDataRepository =
      ProfileDataRepository(NetworkClient());
  getUserData() async {
    change(null, status: RxStatus.loading());
    await profileDataRepository.getUserProfileData().then((value) {
      userProfile = value;
      print(value);
    }, onError: (e) {
      print('User profile called ::: ${e.message}');
    });
    change(null, status: RxStatus.success());
  }
}
