class ChangeRequestResponseModel {
  bool? _status;
  String? _message;
  Data? _data;

  ChangeRequestResponseModel({bool? status, String? message, Data? data}) {
    if (status != null) {
      _status = status;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  bool? get status => _status;

  String? get message => _message;

  Data? get data => _data;

  ChangeRequestResponseModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  dynamic _headers;
  Original? _original;
  String? _exception;

  Data({dynamic headers, Original? original, String? exception}) {
    if (headers != null) {
      _headers = headers;
    }
    if (original != null) {
      _original = original;
    }
    if (exception != null) {
      _exception = exception;
    }
  }

  dynamic get headers => _headers;

  Original? get original => _original;

  String? get exception => _exception;


  Data.fromJson(Map<String, dynamic> json) {
    _headers = json['headers'];
    _original = json['original'] != null
        ? Original.fromJson(json['original'])
        : null;
    _exception = json['exception'];
  }

}

class Original {
  bool? _status;
  String? _message;

  Original({bool? status, String? message}) {
    if (status != null) {
      _status = status;
    }
    if (message != null) {
      _message = message;
    }
  }

  bool? get status => _status;

  String? get message => _message;

  Original.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
  }
}
