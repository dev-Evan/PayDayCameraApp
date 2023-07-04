import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.gender,
    this.dateOfBirth,
    this.address,
    this.contact,
    this.aboutMe,
    this.profilePictureUrl,
    this.userStatus,
    this.designationName,
    this.departmentName,
    this.employmentStatus,
    this.workingShiftName,
    this.workingShiftType,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? gender;
  String? dateOfBirth;
  String? address;
  String? contact;
  String? aboutMe;
  String? profilePictureUrl;
  String? userStatus;
  String? designationName;
  String? departmentName;
  String? employmentStatus;
  String? workingShiftName;
  String? workingShiftType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
    email: json["email"],
    gender: json["gender"],
    dateOfBirth: json["date_of_birth"],
    address: json["address"],
    contact: json["contact"],
    aboutMe: json["about_me"],
    profilePictureUrl: json["profile_picture_url"],
    userStatus: json["user_status"],
    designationName: json["designation_name"],
    departmentName: json["department_name"],
    employmentStatus: json["employment_status"],
    workingShiftName: json["working_shift_name"],
    workingShiftType: json["working_shift_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
    "email": email,
    "gender": gender,
    "date_of_birth": dateOfBirth,
    "address": address,
    "contact": contact,
    "about_me": aboutMe,
    "profile_picture_url": profilePictureUrl,
    "user_status": userStatus,
    "designation_name": designationName,
    "department_name": departmentName,
    "employment_status": employmentStatus,
    "working_shift_name": workingShiftName,
    "working_shift_type": workingShiftType,
  };
}
