class ChangePasswordModel {
  bool? status;
  String? message;

  ChangePasswordModel({this.status, this.message});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {

      });
    }
  }
}
