import 'package:flutter/material.dart';
import 'package:front_end_test_vista/widgets/appbar.dart';
import 'package:front_end_test_vista/widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      appBar: const CustomAppBar(title: 'Services'),
      body: Center( // Wrap the Column with Center
        child: SingleChildScrollView( // Add scrollable for small screens
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Important for centering
            children: [
              // list company
              ServiceButton(
                icon: Icons.business,
                color: const Color(0xFF2E7D32),
                title: 'List Company',
                subtitle: 'Show a list of services under each company',
                onPressed: () {
                  // Handle button press
                },
              ),
              const SizedBox(height: 16),
              
              // create company
              ServiceButton(
                icon: Icons.add_business,
                color: const Color(0xFF1976D2),
                title: 'Create Company',
                subtitle: 'Form to create a new company',
                onPressed: () {
                  // Handle button press
                },
              ),
              const SizedBox(height: 16),
              
              // create service
              ServiceButton(
                icon: Icons.design_services,
                color: const Color(0xFFF57C00),
                title: 'Create Service',
                subtitle: 'Form to create a new service',
                onPressed: () {
                  // Handle button press
                },
              ),
              const SizedBox(height: 24), // Extra space at bottom
            ],
          ),
        ),
      ),
    );
  }
}