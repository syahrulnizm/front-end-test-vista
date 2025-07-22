import 'package:flutter/material.dart';
import 'package:front_end_test_vista/widgets/appbar.dart';

class CompanyListScreen extends StatelessWidget {
  // hardcode dulu
  final List<Map<String, dynamic>> companies = [
    {
      'name': 'Tech Solutions Inc.',
      'registration': 'REG-12345',
      'services': ['Web Development', 'Mobile Apps', 'Cloud Services']
    },
    {
      'name': 'Design Studio LLC',
      'registration': 'REG-54321',
      'services': ['UI/UX Design', 'Branding', 'Illustration']
    },
    {
      'name': 'Consulting Partners',
      'registration': 'REG-98765',
      'services': ['Business Strategy', 'Market Research']
    },
  ];

  CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      appBar: const CustomAppBar(title: 'All Companies'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView.separated(
          itemCount: companies.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final company = companies[index];
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[200]!, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      company['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      company['registration'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Services:',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    ...company['services'].map<Widget>((service) => Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 8, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(service),
                        ],
                      ),
                    )).toList(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}