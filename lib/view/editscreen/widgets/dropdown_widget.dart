import 'package:blood_donation/controller/donor_provider.dart';
import 'package:flutter/material.dart';

class EditDropDown extends StatelessWidget {
  const EditDropDown({super.key, required this.donorProvider, required this.bloodgroups});

   final DonorProvider donorProvider;
  final List<String> bloodgroups;

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField(
              value: donorProvider.selectedgroups,
            decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: Colors.white),
        hintText: 'Select Blood Group',
        hintStyle: const TextStyle( color: Colors.red, fontWeight: FontWeight.bold),
      ),
              items: bloodgroups
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (value) {
                donorProvider.selectedgroups=value;
              },

                validator: (value) {
        if (value == null) {
          return 'Select Blood Group';
        } else {
          return null;
        }
  });
  }
}