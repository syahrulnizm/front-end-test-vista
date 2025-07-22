import 'package:flutter/material.dart';
import 'package:front_end_test_vista/widgets/appbar.dart';
import 'package:front_end_test_vista/create service/create_service_bloc.dart';
import 'package:provider/provider.dart';

class CreateServiceScreen extends StatefulWidget {
  const CreateServiceScreen({super.key});

  @override
  State<CreateServiceScreen> createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  String? _selectedCompany;

  // hardcode list
  final List<String> companies = [
    'Vista Summerose Sdn Bhd',
    'Heiktek Sdn Bhd',
    'Google Sdn Bhd.'
  ];

  // Map company name to fake ID for demo
  int? _getCompanyId(String? name) {
    if (name == null) return null;
    final idx = companies.indexOf(name);
    return idx == -1 ? null : idx + 1;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateServiceBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFD),
        appBar: const CustomAppBar(title: 'Create Service'),
        body: Consumer<CreateServiceBloc>(
          builder: (context, bloc, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // company dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.grey[200]!,
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: _selectedCompany,
                        decoration: const InputDecoration(
                          labelText: 'Company',
                          border: InputBorder.none,
                        ),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                        items: companies.map((String company) {
                          return DropdownMenuItem<String>(
                            value: company,
                            child: Text(company),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCompany = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a company';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    // service name field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Service Name',
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
                          return 'Please enter service name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // description field
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
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
                          vertical: 14,
                        ),
                      ),
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // price field
                    TextFormField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        labelText: 'Price',
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
                        prefixText: 'RM ',
                        prefixStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
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
                          'Service created successfully!',
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
                                  final companyId = _getCompanyId(_selectedCompany);
                                  if (companyId == null) return;
                                  await bloc.createService(
                                    companyId: companyId,
                                    name: _nameController.text,
                                    description: _descriptionController.text,
                                    price: double.parse(_priceController.text),
                                  );
                                  if (bloc.success) {
                                    _nameController.clear();
                                    _descriptionController.clear();
                                    _priceController.clear();
                                    setState(() {
                                      _selectedCompany = null;
                                    });
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
                                'Create Service',
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