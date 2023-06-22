class JobHistoryModel {
  bool? status;
  String? message;
  Data? data;

  JobHistoryModel({this.status, this.message, this.data});

  JobHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? joiningDate;
  List<Designations>? designations;
  List<Departments>? departments;
  List<Roles>? roles;
  List<WorkingShifts>? workingShifts;
  List<EmploymentStatuses>? employmentStatuses;

  Data(
      {this.joiningDate,
        this.designations,
        this.departments,
        this.roles,
        this.workingShifts,
        this.employmentStatuses});

  Data.fromJson(Map<String, dynamic> json) {
    joiningDate = json['joining_date'];
    if (json['designations'] != null) {
      designations = <Designations>[];
      json['designations'].forEach((v) {
        designations!.add(Designations.fromJson(v));
      });
    }
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(Departments.fromJson(v));
      });
    }
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    if (json['working_shifts'] != null) {
      workingShifts = <WorkingShifts>[];
      json['working_shifts'].forEach((v) {
        workingShifts!.add(WorkingShifts.fromJson(v));
      });
    }
    if (json['employment_statuses'] != null) {
      employmentStatuses = <EmploymentStatuses>[];
      json['employment_statuses'].forEach((v) {
        employmentStatuses!.add(EmploymentStatuses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['joining_date'] = joiningDate;
    if (designations != null) {
      data['designations'] = designations!.map((v) => v.toJson()).toList();
    }
    if (departments != null) {
      data['departments'] = departments!.map((v) => v.toJson()).toList();
    }
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    if (workingShifts != null) {
      data['working_shifts'] =
          workingShifts!.map((v) => v.toJson()).toList();
    }
    if (employmentStatuses != null) {
      data['employment_statuses'] =
          employmentStatuses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Designations {
  int? id;
  String? name;
  int? designationId;
  String? startDate;
  String? endDate;

  Designations(
      {this.id, this.name, this.designationId, this.startDate, this.endDate});

  Designations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    designationId = json['designation_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['designation_id'] = designationId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}

class Departments {
  int? id;
  String? name;
  int? departmentId;
  String? startDate;
  String? endDate;

  Departments(
      {this.id, this.name, this.departmentId, this.startDate, this.endDate});

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departmentId = json['department_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['department_id'] = departmentId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}

class Roles {
  int? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class WorkingShifts {
  int? id;
  String? name;
  int? workingShiftId;
  String? startDate;
  String? endDate;

  WorkingShifts(
      {this.id, this.name, this.workingShiftId, this.startDate, this.endDate});

  WorkingShifts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    workingShiftId = json['working_shift_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['working_shift_id'] = workingShiftId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}

class EmploymentStatuses {
  int? id;
  String? name;
  int? employmentStatusId;
  String? startDate;
  String? endDate;

  EmploymentStatuses(
      {this.id,
        this.name,
        this.employmentStatusId,
        this.startDate,
        this.endDate});

  EmploymentStatuses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    employmentStatusId = json['employment_status_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['employment_status_id'] = employmentStatusId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}
