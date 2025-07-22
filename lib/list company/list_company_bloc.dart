import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Company {
  final int id;
  final String name;
  final String registrationNumber;
  final List<Service> services;

  Company({
    required this.id,
    required this.name,
    required this.registrationNumber,
    required this.services,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      registrationNumber: json['registrationNumber'],
      services: (json['services'] as List)
          .map((s) => Service.fromJson(s))
          .toList(),
    );
  }
}

class Service {
  final int id;
  final int companyId;
  final String name;
  final String description;
  final String price;

  Service({
    required this.id,
    required this.companyId,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      companyId: json['companyId'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}

class ListCompanyBloc extends ChangeNotifier {
  List<Company> companies = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchCompanies() async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse('http://192.168.0.87:3000/companies')); //tukar ip address 192.168.0.87 
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        companies = data.map((c) => Company.fromJson(c)).toList();
        isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Failed to load companies');
      }
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
