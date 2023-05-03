
class PayrunBadgeModel {
  bool? status;
  String? message;
  Data? data;

  PayrunBadgeModel({this.status, this.message, this.data});

  PayrunBadgeModel.fromJson(Map<String, dynamic> json) {
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
  DefaultPayrun? defaultPayrun;
  Setting? payrunSetting;
  List<PayrunBeneficiaries>? payrunBeneficiaries;

  Data({this.defaultPayrun, this.payrunSetting, this.payrunBeneficiaries});

  Data.fromJson(Map<String, dynamic> json) {
    defaultPayrun = json['default_payrun'] != null
        ? new DefaultPayrun.fromJson(json['default_payrun'])
        : null;
    payrunSetting = json['payrun_setting'] != null
        ? new Setting.fromJson(json['payrun_setting'])
        : null;
    if (json['payrun_beneficiaries'] != null) {
      payrunBeneficiaries = <PayrunBeneficiaries>[];
      json['payrun_beneficiaries'].forEach((v) {
        payrunBeneficiaries!.add(new PayrunBeneficiaries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.defaultPayrun != null) {
      data['default_payrun'] = this.defaultPayrun!.toJson();
    }
    if (this.payrunSetting != null) {
      data['payrun_setting'] = this.payrunSetting!.toJson();
    }
    if (this.payrunBeneficiaries != null) {
      data['payrun_beneficiaries'] =
          this.payrunBeneficiaries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DefaultPayrun {
  int? id;
  String? name;
  int? isDefault;
  int? tenantId;
  String? createdAt;
  String? updatedAt;
  Setting? setting;
  List<Beneficiaries>? beneficiaries;

  DefaultPayrun(
      {this.id,
        this.name,
        this.isDefault,
        this.tenantId,
        this.createdAt,
        this.updatedAt,
        this.setting,
        this.beneficiaries});

  DefaultPayrun.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isDefault = json['is_default'];
    tenantId = json['tenant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    setting =
    json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
    if (json['beneficiaries'] != null) {
      beneficiaries = <Beneficiaries>[];
      json['beneficiaries'].forEach((v) {
        beneficiaries!.add(new Beneficiaries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_default'] = this.isDefault;
    data['tenant_id'] = this.tenantId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    if (this.beneficiaries != null) {
      data['beneficiaries'] =
          this.beneficiaries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Setting {
  int? id;
  String? payrunSettingableType;
  int? payrunSettingableId;
  String? payrunPeriod;
  String? considerType;
  int? considerOvertime;
  String? createdAt;
  String? updatedAt;

  Setting(
      {this.id,
        this.payrunSettingableType,
        this.payrunSettingableId,
        this.payrunPeriod,
        this.considerType,
        this.considerOvertime,
        this.createdAt,
        this.updatedAt});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    payrunSettingableType = json['payrun_settingable_type'];
    payrunSettingableId = json['payrun_settingable_id'];
    payrunPeriod = json['payrun_period'];
    considerType = json['consider_type'];
    considerOvertime = json['consider_overtime'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['payrun_settingable_type'] = this.payrunSettingableType;
    data['payrun_settingable_id'] = this.payrunSettingableId;
    data['payrun_period'] = this.payrunPeriod;
    data['consider_type'] = this.considerType;
    data['consider_overtime'] = this.considerOvertime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Beneficiaries {
  int? id;
  String? beneficiaryValuableType;
  int? beneficiaryValuableId;
  int? beneficiaryId;
  int? amount;
  int? isPercentage;
  String? createdAt;
  String? updatedAt;
  Beneficiary? beneficiary;

  Beneficiaries(
      {this.id,
        this.beneficiaryValuableType,
        this.beneficiaryValuableId,
        this.beneficiaryId,
        this.amount,
        this.isPercentage,
        this.createdAt,
        this.updatedAt,
        this.beneficiary});

  Beneficiaries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beneficiaryValuableType = json['beneficiary_valuable_type'];
    beneficiaryValuableId = json['beneficiary_valuable_id'];
    beneficiaryId = json['beneficiary_id'];
    amount = json['amount'];
    isPercentage = json['is_percentage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    beneficiary = json['beneficiary'] != null
        ? new Beneficiary.fromJson(json['beneficiary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['beneficiary_valuable_type'] = this.beneficiaryValuableType;
    data['beneficiary_valuable_id'] = this.beneficiaryValuableId;
    data['beneficiary_id'] = this.beneficiaryId;
    data['amount'] = this.amount;
    data['is_percentage'] = this.isPercentage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.beneficiary != null) {
      data['beneficiary'] = this.beneficiary!.toJson();
    }
    return data;
  }
}

class Beneficiary {
  int? id;
  String? name;
  String? type;
  int? isActive;
  Null? description;
  int? tenantId;
  Null? createdAt;
  Null? updatedAt;

  Beneficiary(
      {this.id,
        this.name,
        this.type,
        this.isActive,
        this.description,
        this.tenantId,
        this.createdAt,
        this.updatedAt});

  Beneficiary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    isActive = json['is_active'];
    description = json['description'];
    tenantId = json['tenant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['is_active'] = this.isActive;
    data['description'] = this.description;
    data['tenant_id'] = this.tenantId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PayrunBeneficiaries {
  int? id;
  String? beneficiaryValuableType;
  int? beneficiaryValuableId;
  int? beneficiaryId;
  double? amount;
  int? isPercentage;
  String? createdAt;
  String? updatedAt;
  Beneficiary? beneficiary;

  PayrunBeneficiaries(
      {this.id,
        this.beneficiaryValuableType,
        this.beneficiaryValuableId,
        this.beneficiaryId,
        this.amount,
        this.isPercentage,
        this.createdAt,
        this.updatedAt,
        this.beneficiary});

  PayrunBeneficiaries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    beneficiaryValuableType = json['beneficiary_valuable_type'];
    beneficiaryValuableId = json['beneficiary_valuable_id'];
    beneficiaryId = json['beneficiary_id'];
    amount = json['amount'];
    isPercentage = json['is_percentage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    beneficiary = json['beneficiary'] != null
        ? new Beneficiary.fromJson(json['beneficiary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['beneficiary_valuable_type'] = this.beneficiaryValuableType;
    data['beneficiary_valuable_id'] = this.beneficiaryValuableId;
    data['beneficiary_id'] = this.beneficiaryId;
    data['amount'] = this.amount;
    data['is_percentage'] = this.isPercentage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.beneficiary != null) {
      data['beneficiary'] = this.beneficiary!.toJson();
    }
    return data;
  }
}
