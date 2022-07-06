// To parse this JSON data, do
//
//     final expenseCategory = expenseCategoryFromJson(jsonString);

import 'dart:convert';

List<ExpenseCategory> expenseCategoryListFromJson(String str) =>
    List<ExpenseCategory>.from(
        json.decode(str).map((x) => ExpenseCategory.fromJson(x)));

String expenseCategoryToJson(List<ExpenseCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpenseCategory {
  ExpenseCategory({
    this.data,
    this.id,
  });

  Data? data;
  String? id;

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      ExpenseCategory(
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
    this.categoryDetails,
    this.categoryName,
    this.categoryIcon,
  });

  String? categoryDetails;
  String? categoryName;
  String? categoryIcon;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryDetails: json["category_details"],
        categoryName: json["category_name"],
        categoryIcon: json["category_icon"],
      );

  Map<String, dynamic> toJson() => {
        "category_details": categoryDetails,
        "category_name": categoryName,
        "category_icon": categoryIcon,
      };
}
