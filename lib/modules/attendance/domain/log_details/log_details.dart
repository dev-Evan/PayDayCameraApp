class LogDetails {
  bool? _status;
  String? _message;
  Data? _data;

  LogDetails({bool? status, String? message, Data? data}) {
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

  LogDetails.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? _id;
  String? _inTime;
  String? _outTime;
  int? _attendanceId;
  String? _inIpData;
  String? _outIpData;
  int? _statusId;
  dynamic _reviewBy;
  dynamic _addedBy;
  dynamic _attendanceDetailsId;
  String? _createdAt;
  String? _updatedAt;
  List<Comments>? _comments;

  Data(
      {int? id,
      String? inTime,
      String? outTime,
      int? attendanceId,
      String? inIpData,
      String? outIpData,
      int? statusId,
      dynamic reviewBy,
      dynamic addedBy,
      dynamic attendanceDetailsId,
      String? createdAt,
      String? updatedAt,
      List<Comments>? comments}) {
    if (id != null) {
      _id = id;
    }
    if (inTime != null) {
      _inTime = inTime;
    }
    if (outTime != null) {
      _outTime = outTime;
    }
    if (attendanceId != null) {
      _attendanceId = attendanceId;
    }
    if (inIpData != null) {
      _inIpData = inIpData;
    }
    if (outIpData != null) {
      _outIpData = outIpData;
    }
    if (statusId != null) {
      _statusId = statusId;
    }
    if (reviewBy != null) {
      _reviewBy = reviewBy;
    }
    if (addedBy != null) {
      _addedBy = addedBy;
    }
    if (attendanceDetailsId != null) {
      _attendanceDetailsId = attendanceDetailsId;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (comments != null) {
      _comments = comments;
    }
  }

  int? get id => _id;

  String? get inTime => _inTime;

  String? get outTime => _outTime;

  int? get attendanceId => _attendanceId;

  String? get inIpData => _inIpData;

  String? get outIpData => _outIpData;

  int? get statusId => _statusId;

  dynamic get reviewBy => _reviewBy;

  dynamic get addedBy => _addedBy;

  dynamic get attendanceDetailsId => _attendanceDetailsId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<Comments>? get comments => _comments;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _inTime = json['in_time'];
    _outTime = json['out_time'];
    _attendanceId = json['attendance_id'];
    _inIpData = json['in_ip_data'];
    _outIpData = json['out_ip_data'];
    _statusId = json['status_id'];
    _reviewBy = json['review_by'];
    _addedBy = json['added_by'];
    _attendanceDetailsId = json['attendance_details_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['comments'] != null) {
      _comments = <Comments>[];
      json['comments'].forEach((v) {
        _comments!.add(Comments.fromJson(v));
      });
    }
  }
}

class Comments {
  int? _id;
  int? _userId;
  String? _type;
  String? _comment;
  dynamic _parentId;

  Comments(
      {int? id, int? userId, String? type, String? comment, Null? parentId}) {
    if (id != null) {
      _id = id;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (type != null) {
      _type = type;
    }
    if (comment != null) {
      _comment = comment;
    }
    if (parentId != null) {
      _parentId = parentId;
    }
  }

  int? get id => _id;

  int? get userId => _userId;

  String? get type => _type;

  String? get comment => _comment;

  dynamic? get parentId => _parentId;

  Comments.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _type = json['type'];
    _comment = json['comment'];
    _parentId = json['parent_id'];
  }
}
