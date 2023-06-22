class AddressDetailsModel {
  bool? status;
  String? message;
  Data? data;

  AddressDetailsModel({this.status, this.message, this.data});

  AddressDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  PresentAddress? presentAddress;
  PermanentAddress? permanentAddress;

  Data({this.presentAddress, this.permanentAddress});

  Data.fromJson(Map<String, dynamic> json) {
    presentAddress = json['present_address'] != null
        ? PresentAddress.fromJson(json['present_address'])
        : null;
    permanentAddress = json['permanent_address'] != null
        ? PermanentAddress.fromJson(json['permanent_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (presentAddress != null) {
      data['present_address'] = presentAddress!.toJson();
    }
    if (permanentAddress != null) {
      data['permanent_address'] = permanentAddress!.toJson();
    }
    return data;
  }
}

class PresentAddress {
  String? details;
  String? area;
  String? city;
  dynamic state;
  dynamic zipCode;
  dynamic country;
  dynamic phoneNumber;

  PresentAddress(
      {this.details,
        this.area,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.phoneNumber});

  PresentAddress.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    country = json['country'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['details'] = details;
    data['area'] = area;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['country'] = country;
    data['phone_number'] = phoneNumber;
    return data;
  }
}

class PermanentAddress {
  String? details;
  String? area;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? phoneNumber;

  PermanentAddress(
      {this.details,
        this.area,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.phoneNumber});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    country = json['country'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['details'] = details;
    data['area'] = area;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['country'] = country;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
