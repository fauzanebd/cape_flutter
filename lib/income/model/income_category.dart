// To parse this JSON data, do
//
//     final incomeCategory = incomeCategoryFromJson(jsonString);

import 'dart:convert';

List<IncomeCategory> incomeCategoryListFromJson(String str) =>
    List<IncomeCategory>.from(
        json.decode(str).map((x) => IncomeCategory.fromJson(x)));

String incomeCategoryToJson(List<IncomeCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncomeCategory {
  IncomeCategory({
    this.data,
    this.id,
  });

  Data? data;
  String? id;

  factory IncomeCategory.fromJson(Map<String, dynamic> json) => IncomeCategory(
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
