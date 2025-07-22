import 'package:flutter/material.dart';
import 'package:front_end_test_vista/home/home_screen.dart';
import 'package:front_end_test_vista/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vista',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: Routes.home,
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}

