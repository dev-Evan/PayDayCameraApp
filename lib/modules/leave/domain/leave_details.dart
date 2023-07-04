class LeaveDetails {
  bool? status;
  String? message;
  Data? data;

  LeaveDetails({this.status, this.message, this.data});

  LeaveDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? leaveType;
  String? leaveStatus;
  String? leaveStatusClass;
  String? leaveDuration;
  int? attachmentCount;
  String? startAt;
  String? endAt;
  String? reasonNote;
  List<Logs>? logs;
  List<Attachments>? attachments;

  Data(
      {this.id,
        this.leaveType,
        this.leaveStatus,
        this.leaveStatusClass,
        this.leaveDuration,
        this.attachmentCount,
        this.startAt,
        this.endAt,
        this.reasonNote,
        this.logs,
        this.attachments});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leaveType = json['leave_type'];
    leaveStatus = json['leave_status'];
    leaveStatusClass=json['clas_name'];
    leaveDuration = json['leave_duration'];
    attachmentCount = json['attachment_count'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    reasonNote = json['reason_note'];
    if (json['logs'] != null) {
      logs = <Logs>[];
      json['logs'].forEach((v) {
        logs!.add(Logs.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attachments.fromJson(v));
      });
    }
  }

}

class Logs {
  String? level;
  String? logDate;
  String? logTime;
  String? logBy;
  String? comment;

  Logs({this.level, this.logDate, this.logTime, this.logBy, this.comment});

  Logs.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    logDate = json['log_date'];
    logTime = json['log_time'];
    logBy = json['log_by'];
    comment = json['comment'];
  }

}

class Attachments {
  String? type;
  String? fullUrl;

  Attachments({this.type, this.fullUrl});

  Attachments.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    fullUrl = json['full_url'];
  }

}
