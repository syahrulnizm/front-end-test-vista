import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateServiceBloc extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  bool success = false;

  Future<void> createService({
    required int companyId,
    required String name,
    required String description,
    required double price,
  }) async {
    isLoading = true;
    error = null;
    success = false;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.87:3000/services'), //tukar ip address 192.168.0.87 
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'companyId': companyId,
          'name': name,
          'description': description,
          'price': price,
        }),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        success = true;
      } else {
        error = 'Failed to create service';
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
