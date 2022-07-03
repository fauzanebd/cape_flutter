// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'dart:convert';

List<Plan> planListFromJson(String str) =>
    List<Plan>.from(json.decode(str).map((x) => Plan.fromJson(x)));

String planToJson(List<Plan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plan {
  Plan({
    this.data,
    this.id,
  });

  Data? data;
  String? id;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
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
    this.planTitle,
    this.planDate,
    this.targetDate,
    this.planDetails,
    this.targetAmount,
    this.userId,
    this.icId,
  });

  String? planTitle;
  DateTime? planDate;
  DateTime? targetDate;
  String? planDetails;
  int? targetAmount;
  String? userId;
  String? icId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        planTitle: json["plan_title"],
        planDate: DateTime.parse(json["plan_date"]),
        targetDate: DateTime.parse(json["target_date"]),
        planDetails: json["plan_details"],
        targetAmount: json["target_amount"],
        userId: json["user_id"],
        icId: json["ic_id"],
      );

  Map<String, dynamic> toJson() => {
        "plan_title": planTitle,
        "plan_date":
            "${planDate!.year.toString().padLeft(4, '0')}-${planDate!.month.toString().padLeft(2, '0')}-${planDate!.day.toString().padLeft(2, '0')}",
        "target_date":
            "${targetDate!.year.toString().padLeft(4, '0')}-${targetDate!.month.toString().padLeft(2, '0')}-${targetDate!.day.toString().padLeft(2, '0')}",
        "plan_details": planDetails,
        "target_amount": targetAmount,
        "user_id": userId,
        "ic_id": icId,
      };
}
