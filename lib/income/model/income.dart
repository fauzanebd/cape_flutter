// To parse this JSON data, do
//
//     final income = incomeFromJson(jsonString);

import 'dart:convert';

List<Income> incomeListFromJson(String str) =>
    List<Income>.from(json.decode(str).map((x) => Income.fromJson(x)));

String incomeToJson(List<Income> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Income {
  Income({
    this.data,
    this.id,
  });

  Data? data;
  String? id;

  factory Income.fromJson(Map<String, dynamic> json) => Income(
        data: Data.fromJson(json["data"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "id": id,
      };
}

class Data {
  Data({
    this.incomeDetails,
    this.incomeDate,
    this.accountId,
    this.icId,
    this.userId,
    this.incomeAmount,
    this.incomeTitle,
  });

  String? incomeDetails;
  DateTime? incomeDate;
  String? accountId;
  String? icId;
  String? userId;
  int? incomeAmount;
  String? incomeTitle;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        incomeDetails: json["income_details"],
        incomeDate: DateTime.parse(json["income_date"]),
        accountId: json["account_id"],
        icId: json["ic_id"],
        userId: json["user_id"],
        incomeAmount: json["income_amount"],
        incomeTitle: json["income_title"],
      );

  Map<String, dynamic> toJson() => {
        "income_details": incomeDetails,
        "income_date":
            "${incomeDate!.year.toString().padLeft(4, '0')}-${incomeDate!.month.toString().padLeft(2, '0')}-${incomeDate!.day.toString().padLeft(2, '0')}",
        "account_id": accountId,
        "ic_id": icId,
        "user_id": userId,
        "income_amount": incomeAmount,
        "income_title": incomeTitle,
      };
}
