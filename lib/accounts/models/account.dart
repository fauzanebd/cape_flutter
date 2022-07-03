// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'dart:convert';

List<Account> accountListFromJson(String str) =>
    List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));

String accountToJson(List<Account> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Account {
  Account({
    this.data,
    this.id,
  });

  Data? data;
  String? id;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
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
    this.accountBalance,
    this.accountName,
  });

  String? userId;
  int? accountBalance;
  String? accountName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        accountBalance: int.parse(json["account_balance"]),
        accountName: json["account_name"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "account_balance": accountBalance,
        "account_name": accountName,
      };
}
