
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/data/profile_img_change_rep.dart';
import 'package:pay_day_mobile/network/network_client.dart';
import 'package:pay_day_mobile/utils/app_string.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

class ChangeProfileImgController extends GetxController {
  ProfilePicChangeRepository profilePicChangeRepository =
      ProfilePicChangeRepository(NetworkClient());

  File? pickedImage;
 // bool showSpinner = false;

  Future<void> pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);

    final ImagePicker _picker = ImagePicker();
    XFile? image1 = await _picker.pickImage(source: ImageSource.gallery);
    if (image1 != null) {
      var selected = File(image1.path);
        // _file = selected;
      changeProfileImage(img : image1.path);
    } else {
      print("No file selected");
    }

  }
  void changeProfileImage({img}) async {
    try {
      await profilePicChangeRepository.getProfilePicChange(img)
      .then((value) {
        print('Image change okay');
        print(value);
      }, onError: (error) {
        print(error.toString());
      });
    } catch (ex) {
      print(ex.toString());
    }
  }









}
