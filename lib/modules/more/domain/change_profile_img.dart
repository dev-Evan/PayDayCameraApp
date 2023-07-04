// To parse this JSON data, do
//
//     final profileImageModel = profileImageModelFromJson(jsonString);

import 'dart:convert';

ProfileImageModel profileImageModelFromJson(String str) => ProfileImageModel.fromJson(json.decode(str));

String profileImageModelToJson(ProfileImageModel data) => json.encode(data.toJson());

class ProfileImageModel {
  ProfileImageModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<dynamic>? data;

  factory ProfileImageModel.fromJson(Map<String, dynamic> json) => ProfileImageModel(
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
