
import 'dart:convert';

PayrunBadgeModel payrunBadgeModelFromJson(String str) => PayrunBadgeModel.fromJson(json.decode(str));


class PayrunBadgeModel {
  bool? status;
  String? message;
  Data? data;

  PayrunBadgeModel({
    this.status,
    this.message,
    this.data,
  });


  @override
  String toString() {
    return 'PayrunBadgeModel{status: $status, message: $message, data: $data}';
  }

  factory PayrunBadgeModel.fromJson(Map<String, dynamic> json) => PayrunBadgeModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  DefaultPayrun? defaultPayrun;
  Setting? payrunSetting;
  List<PayrunBeneficiaryElement>? payrunBeneficiaries;

  Data({
    this.defaultPayrun,
    this.payrunSetting,
    this.payrunBeneficiaries,
  });


  @override
  String toString() {
    return 'Data{defaultPayrun: $defaultPayrun, payrunSetting: $payrunSetting, payrunBeneficiaries: $payrunBeneficiaries}';
  }

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    defaultPayrun: json["default_payrun"] == null ? null : DefaultPayrun.fromJson(json["default_payrun"]),
    payrunSetting: json["payrun_setting"] == null ? null : Setting.fromJson(json["payrun_setting"]),
    payrunBeneficiaries: json["payrun_beneficiaries"] == null ? [] : List<PayrunBeneficiaryElement>.from(json["payrun_beneficiaries"]!.map((x) => PayrunBeneficiaryElement.fromJson(x))),
  );

}

class DefaultPayrun {
  int? id;
  String? name;
  dynamic isDefault;
  dynamic tenantId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Setting? setting;
  List<PayrunBeneficiaryElement>? beneficiaries;


  @override
  String toString() {
    return 'DefaultPayrun{id: $id, name: $name, isDefault: $isDefault, tenantId: $tenantId, createdAt: $createdAt, updatedAt: $updatedAt, setting: $setting, beneficiaries: $beneficiaries}';
  }

  DefaultPayrun({
    this.id,
    this.name,
    this.isDefault,
    this.tenantId,
    this.createdAt,
    this.updatedAt,
    this.setting,
    this.beneficiaries,
  });

  factory DefaultPayrun.fromJson(Map<String, dynamic> json) => DefaultPayrun(
    id: json["id"],
    name: json["name"],
    isDefault: json["is_default"],
    tenantId: json["tenant_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    setting: json["setting"] == null ? null : Setting.fromJson(json["setting"]),
    beneficiaries: json["beneficiaries"] == null ? [] : List<PayrunBeneficiaryElement>.from(json["beneficiaries"]!.map((x) => PayrunBeneficiaryElement.fromJson(x))),
  );

}

class PayrunBeneficiaryElement {
  int? id;
  String? beneficiaryValuableType;
  dynamic beneficiaryValuableId;
  dynamic beneficiaryId;
  double? amount;
  dynamic isPercentage;
  DateTime? createdAt;
  DateTime? updatedAt;
  PayrunBeneficiaryBeneficiary? beneficiary;


  @override
  String toString() {
    return 'PayrunBeneficiaryElement{id: $id, beneficiaryValuableType: $beneficiaryValuableType, beneficiaryValuableId: $beneficiaryValuableId, beneficiaryId: $beneficiaryId, amount: $amount, isPercentage: $isPercentage, createdAt: $createdAt, updatedAt: $updatedAt, beneficiary: $beneficiary}';
  }

  PayrunBeneficiaryElement({
    this.id,
    this.beneficiaryValuableType,
    this.beneficiaryValuableId,
    this.beneficiaryId,
    this.amount,
    this.isPercentage,
    this.createdAt,
    this.updatedAt,
    this.beneficiary,
  });

  factory PayrunBeneficiaryElement.fromJson(Map<String, dynamic> json) => PayrunBeneficiaryElement(
    id: json["id"],
    beneficiaryValuableType: json["beneficiary_valuable_type"],
    beneficiaryValuableId: json["beneficiary_valuable_id"],
    beneficiaryId: json["beneficiary_id"],
    amount: json["amount"]?.toDouble(),
    isPercentage: json["is_percentage"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    beneficiary: json["beneficiary"] == null ? null : PayrunBeneficiaryBeneficiary.fromJson(json["beneficiary"]),
  );

}

class PayrunBeneficiaryBeneficiary {
  int? id;
  String? name;
  String? type;
  dynamic isActive;
  dynamic description;
  dynamic tenantId;
  dynamic createdAt;
  dynamic updatedAt;


  @override
  String toString() {
    return 'PayrunBeneficiaryBeneficiary{id: $id, name: $name, type: $type, isActive: $isActive, description: $description, tenantId: $tenantId, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  PayrunBeneficiaryBeneficiary({
    this.id,
    this.name,
    this.type,
    this.isActive,
    this.description,
    this.tenantId,
    this.createdAt,
    this.updatedAt,
  });

  factory PayrunBeneficiaryBeneficiary.fromJson(Map<String, dynamic> json) => PayrunBeneficiaryBeneficiary(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    isActive: json["is_active"],
    description: json["description"],
    tenantId: json["tenant_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "is_active": isActive,
    "description": description,
    "tenant_id": tenantId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}




class Setting {
  int? id;
  String? payrunSettingableType;
  dynamic payrunSettingableId;
  String? payrunPeriod;
  String? considerType;
  dynamic considerOvertime;
  DateTime? createdAt;
  DateTime? updatedAt;


  @override
  String toString() {
    return 'Setting{id: $id, payrunSettingableType: $payrunSettingableType, payrunSettingableId: $payrunSettingableId, payrunPeriod: $payrunPeriod, considerType: $considerType, considerOvertime: $considerOvertime, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  Setting({
    this.id,
    this.payrunSettingableType,
    this.payrunSettingableId,
    this.payrunPeriod,
    this.considerType,
    this.considerOvertime,
    this.createdAt,
    this.updatedAt,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
    id: json["id"],
    payrunSettingableType: json["payrun_settingable_type"],
    payrunSettingableId: json["payrun_settingable_id"],
    payrunPeriod: json["payrun_period"],
    considerType: json["consider_type"],
    considerOvertime: json["consider_overtime"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

}
