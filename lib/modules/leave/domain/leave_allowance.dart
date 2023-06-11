class LeaveAllowance {
  bool? status;
  String? message;
  List<Data>? data;

  LeaveAllowance({this.status, this.message, this.data});


  @override
  String toString() {
    return 'LeaveAllowance{status: $status, message: $message, data: $data}';
  }

  LeaveAllowance.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? leaveStatus;
  String? leaveType;
  List<Values>? values;

  Data({this.leaveStatus, this.leaveType, this.values});


  @override
  String toString() {
    return 'Data{leaveStatus: $leaveStatus, leaveType: $leaveType, values: $values}';
  }

  Data.fromJson(Map<String, dynamic> json) {
    leaveStatus = json['leave_status'];
    leaveType = json['leave_type'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }

}

class Values {
  String? leaveType;
  String? value;


  @override
  String toString() {
    return 'Values{leaveType: $leaveType, value: $value}';
  }

  Values({this.leaveType, this.value});

  Values.fromJson(Map<String, dynamic> json) {
    leaveType = json['leave_type'];
    value = json['value'];
  }

}
