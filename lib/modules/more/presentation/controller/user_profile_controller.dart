import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/data/profile_data_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/change_password.dart';
import 'package:pay_day_mobile/modules/more/domain/user_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/change_password.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../../common/widget/success_message.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/exception_handler.dart';
import '../../../auth/presentation/controller/auth_controller.dart';

class ProfileDataController extends GetxController with StateMixin {
  ProfileDataRepository profileDataRepository =
      ProfileDataRepository(NetworkClient());
  UserProfileModel userProfile = UserProfileModel();
  final isLoaded=false.obs;


  getProfileData() async {
    change(null, status: RxStatus.loading());
    await profileDataRepository.getUserProfileData().then(
        (UserProfileModel value) {
      userProfile = value;
    }, onError: (error) {
      errorChecker(error.message);
    });
    change(null, status: RxStatus.success());
  }

  changeProfileImage(XFile image) async {
    change(null, status: RxStatus.loading());
    await profileDataRepository.changeImageRepo(image: image).then((value) {
      showSuccessMessage(
          message: AppString.text_profile_picture_update_successfully);
    }, onError: (error) {
      errorChecker(error.message);
    });
    change(null, status: RxStatus.success());
  }

  editProfileData({required context, required firstName, required lastName, required email, required contact, required dob, required dropDown, required aboutMe, required address}) async {
    bool isReturnValue = false;
    change(null, status: RxStatus.loading());
      await profileDataRepository.editProfileRepo(firstName, lastName, email, contact, dob, dropDown, aboutMe, address).then((value) {
        isReturnValue = true;
      }, onError: (error) {
        isReturnValue = false;
        errorChecker(error.message);
      });
    change(null, status: RxStatus.success());
    return isReturnValue;
  }

  changePassword({required oldPassword, required newPassword, required confirmPass}) async {
    isLoaded(true);
      await profileDataRepository.changePassIntoAccount(oldPassword, newPassword, confirmPass,).then((ChangePasswordModel value) {
        GetStorage().remove(AppString.STORE_TOKEN);
        GetStorage().remove(AppString.STORE_TOKEN);
        GetStorage().remove(AppString.REMEMBER_KEY);
        GetStorage().remove(AppString.LOGIN_CHECK_KEY);
        isLoaded(false);
        showSuccessMessage(message: AppString.text_password_update_successfully);
        Get.offNamed(Routes.SIGN_IN);
        cleanPassData();
        Get.put(AuthController());
      }, onError: (error) {
        isLoaded(false);
        errorChecker(error.message);
      });
    isLoaded(false);
  }
}
