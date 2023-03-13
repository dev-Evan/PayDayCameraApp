class ErrorModel {
  bool? _status;
  String? _message;

  ErrorModel({bool? status, String? message, List<Null>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (message != null) {
      this._message = message;
    }
  }

  bool? get status => _status;
  String? get message => _message;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
  }
}
