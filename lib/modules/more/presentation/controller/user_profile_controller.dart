import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/data/profile_data_repo.dart';
import 'package:pay_day_mobile/modules/more/domain/change_password.dart';
import 'package:pay_day_mobile/modules/more/domain/user_profile.dart';
import 'package:pay_day_mobile/modules/more/presentation/controller/logout_controller.dart';
import 'package:pay_day_mobile/modules/more/presentation/view/change_password.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import '../../../../common/widget/error_snackbar.dart';
import '../../../../common/widget/success_snakbar.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_string.dart';
import '../../../auth/presentation/controller/auth_controller.dart';
import '../widget/profile_container_layout.dart';


class ProfileDataController extends GetxController with StateMixin {
  ProfileDataRepository profileDataRepository =
  ProfileDataRepository(NetworkClient());



  UserProfile userProfile = UserProfile();
  @override
  void onInit() {
    getUserData();
    super.onInit();
  }


  getUserData() async {
    change(null, status: RxStatus.loading());
    await profileDataRepository.getUserProfileData().then((value) {
      userProfile = value;
      print('User profile called ::: $value');
    }, onError: (e) {
      print('User profile called ::: ${e.message}');
    });
    change(null, status: RxStatus.success());
  }

  changeProfileImage(XFile image) async {
    waitingLoader();
    await profileDataRepository
        .changeImageRepo(
      image: image,
    )
        .then((value) {
      Get.back();
      getUserData();
      showCustomSnackBar(
          message: AppString.text_profile_picture_update_successfully);
      print(value.toString());
    }, onError: (error) {
      print(error.message);
    });
  }



  void editProfileData({required context,required firstName,required lastName,required email,required contact,required dob, required dropDown,required aboutMe,required address}) async {
    waitingLoader();
    try {
      await profileDataRepository
          .editProfileRepo(firstName, lastName, email, contact, dob, dropDown, aboutMe, address)
          .then((value) {
        Get.back();
        getUserData();
        navigatorForViewProfile(context: context);
        showCustomSnackBar(message: AppString.text_profile_update_successfully);
      }, onError: (error) {
        Get.back();
        errorSnackBar(errorMessage: error.message);
      });
    } catch (ex) {
      Get.back();
      errorSnackBar(errorMessage: ex.toString());
    }
  }

  void changePassword({required oldPassword, required newPassword, required confirmPass}) async {
    waitingLoader();
    try {
      await profileDataRepository
          .changePassIntoAccount(oldPassword, newPassword, confirmPass,)
          .then((ChangePasswordModel value) {
        GetStorage().remove(AppString.STORE_TOKEN);
        Get.back();
        showCustomSnackBar(
            message: AppString.text_password_update_successfully);
        Get.offNamed(Routes.SIGN_IN);
        cleanPassData();
        Get.put(AuthController());
      }, onError: (error) {
        print(error.toString());
        Get.back();
        print(error.message);
        errorSnackBar(errorMessage: error.message);
      });
    } catch (ex) {
      Get.back();
      errorSnackBar(errorMessage: ex.toString());
    }
  }
}
