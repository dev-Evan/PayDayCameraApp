class UserProfile {
  bool? status;
  String? message;
  Data? data;

  UserProfile({this.status, this.message, this.data});

  UserProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
      {this.id,
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
        this.workingShiftType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    address = json['address'];
    contact = json['contact'];
    aboutMe = json['about_me'];
    profilePictureUrl = json['profile_picture_url'];
    userStatus = json['user_status'];
    designationName = json['designation_name'];
    departmentName = json['department_name'];
    employmentStatus = json['employment_status'];
    workingShiftName = json['working_shift_name'];
    workingShiftType = json['working_shift_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['address'] = this.address;
    data['contact'] = this.contact;
    data['about_me'] = this.aboutMe;
    data['profile_picture_url'] = this.profilePictureUrl;
    data['user_status'] = this.userStatus;
    data['designation_name'] = this.designationName;
    data['department_name'] = this.departmentName;
    data['employment_status'] = this.employmentStatus;
    data['working_shift_name'] = this.workingShiftName;
    data['working_shift_type'] = this.workingShiftType;
    return data;
  }
}
