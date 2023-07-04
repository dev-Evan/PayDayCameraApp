class EditProfileModel {
  bool? status;
  String? message;

  EditProfileModel({this.status, this.message});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {});
    }
  }
}

