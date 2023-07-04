class LeaveRecord {
  bool? status;
  String? message;
  Data? data;

  LeaveRecord({this.status, this.message, this.data});

  LeaveRecord.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  @override
  String toString() {
    return 'LeaveRecord{status: $status, message: $message, data: $data}';
  }
}

class Data {
  List<LeaveRecords>? leaveRecords;
  Pagination? pagination;

  Data({this.leaveRecords, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['leave_records'] != null) {
      leaveRecords = <LeaveRecords>[];
      json['leave_records'].forEach((v) {
        leaveRecords!.add(LeaveRecords.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  @override
  String toString() {
    return 'Data{leaveRecords: $leaveRecords, pagination: $pagination}';
  }
}

class LeaveRecords {
  String? month;
  List<Leaves>? leaves;

  LeaveRecords({this.month, this.leaves});

  LeaveRecords.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    if (json['leaves'] != null) {
      leaves = <Leaves>[];
      json['leaves'].forEach((v) {
        leaves!.add(Leaves.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return 'LeaveRecords{month: $month, leaves: $leaves}';
  }
}

class Leaves {
  int? id;
  int? userId;
  String? leaveDuration;
  String? date;
  String? month;
  String? startAt;
  String? endAt;
  String? durationType;
  String? leaveStatus;
  String? leaveStatusClass;
  String? leaveType;

  Leaves(
      {this.id,
        this.userId,
        this.leaveDuration,
        this.date,
        this.month,
        this.startAt,
        this.endAt,
        this.durationType,
        this.leaveStatus,
        this.leaveStatusClass,
        this.leaveType});

  Leaves.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    leaveDuration = json['leave_duration'];
    date = json['date'];
    month = json['month'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    durationType = json['duration_type'];
    leaveStatus = json['leave_status'];
    leaveStatusClass = json['leave_status_class'];
    leaveType = json['leave_type'];
  }

  @override
  String toString() {
    return 'Leaves{id: $id, userId: $userId, leaveDuration: $leaveDuration, date: $date, month: $month, startAt: $startAt, endAt: $endAt, durationType: $durationType, leaveStatus: $leaveStatus, leaveStatusClass: $leaveStatusClass, leaveType: $leaveType}';
  }
}

class Pagination {
  Links? links;
  Meta? meta;

  Pagination({this.links, this.meta});

  Pagination.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

}

class Meta {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Meta(
      {this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

}
