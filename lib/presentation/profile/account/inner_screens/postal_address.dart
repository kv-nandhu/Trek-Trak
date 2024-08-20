import 'package:flutter/material.dart';
import 'package:trek_trak/Application/About_bloc/profile/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressFormScreen extends StatefulWidget {
  @override
  _AddressFormScreenState createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final _addressController = TextEditingController();
  final _companyAddressController = TextEditingController();
  bool _isAddressTyped = false;
  bool _isSaving = false;

  void _onSave() async {
    setState(() {
      _isSaving = true;
    });

    // Simulate a delay for saving data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isSaving = false;
    });

    // Navigate back to the previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _isAddressTyped = value.isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 16),
            if (_isAddressTyped)
              TextFormField(
                controller: _companyAddressController,
                decoration: const InputDecoration(
                  labelText: 'Company Address',
                  border: OutlineInputBorder(),
                ),
              ),
            const Spacer(),
            _isSaving
                ? const Center(
                    child:
                        Icon(Icons.check_circle, color: Colors.green, size: 48))
                : ElevatedButton(
                    onPressed: () {
                      String address = _addressController.text;
                      String company = _companyAddressController.text;
                      BlocProvider.of<ProfileBloc>(context).add(
                        AddAddressEvent(
                            address: address, companyAddress: company),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Address saved successfully!'),
                        ),
                      );
                      _onSave();
                    },
                    //  _onSave,
                    child: const Text('Save'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
