class ChangePasswordModel {
  bool? _status;
  String? _message;
  Data? _data;

  ChangePasswordModel({bool? status, String? message, Data? data}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get message => _message;
  set message(String? message) => _message = message;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  String? _oldPassword;
  String? _newPassword;
  String? _confirmPassword;

  Data({
    String? oldPassword,
    String? newPassword,
    String? confirmPassword,
  }) {
    if (oldPassword != null) {
      this._oldPassword = oldPassword;
    }
    if (newPassword != null) {
      this._newPassword = newPassword;
    }
    if (confirmPassword != null) {
      this._confirmPassword = confirmPassword;
    }
  }

  String? get oldPassword => _oldPassword;
  set newPassword(String? firstName) => _newPassword = firstName;
  String? get confirmPassword => _confirmPassword;

  Data.fromJson(Map<String, dynamic> json) {
    _oldPassword = json['first_name'];
    _newPassword = json['last_name'];
    _confirmPassword = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['old_password'] = this._oldPassword;
    data['password'] = this._newPassword;
    data['password_confirmation'] = this._confirmPassword;

    return data;
  }
}
