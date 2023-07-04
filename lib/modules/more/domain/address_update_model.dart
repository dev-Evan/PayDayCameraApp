import 'dart:convert';

AddressUpdateModel addressUpdateModelFromJson(String str) => AddressUpdateModel.fromJson(json.decode(str));

String addressUpdateModelToJson(AddressUpdateModel data) => json.encode(data.toJson());

class AddressUpdateModel {
  AddressUpdateModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<dynamic>? data;

  factory AddressUpdateModel.fromJson(Map<String, dynamic> json) => AddressUpdateModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}
