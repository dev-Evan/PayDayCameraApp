import 'dart:convert';

BasicInfo basicInfoFromJson(String str) => BasicInfo.fromJson(json.decode(str));

String basicInfoToJson(BasicInfo data) => json.encode(data.toJson());

class BasicInfo {
  BasicInfo({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.companyName,
    required this.companyIcon,
    required this.language,
    required this.dateFormat,
    required this.timeFormat,
    required this.timeZone,
    required this.currencySymbol,
    required this.decimalSeparator,
    required this.thousandSeparator,
    required this.numberOfDecimal,
    required this.currencyPosition,
    required this.companyLogo,
  });

  String companyName;
  String companyIcon;
  String language;
  String dateFormat;
  String timeFormat;
  String timeZone;
  String currencySymbol;
  String decimalSeparator;
  String thousandSeparator;
  String numberOfDecimal;
  String currencyPosition;
  String companyLogo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    companyName: json["company_name"],
    companyIcon: json["company_icon"],
    language: json["language"],
    dateFormat: json["date_format"],
    timeFormat: json["time_format"],
    timeZone: json["time_zone"],
    currencySymbol: json["currency_symbol"],
    decimalSeparator: json["decimal_separator"],
    thousandSeparator: json["thousand_separator"],
    numberOfDecimal: json["number_of_decimal"],
    currencyPosition: json["currency_position"],
    companyLogo: json["company_logo"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "company_icon": companyIcon,
    "language": language,
    "date_format": dateFormat,
    "time_format": timeFormat,
    "time_zone": timeZone,
    "currency_symbol": currencySymbol,
    "decimal_separator": decimalSeparator,
    "thousand_separator": thousandSeparator,
    "number_of_decimal": numberOfDecimal,
    "currency_position": currencyPosition,
    "company_logo": companyLogo,
  };
}
