// To parse this JSON data, do
//
//     final invoiceData = invoiceDataFromJson(jsonString);

import 'dart:convert';

InvoiceData invoiceDataFromJson(String str) =>
    InvoiceData.fromJson(json.decode(str));

String invoiceDataToJson(InvoiceData data) => json.encode(data.toJson());

class InvoiceData {
  InvoiceData({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory InvoiceData.fromJson(Map<String, dynamic> json) => InvoiceData(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.receiptType,
    this.merchantName,
    this.transactionDate,
    this.items,
    this.total,
  });

  String? receiptType;
  String? merchantName;
  DateTime? transactionDate;
  String? items;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        receiptType: json["receiptType"],
        merchantName: json["merchantName"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        items: json["items"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "receiptType": receiptType,
        "merchantName": merchantName,
        "transactionDate": transactionDate!.toIso8601String(),
        "items": items,
        "total": total,
      };
}
