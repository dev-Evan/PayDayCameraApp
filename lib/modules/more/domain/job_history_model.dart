import 'dart:convert';

JobHistoryModel jobHistoryModelFromJson(String str) => JobHistoryModel.fromJson(json.decode(str));

String jobHistoryModelToJson(JobHistoryModel data) => json.encode(data.toJson());

class JobHistoryModel {
  JobHistoryModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory JobHistoryModel.fromJson(Map<String, dynamic> json) => JobHistoryModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.joiningDate,
    this.designations,
    this.departments,
    this.roles,
    this.workingShifts,
    this.employmentStatuses,
  });

  String? joiningDate;
  List<Department>? designations;
  List<Department>? departments;
  List<Role>? roles;
  List<Department>? workingShifts;
  List<Department>? employmentStatuses;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    joiningDate: json["joining_date"],
    designations: json["designations"] == null ? [] : List<Department>.from(json["designations"]!.map((x) => Department.fromJson(x))),
    departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
    roles: json["roles"] == null ? [] : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
    workingShifts: json["working_shifts"] == null ? [] : List<Department>.from(json["working_shifts"]!.map((x) => Department.fromJson(x))),
    employmentStatuses: json["employment_statuses"] == null ? [] : List<Department>.from(json["employment_statuses"]!.map((x) => Department.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "joining_date": joiningDate,
    "designations": designations == null ? [] : List<dynamic>.from(designations!.map((x) => x.toJson())),
    "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x.toJson())),
    "working_shifts": workingShifts == null ? [] : List<dynamic>.from(workingShifts!.map((x) => x.toJson())),
    "employment_statuses": employmentStatuses == null ? [] : List<dynamic>.from(employmentStatuses!.map((x) => x.toJson())),
  };
}

class Department {
  Department({
    this.id,
    this.name,
    this.departmentId,
    this.startDate,
    this.endDate,
    this.designationId,
    this.employmentStatusId,
    this.workingShiftId,
  });

  int? id;
  String? name;
  int? departmentId;
  String? startDate;
  String? endDate;
  int? designationId;
  int? employmentStatusId;
  int? workingShiftId;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    departmentId: json["department_id"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    designationId: json["designation_id"],
    employmentStatusId: json["employment_status_id"],
    workingShiftId: json["working_shift_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "department_id": departmentId,
    "start_date": startDate,
    "end_date": endDate,
    "designation_id": designationId,
    "employment_status_id": employmentStatusId,
    "working_shift_id": workingShiftId,
  };
}

class Role {
  Role({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
