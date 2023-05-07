import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pay_day_mobile/modules/more/data/profile_data_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/user_profile.dart';
import 'package:pay_day_mobile/network/network_client.dart';

class ProfileDataController extends GetxController with StateMixin {
  UserProfile userProfile =UserProfile();
  RxBool loading = false.obs;
  ProfileDataRepository profileDataRepository =
      ProfileDataRepository(NetworkClient());
  getUserData() async {
    change(null, status: RxStatus.loading());
    await profileDataRepository.getUserProfileData().then((value) {
      print(value);
      userProfile = value;
    }, onError: (error) {
      print(error.message);
    });

    change(null, status: RxStatus.success());
  }
}
