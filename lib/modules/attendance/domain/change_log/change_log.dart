class ChangeLog {
  bool? _status;
  String? _message;
  Data? _data;

  ChangeLog({bool? status, String? message, Data? data}) {
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


  ChangeLog.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ?  Data.fromJson(json['data']) : null;
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
  dynamic _parentAttendanceDetails;
  List<Comments>? _comments;
  Status? _status;
  dynamic _reviewer;
  Attendance? _attendance;
  dynamic _assignBy;

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
        dynamic parentAttendanceDetails,
        List<Comments>? comments,
        Status? status,
        dynamic reviewer,
        Attendance? attendance,
        dynamic assignBy}) {
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
    if (parentAttendanceDetails != null) {
      _parentAttendanceDetails = parentAttendanceDetails;
    }
    if (comments != null) {
      _comments = comments;
    }
    if (status != null) {
      _status = status;
    }
    if (reviewer != null) {
      _reviewer = reviewer;
    }
    if (attendance != null) {
      _attendance = attendance;
    }
    if (assignBy != null) {
      _assignBy = assignBy;
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
  dynamic get parentAttendanceDetails => _parentAttendanceDetails;
  List<Comments>? get comments => _comments;
  Status? get status => _status;
  dynamic get reviewer => _reviewer;
  Attendance? get attendance => _attendance;
  dynamic get assignBy => _assignBy;

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
    _parentAttendanceDetails = json['parent_attendance_details'];
    if (json['comments'] != null) {
      _comments = <Comments>[];
      json['comments'].forEach((v) {
        _comments!.add( Comments.fromJson(v));
      });
    }
    _status =
    json['status'] != null ?  Status.fromJson(json['status']) : null;
    _reviewer = json['reviewer'];
    _attendance = json['attendance'] != null
        ?  Attendance.fromJson(json['attendance'])
        : null;
    _assignBy = json['assign_by'];
  }

}

class Comments {
  int? _id;
  int? _userId;
  String? _type;
  String? _comment;
  dynamic _parentId;
  String? _createdAt;
  String? _updatedAt;
  User? _user;

  Comments(
      {int? id,
        int? userId,
        String? type,
        String? comment,
        dynamic parentId,
        String? createdAt,
        String? updatedAt,
        User? user}) {
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
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (user != null) {
      _user = user;
    }
  }

  int? get id => _id;
  int? get userId => _userId;
  String? get type => _type;
  String? get comment => _comment;
  dynamic get parentId => _parentId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  User? get user => _user;

  Comments.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _type = json['type'];
    _comment = json['comment'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
}

class User {
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _fullName;

  User({int? id, String? firstName, String? lastName, String? fullName}) {
    if (id != null) {
      _id = id;
    }
    if (firstName != null) {
      _firstName = firstName;
    }
    if (lastName != null) {
      _lastName = lastName;
    }
    if (fullName != null) {
      _fullName = fullName;
    }
  }

  int? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get fullName => _fullName;


  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _fullName = json['full_name'];
  }

}

class Status {
  int? _id;
  String? _name;
  String? _translatedName;

  Status({int? id, String? name, String? translatedName}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (translatedName != null) {
      _translatedName = translatedName;
    }
  }

  int? get id => _id;

  String? get name => _name;

  String? get translatedName => _translatedName;


  Status.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _translatedName = json['translated_name'];
  }

}

class Attendance {
  int? _id;
  int? _userId;
  User? _user;

  Attendance({int? id, int? userId, User? user}) {
    if (id != null) {
      _id = id;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (user != null) {
      _user = user;
    }
  }

  int? get id => _id;
  int? get userId => _userId;
  User? get user => _user;

  Attendance.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
