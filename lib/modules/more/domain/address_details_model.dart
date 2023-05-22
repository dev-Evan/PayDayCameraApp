class AddressDetailsModel {
  bool? status;
  String? message;
  List<Data>? data;

  AddressDetailsModel({this.status, this.message, this.data});

  AddressDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }


  @override
  String toString() {
    return 'AddressDetailsModel{status: $status, message: $message, data: $data}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? key;
  Value? value;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userId,
        this.key,
        this.value,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    key = json['key'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['key'] = this.key;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Value {
  String? details;
  String? area;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? phoneNumber;

  Value(
      {this.details,
        this.area,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.phoneNumber});

  Value.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    country = json['country'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['details'] = this.details;
    data['area'] = this.area;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['country'] = this.country;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
