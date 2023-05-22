import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_day_mobile/modules/more/data/change_profile_image_repo.dart';


class ImagePickerController extends GetxController {
  ChangeProfileImageRepo changeProfileImageRepo =ChangeProfileImageRepo();

  var pickedImage = Rx<XFile?>(null);
  Future<void> pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      pickedImage.value = image;
      await uploadDocument(image);
    }
  }
  uploadDocument(XFile image) async{
    await changeProfileImageRepo.changeImageRepo(
      image: image,
    ).then((value) {
      print(value.toString());
    }, onError: (error) {
      print(error.message);
    });
  }











  // Future<void> sendImage(XFile image) async {
  //   try {
  //     final request = http.MultipartRequest('POST', Uri.parse(baseUrl));
  //     request.headers['Authorization'] =
  //         'Bearer $accessToken';
  //     request.fields['profile_picture'];
  //     request.files.add(
  //         await http.MultipartFile.fromPath('profile_picture', image.path));
  //     final response = await request.send();
  //     if (response.statusCode == HttpStatus.ok) {
  //       print('Image uploaded successfully!');
  //     } else {
  //       print('Failed to upload image!');
  //     }
  //   } catch (ex) {
  //     print(ex.toString());
  //   }
  // }
}
