class JobHistoryModel {
  bool? status;
  String? message;
  Data? data;

  JobHistoryModel({this.status, this.message, this.data});

  JobHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
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
        designations!.add(new Designations.fromJson(v));
      });
    }
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(new Departments.fromJson(v));
      });
    }
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    if (json['working_shifts'] != null) {
      workingShifts = <WorkingShifts>[];
      json['working_shifts'].forEach((v) {
        workingShifts!.add(new WorkingShifts.fromJson(v));
      });
    }
    if (json['employment_statuses'] != null) {
      employmentStatuses = <EmploymentStatuses>[];
      json['employment_statuses'].forEach((v) {
        employmentStatuses!.add(new EmploymentStatuses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['joining_date'] = this.joiningDate;
    if (this.designations != null) {
      data['designations'] = this.designations!.map((v) => v.toJson()).toList();
    }
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) => v.toJson()).toList();
    }
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.workingShifts != null) {
      data['working_shifts'] =
          this.workingShifts!.map((v) => v.toJson()).toList();
    }
    if (this.employmentStatuses != null) {
      data['employment_statuses'] =
          this.employmentStatuses!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['designation_id'] = this.designationId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['department_id'] = this.departmentId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['working_shift_id'] = this.workingShiftId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['employment_status_id'] = this.employmentStatusId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
