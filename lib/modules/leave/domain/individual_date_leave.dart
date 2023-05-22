class IndividualDateLeave {
  bool? status;
  String? message;
  List<Data>? data;

  @override
  String toString() {
    return 'IndividualDateLeave{status: $status, message: $message, data: $data}';
  }

  IndividualDateLeave({this.status, this.message, this.data});

  IndividualDateLeave.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? userId;
  String? leaveDuration;
  String? date;
  String? month;
  String? test;
  String? durationType;
  String? leaveStatus;
  String? leaveStatusClass;
  String? leaveType;

  Data(
      {this.id,
      this.userId,
      this.leaveDuration,
      this.date,
      this.month,
      this.test,
      this.durationType,
      this.leaveStatus,
      this.leaveStatusClass,
      this.leaveType});

  @override
  String toString() {
    return 'Data{id: $id, userId: $userId, leaveDuration: $leaveDuration, date: $date, month: $month, test: $test, durationType: $durationType, leaveStatus: $leaveStatus, leaveStatusClass: $leaveStatusClass, leaveType: $leaveType}';
  }

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    leaveDuration = json['leave_duration'];
    date = json['date'];
    month = json['month'];
    test = json['test'];
    durationType = json['duration_type'];
    leaveStatus = json['leave_status'];
    leaveStatusClass = json['leave_status_class'];
    leaveType = json['leave_type'];
  }
}
