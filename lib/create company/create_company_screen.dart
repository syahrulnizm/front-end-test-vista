import 'package:flutter/material.dart';
import 'package:front_end_test_vista/widgets/appbar.dart';
import 'package:front_end_test_vista/create company/create_company_bloc.dart';
import 'package:provider/provider.dart';

class CreateCompanyScreen extends StatefulWidget {
  const CreateCompanyScreen({super.key});

  @override
  State<CreateCompanyScreen> createState() => _CreateCompanyScreenState();
}

class _CreateCompanyScreenState extends State<CreateCompanyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _registrationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _registrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateCompanyBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFD),
        appBar: const CustomAppBar(title: 'Create Company'),
        body: Consumer<CreateCompanyBloc>(
          builder: (context, bloc, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // company name field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Company Name',
                        labelStyle: TextStyle(color: Colors.grey[600]),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter company name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // registration number field
                    TextFormField(
                      controller: _registrationController,
                      decoration: InputDecoration(
                        labelText: 'Registration Number',
                        labelStyle: TextStyle(color: Colors.grey[600]),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter registration number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    if (bloc.error != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          bloc.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    if (bloc.success)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          'Company created successfully!',
                          style: TextStyle(color: Colors.green[700]),
                        ),
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: bloc.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  await bloc.createCompany(
                                    name: _nameController.text,
                                    registrationNumber: _registrationController.text,
                                  );
                                  if (bloc.success) {
                                    _nameController.clear();
                                    _registrationController.clear();
                                  }
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1976D2),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: bloc.isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Create Company',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
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