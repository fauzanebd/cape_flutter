import 'dart:convert';
import 'dart:io';

import 'package:cape_flutter/accounts/models/account.dart';
import 'package:cape_flutter/debt/model/debt.dart';
import 'package:cape_flutter/expense/model/expense.dart';
import 'package:cape_flutter/income/model/income_category.dart';
import 'package:cape_flutter/invoice/model/invoice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../expense/model/expense_category.dart';
import '../income/model/income.dart';
import '../plan/model/plan.dart';

class ApiService {
  static var client = http.Client();

  static Future<List<Income>?> fetchIncomes(String userId) async {
    var response = await client.get(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/userId/incomes'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return incomeListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Expense>?> fetchExpenses(String userId) async {
    var response = await client.get(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/expenses'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return expenseListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Account>?> fetchAccounts(String userId) async {
    var response = await client.get(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/accounts'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return accountListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Debt>?> fetchDebts(String userId) async {
    var response = await client.get(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/debts'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return debtListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Plan>?> fetchPlans(String userId) async {
    var response = await client.get(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/plans'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return planListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Income>?> fetchIncomesByAccountId(
    String userId,
    String accountId,
  ) async {
    var response = await client.get(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/incomes?accountId=$accountId'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return incomeListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<Expense>?> fetchExpensesByAccountId(
    String userId,
    String accountId,
  ) async {
    var response = await client.get(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/expenses?accountId=$accountId'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return expenseListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<IncomeCategory>?> fetchIncomeCategories() async {
    var response = await client.get(
      Uri.parse('https://cape-node-backend.herokuapp.com/api/income_category'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return incomeCategoryListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<ExpenseCategory>?> fetchExpenseCategories() async {
    var response = await client.get(
      Uri.parse('https://cape-node-backend.herokuapp.com/api/expense_category'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return expenseCategoryListFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<String?> addAccount({
    required String userId,
    required String accountName,
    required String accountBalance,
  }) async {
    var response = await client.post(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/accounts'),
      body: {
        'account_name': accountName,
        'account_balance': accountBalance,
        'user_id': userId,
      },
    );
    if (response.statusCode == 201) {
      var jsonString = response.body;
      return jsonDecode(jsonString)['account_id'];
    } else {
      return null;
    }
  }

  static Future<String?> addIncome({
    required String userId,
    required String incomeCategoryId,
    required String incomeTitle,
    required String incomeAmount,
    required String incomeDetails,
    required String incomeDate,
    required String accountId,
  }) async {
    var response = await client.post(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/incomes'),
      body: {
        'ic_id': incomeCategoryId,
        'income_title': incomeTitle,
        'income_amount': incomeAmount,
        'income_details': incomeDetails,
        'income_date': incomeDate,
        'account_id': accountId,
        'user_id': userId,
      },
    );
    if (response.statusCode == 201) {
      var jsonString = response.body;
      return jsonDecode(jsonString)['income_id'];
    } else {
      return null;
    }
  }

  static Future<String?> updateAccount({
    required String accountName,
    required String accountBalance,
    required String userId,
    required String accountId,
  }) async {
    var response = await client.put(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/accounts/$accountId'),
      body: {
        'account_name': accountName,
        'account_balance': accountBalance,
        'user_id': userId,
      },
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return jsonDecode(jsonString)['message'];
    } else {
      return null;
    }
  }

  static Future<String?> deleteAccount({
    required String userId,
    required String accountId,
  }) async {
    var response = await client.delete(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/accounts/$accountId'),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return jsonDecode(jsonString)['message'];
    } else {
      return null;
    }
  }

  static Future<String?> addExpense({
    required String userId,
    required String expenseCategoryId,
    required String expenseTitle,
    required String expenseAmount,
    required String expenseDetails,
    required String expenseDate,
    required String accountId,
  }) async {
    var response = await client.post(
      Uri.parse(
          'https://cape-node-backend.herokuapp.com/api/users/$userId/expenses'),
      body: {
        'ec_id': expenseCategoryId,
        'expense_title': expenseTitle,
        'expense_amount': expenseAmount,
        'expense_details': expenseDetails,
        'expense_date': expenseDate,
        'account_id': accountId,
        'user_id': userId,
      },
    );
    if (response.statusCode == 201) {
      var jsonString = response.body;
      return jsonDecode(jsonString)['expense_id'];
    } else {
      return null;
    }
  }

  static Future<InvoiceData?> scanInvoice({
    required File imageFile,
  }) async {
    String fileName = imageFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
        contentType: MediaType('image', fileName.split('.').last),
      ),
      // "image": UploadFileInfo()
    });

    Dio dio = new Dio();
    String endPoint =
        'https://cape-node-backend.herokuapp.com/api/cogserv/scanInvoice';
    // dio.post(endPoint, data: formData);
    try {
      var response = await dio.post(endPoint, data: formData);
      if (response.statusCode == 200) {
        var jsonString = response.toString();
        return invoiceDataFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      throw e;
      // return null;
    }

    // var response = await client.post(
    //   Uri.parse(
    //       'https://cape-node-backend.herokuapp.com/api/cogserv/scanInvoice'),
    //   body: map,
    // );
    // if (response.statusCode == 200) {
    //   var jsonString = response.body;
    //   return invoiceDataFromJson(jsonString);
    // } else {
    //   return null;
    // }
  }
}
