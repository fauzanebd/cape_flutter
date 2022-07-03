// To parse this JSON data, do
//
//     final expense = expenseFromJson(jsonString);

import 'dart:convert';

List<Expense> expenseListFromJson(String str) =>
    List<Expense>.from(json.decode(str).map((x) => Expense.fromJson(x)));

String expenseToJson(List<Expense> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Expense {
  Expense({
    this.data,
    this.id,
  });

  Data? data;
  String? id;

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
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
    this.userId,
    this.expenseTitle,
    this.expenseDetails,
    this.expenseAmount,
    this.expenseDate,
    this.ecId,
    this.accountId,
  });

  String? userId;
  String? expenseTitle;
  String? expenseDetails;
  int? expenseAmount;
  DateTime? expenseDate;
  String? ecId;
  String? accountId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        expenseTitle: json["expense_title"],
        expenseDetails: json["expense_details"],
        expenseAmount: json["expense_amount"],
        expenseDate: DateTime.parse(json["expense_date"]),
        ecId: json["ec_id"],
        accountId: json["account_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "expense_title": expenseTitle,
        "expense_details": expenseDetails,
        "expense_amount": expenseAmount,
        "expense_date":
            "${expenseDate!.year.toString().padLeft(4, '0')}-${expenseDate!.month.toString().padLeft(2, '0')}-${expenseDate!.day.toString().padLeft(2, '0')}",
        "ec_id": ecId,
        "account_id": accountId,
      };
}
