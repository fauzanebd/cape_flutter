// To parse this JSON data, do
//
//     final debt = debtFromJson(jsonString);

import 'dart:convert';

List<Debt> debtListFromJson(String str) =>
    List<Debt>.from(json.decode(str).map((x) => Debt.fromJson(x)));

String debtToJson(List<Debt> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Debt {
  Debt({
    this.data,
    this.id,
  });

  Data? data;
  String? id;

  factory Debt.fromJson(Map<String, dynamic> json) => Debt(
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
    this.dueDate,
    this.ecId,
    this.debtTitle,
    this.userId,
    this.debtDetails,
    this.debtAmount,
  });

  DateTime? dueDate;
  String? ecId;
  String? debtTitle;
  String? userId;
  String? debtDetails;
  int? debtAmount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dueDate: DateTime.parse(json["due_date"]),
        ecId: json["ec_id"],
        debtTitle: json["debt_title"],
        userId: json["user_id"],
        debtDetails: json["debt_details"],
        debtAmount: json["debt_amount"],
      );

  Map<String, dynamic> toJson() => {
        "due_date":
            "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
        "ec_id": ecId,
        "debt_title": debtTitle,
        "user_id": userId,
        "debt_details": debtDetails,
        "debt_amount": debtAmount,
      };
}
