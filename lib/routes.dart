import 'package:flutter/material.dart';
import 'package:front_end_test_vista/home/home_screen.dart';
import 'package:front_end_test_vista/list company/list_company_screen.dart';
import 'package:front_end_test_vista/create company/create_company_screen.dart';
import 'package:front_end_test_vista/create service/create_service_screen.dart';

class Routes {
  static const String home = '/';
  static const String listCompany = '/list-company';
  static const String createCompany = '/create-company';
  static const String createService = '/create-service';
}

final Map<String, WidgetBuilder> appRoutes = {
  Routes.home: (context) => HomeScreen(),
  Routes.listCompany: (context) => CompanyListScreen(),
  Routes.createCompany: (context) => CreateCompanyScreen(),
  Routes.createService: (context) => CreateServiceScreen(),
}; 