class DeletedAddressModel {
  bool? status;
  String? message;

  DeletedAddressModel({this.status, this.message, });

  DeletedAddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
    }
  }

}
