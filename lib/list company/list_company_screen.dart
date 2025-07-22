import 'package:flutter/material.dart';
import 'package:front_end_test_vista/widgets/appbar.dart';
import 'package:front_end_test_vista/list company/list_company_bloc.dart';
import 'package:provider/provider.dart';

class CompanyListScreen extends StatelessWidget {
  const CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListCompanyBloc()..fetchCompanies(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFD),
        appBar: const CustomAppBar(title: 'All Companies'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Consumer<ListCompanyBloc>(
            builder: (context, bloc, _) {
              if (bloc.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (bloc.error != null) {
                return Center(child: Text('Error: \\${bloc.error}'));
              }
              if (bloc.companies.isEmpty) {
                return const Center(child: Text('No companies found.'));
              }
              return ListView.separated(
                itemCount: bloc.companies.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final company = bloc.companies[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey[200]!,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2E7D32).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.business,
                                color: Color(0xFF2E7D32),
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    company.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    company.registrationNumber,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Services:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...company.services.map((service) => Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Icon(Icons.circle, size: 8, color: Colors.grey[400]),
                              const SizedBox(width: 12),
                              Text(
                                service.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}