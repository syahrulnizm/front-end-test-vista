import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateCompanyBloc extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  bool success = false;

  Future<void> createCompany({required String name, required String registrationNumber}) async {
    isLoading = true;
    error = null;
    success = false;
    notifyListeners();
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.87:3000/companies'), //tukar ip address 192.168.0.87 
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'registrationNumber': registrationNumber,
        }),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        success = true;
      } else {
        error = 'Failed to create company';
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
