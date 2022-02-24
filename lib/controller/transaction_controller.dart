import 'dart:convert';

import 'package:expense_manager/model/login_model.dart';
import 'package:expense_manager/network/http_requests.dart';

import 'package:expense_manager/utils/api_constants.dart';
import 'package:expense_manager/utils/api_response.dart';
import 'package:flutter/material.dart';
import 'package:result_type/result_type.dart';

class TransactionController extends ChangeNotifier {
  bool isLoading = true;

  String message = '';

  bool success = false;
  late HttpRequest httpRequest;

  late ApiResponse apiResponse;

  TransactionController() {
    apiResponse = ApiResponse.loading(false);
    httpRequest = HttpRequest();
  }

  void transaction(
      String payeeName, String amount, String date, String type) async {
    apiResponse = ApiResponse.loading(true);
    notifyListeners();

    final Map<String, String> data = {
      "payee_name": payeeName,
      "amount": amount,
      "date": date,
      "type": type.toUpperCase(),
    };
    try {
      var response =
          await httpRequest.postWithAuth(ApiConstants.createTransaction, data);
      if (response['status'] == 'success') {
        success = true;
        apiResponse = ApiResponse.success(false, success);
      } else {
        apiResponse = ApiResponse.error(false, "Could not Transaction");
      }

      // return Success(true);
    } catch (e) {
      print(e);
      // return Failure('Could not login');
      apiResponse = ApiResponse.error(false, "Could not Transaction");
    }

    notifyListeners();
  }
}
