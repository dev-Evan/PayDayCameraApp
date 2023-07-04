class ErrorModel {
  bool? _status;
  String? _message;

  ErrorModel({bool? status, String? message, List<Null>? data}) {
    if (status != null) {
     _status = status;
    }
    if (message != null) {
    _message = message;
    }
  }

  bool? get status => _status;
  String? get message => _message;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
  }

  @override
  String toString() {
    return 'ErrorModel{_status: $_status, _message: $_message}';
  }
}
