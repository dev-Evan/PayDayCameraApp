class AddressDetailsModel {
  bool? status;
  String? message;
  Data? data;

  AddressDetailsModel({this.status, this.message, this.data});

  AddressDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  PresentAddress? presentAddress;
  PresentAddress? permanentAddress;

  Data({this.presentAddress, this.permanentAddress});

  Data.fromJson(Map<String, dynamic> json) {
    presentAddress = json['present_address'] != null
        ? new PresentAddress.fromJson(json['present_address'])
        : null;
    permanentAddress = json['permanent_address'] != null
        ? new PresentAddress.fromJson(json['permanent_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.presentAddress != null) {
      data['present_address'] = this.presentAddress!.toJson();
    }
    if (this.permanentAddress != null) {
      data['permanent_address'] = this.permanentAddress!.toJson();
    }
    return data;
  }
}

class PresentAddress {
  String? details;
  String? area;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? phoneNumber;
  String? countryCode;

  PresentAddress(
      {this.details,
      this.area,
      this.city,
      this.state,
      this.zipCode,
      this.country,
      this.phoneNumber,
      this.countryCode});

  PresentAddress.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    country = json['country'];
    phoneNumber = json['phone_number'];
    countryCode = json['country_code'];
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
    data['country_code'] = countryCode;
    return data;
  }
}
