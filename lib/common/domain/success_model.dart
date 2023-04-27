class SuccessModel{
  bool? _status;
  String? _message;

  SuccessModel({bool? status, String? message}) {
    if (status != null) {
      _status = status;
    }
    if (message != null) {
      _message = message;
    }
  }

  bool? get status => _status;
  String? get message => _message;

  SuccessModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
  }

  @override
  String toString() {
    return 'SuccessModel{_status: $_status, _message: $_message}';
  }
}