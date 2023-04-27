class LogEntryResponse {
  bool? _status;
  String? _message;

  LogEntryResponse({bool? status, String? message}) {
    if (status != null) {
      _status = status;
    }
    if (message != null) {
      _message = message;
    }
  }

  bool? get status => _status;
  String? get message => _message;

  LogEntryResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
  }

}
