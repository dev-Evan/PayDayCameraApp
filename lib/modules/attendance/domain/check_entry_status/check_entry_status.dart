class CheckEntryStatus {
  bool? _status;
  String? _message;
  Data? _data;

  CheckEntryStatus({bool? status, String? message, Data? data}) {
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


  @override
  String toString() {
    return 'CheckEntryStatus{_status: $_status, _message: $_message, _data: $_data}';
  }

  CheckEntryStatus.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  bool? _punchIn;

  Data({bool? punchIn}) {
    if (punchIn != null) {
      _punchIn = punchIn;
    }
  }

  bool? get punchIn => _punchIn;

  Data.fromJson(Map<String, dynamic> json) {
    _punchIn = json['punch_in'];
  }
}
